/*
 * Pin.cpp
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#include "Pin.h"
Pin::Pin()
{

}
void Pin::set(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
	port_n = GPIOx;
	pin_n = GPIO_Pin;

}
GPIO_TypeDef* Pin::port()
{
	return port_n;
}
uint16_t Pin::pin()
{
	return pin_n;
}
