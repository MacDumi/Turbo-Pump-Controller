
#pragma once
#include <string>

class Device {
public:

    virtual float getValue() = 0;
    virtual std::string getUnit() = 0;
    virtual void update(float _voltage) = 0;
    std::string getLabel();
    bool hasFault();
	bool isRunning();
    float getVoltage();

 protected:
    float voltage;
    float coef = 1;
    std::string label;
    bool fault = false;
    bool running = true;
};


