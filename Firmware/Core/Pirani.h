/*
 * Pirani.h
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#pragma once
#include "Device.h"

class Pirani : public Device
{
private:
	const float c = 5.5;
	float pressure;

public:
	Pirani(float _coef);
    void update(float _voltage);
	float getValue();
	std::string getUnit();
};


