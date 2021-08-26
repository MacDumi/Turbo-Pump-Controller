#include "main.h"
#include "../LCDI2C.h"
#include "../Pin.h"
#include "../Pirani.h"
#include "../TurboPump.h"
#include "../Display.h"
#include <stdlib.h>
#include <stdio.h>
#include "math.h"

#define VREF 2.42
#define MAX_ADC 4096
#define AVG 5
#define TRANSMIT_INT 2000

ADC_HandleTypeDef hadc1;
I2C_HandleTypeDef hi2c1;
TIM_HandleTypeDef htim4;
TIM_HandleTypeDef htim1;
UART_HandleTypeDef huart1;

void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_I2C1_Init(void);
static void MX_TIM4_Init(void);
static void MX_TIM1_Init(void);
static void MX_ADC1_Init(void);
static void MX_USART1_UART_Init(void);
static float ConvertToVoltage(uint32_t adc_value, uint32_t cal_value);

int counter = 0, lastCounter = 0;
Pin start0, fault0, start1, fault1, buzzer;
Pirani pirani(4.49);
TurboPump tphv, tpuhv;

uint32_t adc_value[4], averages = 0;
float voltage_value[3];
uint32_t lastADC = 0, lastLCD = 0, lastSerial = 0, lastBuzzer = 0;
Display display;

// Fault values
bool fault, starting = true;
volatile bool state = true;

char buffer[128];

int main(void)
{
  HAL_Init();
  SystemClock_Config();
  MX_GPIO_Init();
  MX_I2C1_Init();
  MX_TIM4_Init();
  MX_TIM1_Init();
  MX_ADC1_Init();
  MX_USART1_UART_Init();
  HAL_TIM_Encoder_Start(&htim4, TIM_CHANNEL_ALL);

  start0.set(GPIOD, GPIO_PIN_0);
  fault0.set(GPIOC, GPIO_PIN_0);
  start1.set(GPIOD, GPIO_PIN_1);
  fault1.set(GPIOC, GPIO_PIN_1);
  buzzer.set(GPIOE, GPIO_PIN_2);
  // Varian TV301
  tphv = TurboPump(start0, fault0, 4.3, 960, 10, "P0", &pirani);

  // Turbovac
  tpuhv = TurboPump(start1, fault1, 4.3, 1200, 10, "P1", &pirani);

  display.addLCD(hi2c1, 0x4E);
  display.addTP(&tphv, 0);
  display.addTP(&tpuhv, 1);
  display.addPS(&pirani);

  uint32_t lastVal, curVal = 200;
  TIM4->CNT = 200;
  lastVal = curVal;

  while (1)
  {
	  uint32_t currentTick = HAL_GetTick();

	  // Get the ADC values
  	  if (fabsf(currentTick - lastADC) > 50)
  	  {
  		  for (int i = 0; i < 4; i++)
  		  {
  			   HAL_ADC_Start(&hadc1);
  			   HAL_ADC_PollForConversion(&hadc1, 1);
  			   adc_value[i] += HAL_ADC_GetValue(&hadc1);
  		  }

  		  lastADC = currentTick;
  		  averages++;
  		  if (averages == AVG)
  		  {
  			  for (int i = 0; i < 3; i++)
  			  {
  				  voltage_value[i] = ConvertToVoltage(adc_value[i] / AVG, adc_value[3] / AVG);
  			  }
  			  for (int i = 0; i < 4; i++)
  			  {
  				  adc_value[i] = 0;
  			  }
  			  averages = 0;

  			  pirani.update(voltage_value[0]);
  			  tphv.update(voltage_value[1]);
  			  tpuhv.update(voltage_value[2]);
  			  // Start the pumps if the pressure allows it
  			  if (starting)
  			  {
  				  tphv.start();
  				  tpuhv.start();
  				  starting = false;
  			  }

  		  }
  	  }

  	  // Update the display 5 times per second
  	  if (fabsf(currentTick - lastLCD) > 200)
  	  {
  		  display.display();
  		  lastLCD = currentTick;
  	  }

  	  // Check for faults
  	  fault = display.hasFault();
  	  // Deal with the buzzer
  	  if (fault)
  	  {
  		  if(fabsf(currentTick - lastBuzzer) > 1000)
  		  {
  			  HAL_GPIO_TogglePin(buzzer.port(), buzzer.pin());
  			  lastBuzzer = currentTick;
  		  }
  	  }
  	  else
  	  {
  		  HAL_GPIO_WritePin(buzzer.port(),
  				  	  	  	  buzzer.pin(), GPIO_PIN_RESET);
  	  }

  	  // Rotary encoder
  	  curVal = TIM4->CNT;
  	  if (curVal > lastVal)
	  {
  		  display.up();
  		  lastVal = curVal;
	  }
  	  else if (curVal < lastVal)
      {
  		  display.down();
  		  lastVal = curVal;
  	  }

  	  // Push button
	  if (counter != lastCounter)
	  {
		 display.pushDown();
		 lastCounter = counter;
	  }

	  // Send the status by serial
	  if (fabsf(currentTick - lastSerial) > TRANSMIT_INT)
	  {
		  int size = sprintf(buffer, "%s-%d: %.5f %s, %s-%d %.1f %s, %s-%d: %.1f %s\r\n",
			pirani.getLabel().c_str(), !pirani.hasFault(),
			pirani.getValue(), pirani.getUnit().c_str(),
			tphv.getLabel().c_str(), tphv.isRunning(),
			tphv.getValue(),tphv.getUnit().c_str(),
			tpuhv.getLabel().c_str(), tpuhv.isRunning(),
			tpuhv.getValue(), tpuhv.getUnit().c_str());
		  HAL_UART_Transmit(&huart1, (uint8_t *) buffer, size, 100);
		  lastSerial = currentTick;
	  }

   }
}

float ConvertToVoltage(uint32_t adc_value, uint32_t cal_value)
{
	// Convert the ADC to a voltage using the voltage reference
	return VREF * (float)(adc_value) / cal_value;
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	// When the button is pressed start the timer to debounce it
	if(GPIO_Pin == GPIO_PIN_14 && state)
    {
		HAL_TIM_Base_Start_IT(&htim1);
		state = false;
	}
	else
	{
		__NOP();
  	}
}
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	// Increment the counter for the button
	UNUSED(htim);
	if(HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_14) == GPIO_PIN_RESET)
	{
		counter++;
		state = true;
		HAL_TIM_Base_Stop_IT(&htim1);
	}
}
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL16;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_I2C1
                              |RCC_PERIPHCLK_TIM1|RCC_PERIPHCLK_ADC12;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  PeriphClkInit.Adc12ClockSelection = RCC_ADC12PLLCLK_DIV1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_HSI;
  PeriphClkInit.Tim1ClockSelection = RCC_TIM1CLK_HCLK;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}



static void MX_ADC1_Init(void)
{

  ADC_MultiModeTypeDef multimode = {0};
  ADC_ChannelConfTypeDef sConfig = {0};

  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ADC_SCAN_ENABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = ENABLE;
  hadc1.Init.NbrOfDiscConversion = 1;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 4;
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  hadc1.Init.LowPowerAutoWait = DISABLE;
  hadc1.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

  multimode.Mode = ADC_MODE_INDEPENDENT;
  if (HAL_ADCEx_MultiModeConfigChannel(&hadc1, &multimode) != HAL_OK)
  {
    Error_Handler();
  }

  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SingleDiff = ADC_SINGLE_ENDED;
  sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
  sConfig.OffsetNumber = ADC_OFFSET_NONE;
  sConfig.Offset = 0;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = ADC_REGULAR_RANK_2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  sConfig.Channel = ADC_CHANNEL_3;
  sConfig.Rank = ADC_REGULAR_RANK_3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  sConfig.Channel = ADC_CHANNEL_4;
  sConfig.Rank = ADC_REGULAR_RANK_4;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

}

static void MX_I2C1_Init(void)
{

  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x2000090E;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }

  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }

  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
  {
    Error_Handler();
  }

}

static void MX_TIM1_Init(void)
{

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};


  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 32000;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 30;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }

}

static void MX_TIM4_Init(void)
{
  TIM_Encoder_InitTypeDef sConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 1;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 65535;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  sConfig.EncoderMode = TIM_ENCODERMODE_TI1;
  sConfig.IC1Polarity = TIM_ICPOLARITY_FALLING;
  sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC1Filter = 10;
  sConfig.IC2Polarity = TIM_ICPOLARITY_FALLING;
  sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC2Filter = 10;
  if (HAL_TIM_Encoder_Init(&htim4, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }


}

static void MX_USART1_UART_Init(void)
{
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }

}

static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};


  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();


  HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, GPIO_PIN_RESET);


  HAL_GPIO_WritePin(GPIOD, PUMP0_START_Pin|PUMP1_START_Pin, GPIO_PIN_RESET);

  GPIO_InitStruct.Pin = BUZZER_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(BUZZER_GPIO_Port, &GPIO_InitStruct);


  GPIO_InitStruct.Pin = PUM0_FAULT_Pin|PUMP1_FAULT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);


  GPIO_InitStruct.Pin = BUTTON_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(BUTTON_GPIO_Port, &GPIO_InitStruct);


  GPIO_InitStruct.Pin = PUMP0_START_Pin|PUMP1_START_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);


  HAL_NVIC_SetPriority(EXTI15_10_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

}


void Error_Handler(void)
{

  __disable_irq();
  while (1)
  {
  }

}

