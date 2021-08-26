/*
 * TurboPump.cpp
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#include "TurboPump.h"
#include "stm32f3xx_hal.h"

TurboPump::TurboPump()
{
	label = "TP ";
}

TurboPump::TurboPump(Pin _startPin, Pin _faultPin, float _coef,
		float _maxFreq, float _maxVolt, std::string lbl, Pirani* _gauge)
{
	startPin = _startPin;
	faultPin = _faultPin;
	coef = _coef;
	maxFreq = _maxFreq;
	maxVoltage = _maxVolt;
	label = lbl + " ";
	pirani = _gauge;
}

void TurboPump::addPressureGauge(Pirani* _gauge)
{
	pirani = _gauge;
}

void TurboPump::update(float _voltage)
{
	voltage = _voltage * coef;
	frequency = maxFreq * voltage / maxVoltage;
	checkFault();
}

float TurboPump::getValue()
{
	if (frequency < 50)
	{
		return 0;
	}
	return frequency;
}


void TurboPump::checkFault()
{
	if (HAL_GPIO_ReadPin(faultPin.port(), faultPin.pin()) == GPIO_PIN_SET)
	{
		fault = true;
		stop();
	}
	else
	{
		fault = false;
	}
	if (pirani->getValue() > thres_press ||
				pirani->hasFault())
	{
		stop();
	}
}
void TurboPump::start()
{
	if (pirani->getValue() <= thres_press &&
			!pirani->hasFault())
	{
		running = true;
		HAL_GPIO_WritePin(startPin.port(), startPin.pin(), GPIO_PIN_SET);
	}
}


void TurboPump::stop()
{
	running = false;
	HAL_GPIO_WritePin(startPin.port(), startPin.pin(), GPIO_PIN_RESET);
}

std::string TurboPump::getUnit()
{
	return "Hz";
}

bool TurboPump::isRunning()
{
	return running;
}
