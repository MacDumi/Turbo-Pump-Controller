
#include "Device.h"

std::string Device::getLabel()
{
	return label;
}

bool Device::hasFault()
{
	return fault;
}

float Device::getVoltage()
{
	return voltage;
}

bool Device::isRunning()
{
	return running;
}
