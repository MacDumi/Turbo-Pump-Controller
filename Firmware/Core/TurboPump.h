/*
 * TurboPump.h
 *
 *  Created on: Aug 8, 2021
 *      Author: DD
 */

#pragma once
#include <string>
#include "Pin.h"
#include "Device.h"
#include "Pirani.h"

class TurboPump : public Device
{
	float thres_press = 0.8;
	Pirani* pirani;
	Pin startPin;
	Pin faultPin;
	float frequency;
	float maxFreq, maxVoltage;
	bool running = false;
	void checkFault();
public:
	TurboPump();
	TurboPump(Pin _startPin, Pin _faultPin, float _coef,
			float _maxFreq, float _maxVolt, std::string lbl,
			Pirani* _gauge);
	void addPressureGauge(Pirani* _gauge);
	void update(float _voltage);
	float getValue();
	std::string getUnit();
	void start();
	void stop();
	bool isRunning();
};


