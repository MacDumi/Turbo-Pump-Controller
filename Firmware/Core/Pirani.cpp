/*
 * Pirani.cpp
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#include "Pirani.h"
#include "math.h"
#include <stdlib.h>


Pirani::Pirani(float _coef)
{
	coef = _coef;
	label = "FV ";
}

void Pirani::update(float _voltage)
{
	voltage = coef * _voltage;
	pressure = pow(10, voltage - c);
	if (voltage <= 0.5 || voltage >= 9.5)
	{
		fault = true;
	}
	else
	{
		fault = false;
	}
}

float Pirani::getValue()
{
	return pressure;
}

std::string Pirani::getUnit()
{
	return " mbar";
}
