/*
 * Pin.h
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#pragma once
#include "stm32f3xx_hal.h"

class Pin {
private:
	GPIO_TypeDef* port_n;
	uint16_t pin_n;
public:
	Pin();
	void set(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
	GPIO_TypeDef* port();
	uint16_t pin();
};
