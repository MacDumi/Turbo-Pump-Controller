/*
 * Display.h
 *
 *  Created on: Aug 10, 2021
 *      Author: DD
 */

#pragma once
#include "TurboPump.h"
#include "Pirani.h"
#include "LCDI2C.h"

class Display
{
private:
	const int pages = 2;
	TurboPump* tp0;
	TurboPump* tp1;
	Pirani* pirani;
	LCD_I2C* lcd;
	unsigned char Fan[3][8] =
		{{0b00000,0b01100,0b01111,0b11011,
		  0b11110,0b00110,0b00000,0b00000},
		 {0b00000,0b11011,0b11111,0b01010,
		  0b11111,0b11011,0b00000,0b00000},
		 {0b00000,0b00110, 0b11110,0b11011,
		  0b01111,0b01100,0b00000,0b00000}};
	unsigned char Arrow[8] =
		 {0b00001,0b00011,0b00111,0b01111,
		  0b00111,0b00011,0b00001,0b00000};
	int index = 0, pageIdx = 0, lineIdx = 0;
	bool editMode = false;
	bool fault = false;
	bool override = false;
	std::string faultLabel;

	void createChars();
	void showPumps();
	void showPres();
	void showFault();

public:
	Display();
	void addLCD(LCD_I2C* _lcd);
	void addLCD(I2C_HandleTypeDef i2cHandler,
							uint16_t _address);
	void addTP(TurboPump* tp, int idx=0);
	void addPS(Pirani* ps);


	void display();

	void up();
	void down();
	void pushDown();

	bool hasFault();
};

