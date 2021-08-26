/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f3xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define BUZZER_Pin GPIO_PIN_2
#define BUZZER_GPIO_Port GPIOE
#define PUM0_FAULT_Pin GPIO_PIN_0
#define PUM0_FAULT_GPIO_Port GPIOC
#define PUMP1_FAULT_Pin GPIO_PIN_1
#define PUMP1_FAULT_GPIO_Port GPIOC
#define Pressure_Pin GPIO_PIN_0
#define Pressure_GPIO_Port GPIOA
#define PUMP_0_Pin GPIO_PIN_1
#define PUMP_0_GPIO_Port GPIOA
#define PUMP_1_Pin GPIO_PIN_2
#define PUMP_1_GPIO_Port GPIOA
#define VREF_Pin GPIO_PIN_3
#define VREF_GPIO_Port GPIOA
#define ENCODER_B_Pin GPIO_PIN_12
#define ENCODER_B_GPIO_Port GPIOD
#define ENCODER_A_Pin GPIO_PIN_13
#define ENCODER_A_GPIO_Port GPIOD
#define BUTTON_Pin GPIO_PIN_14
#define BUTTON_GPIO_Port GPIOD
#define BUTTON_EXTI_IRQn EXTI15_10_IRQn
#define PUMP0_START_Pin GPIO_PIN_0
#define PUMP0_START_GPIO_Port GPIOD
#define PUMP1_START_Pin GPIO_PIN_1
#define PUMP1_START_GPIO_Port GPIOD
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
