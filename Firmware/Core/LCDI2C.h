
#pragma once
#include "stm32f3xx_hal.h"
#include <math.h>
#include <string>


class LCD_I2C {
private:
	I2C_HandleTypeDef handler;
	uint16_t address;
	void send_cmd(char cmd);
	void send_data(char data);
	void init();
	void reverse(char* str, int len);
	int intToStr(int x, char str[], int d=1);
	void ftoa(float n, char* res);
public:
	LCD_I2C(I2C_HandleTypeDef i2cHandler, uint16_t _address);
	void clear();
	void put_cur(int row, int col);
	void print(char *str);
	void printChar(char chr);
	void printBlank(int row, int col);
	void print(uint32_t number);
	void print3Dig(uint32_t number);
	void print(float number, int dec=3);
	void createChar(unsigned char *character, const char idx);
	void printCustomChar(const char idx);
};

