/*
 * LCDI2C.cpp
 *
 *  Created on: Aug 7, 2021
 *      Author: DD
 */

#include "LCDI2C.h"

#include <stdlib.h>

LCD_I2C::LCD_I2C(I2C_HandleTypeDef i2cHandler, uint16_t _address)
{
	handler = i2cHandler;
	address = _address;

	init();
	clear();

}

void LCD_I2C::send_cmd(char cmd)
{
	char data_u, data_l;
	uint8_t data_t[4];
	data_u = (cmd&0xf0);
	data_l = ((cmd<<4)&0xf0);
	data_t[0] = data_u|0x0C;  //en=1, rs=0
	data_t[1] = data_u|0x08;  //en=0, rs=0
	data_t[2] = data_l|0x0C;  //en=1, rs=0
	data_t[3] = data_l|0x08;  //en=0, rs=0
	HAL_I2C_Master_Transmit (&handler, address,(uint8_t *)data_t, 4, 100);
	HAL_Delay(20);
}

void LCD_I2C::send_data(char data)
{
	char data_u, data_l;
	uint8_t data_t[4];
	data_u = (data&0xf0);
	data_l = ((data<<4)&0xf0);
	data_t[0] = data_u|0x0D;  //en=1, rs=0
	data_t[1] = data_u|0x09;  //en=0, rs=0
	data_t[2] = data_l|0x0D;  //en=1, rs=0
	data_t[3] = data_l|0x09;  //en=0, rs=0
	HAL_I2C_Master_Transmit (&handler, address,(uint8_t *)data_t, 4, 100);
}

void LCD_I2C::init()
{
	send_data(0x00);
	HAL_Delay(150);
	send_cmd(0x03);
	HAL_Delay(5);
	send_cmd(0x03);
	HAL_Delay(150);
	send_cmd(0x02);
	send_cmd(0x02);
	send_cmd(0x08);
	send_cmd(0x00);
	send_cmd(0x0C);
	send_cmd(0x00);
	send_cmd(0x06);
	send_cmd(0x00);
	send_cmd(0x01);
}

void LCD_I2C::clear()
{
	send_cmd(0);
	send_cmd(1);
    HAL_Delay(1);
    send_cmd(0x0C);
}

void LCD_I2C::put_cur(int row, int col)
{
    switch (row)
    {
        case 0:
            col |= 0x80;
            break;
        case 1:
            col |= 0xC0;
            break;
    }

    send_cmd (col);
}

void LCD_I2C::print (char *str)
{
	while (*str) send_data (*str++);
}

void LCD_I2C::printChar(char chr)
{
	send_data(chr);
}

void LCD_I2C::printBlank(int row, int col)
{
	put_cur(row, col);
	send_data(' ');
}

void LCD_I2C::print (uint32_t number)
{
	char buff[20];
	itoa(number, buff, 10);
	print(buff);

}

void LCD_I2C::print3Dig(uint32_t number)
{
	uint32_t temp = 1000;
	while(number < temp && number >= 0
			&& temp > 1)
	{
		send_data(' ');
		temp /= 10;
	}
	print(number);

}

void LCD_I2C::print (float number, int dec)
{
	char buff[20];
    ftoa(number, buff);
	print(buff);

}
void LCD_I2C::createChar(unsigned char *character, const char idx)
{
	send_cmd(0x40 + (idx * 8));
	for (int i = 0; i < 8; i++)
		send_data(character[i]);
}

void LCD_I2C::printCustomChar(const char idx)
{
     send_data(idx);
}

void LCD_I2C::reverse(char* str, int len)
{
    int i = 0, j = len - 1, temp;
    while (i < j) {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
        i++;
        j--;
    }
}
int LCD_I2C::intToStr(int x, char str[], int d)
{
    int i = 0;
    bool neg = false;
    if (x < 0)
    {
    	str[i++] = '-';
    	x *= -1;
    	neg = true;
    }
    while (x) {
        str[i++] = (x % 10) + '0';
        x = x / 10;
    }

    // If number of digits required is more, then
    // add 0s at the beginning
    while (i < d)
        str[i++] = '0';

    if(neg)
    {
        reverse(str+1, i);
    }
    else
    {
        reverse(str, i);
    }
    str[i] = '\0';
    return i;
}


void LCD_I2C::ftoa(float n, char* res)
{
	int exp;
	if(n == 0) n = 1e-9;
	float f_exp = log10(n);

	exp = (int)(f_exp - 0.5);


	n /= pow(10, exp);

	if (n < 1)
	{
		n *= 10;
		exp--;
	}
	else if (n >= 10)
	{
		n /= 10;
		exp++;
	}
    // Extract integer part
    int ipart = (int)n;

    // Extract floating part
    float fpart = n - (float)ipart;

    // convert integer part to string
    int i = intToStr(ipart, res, 1);

    // check for display option after point

    res[i] = '.'; // add dot

    fpart = fpart * pow(10, 2);

    i += intToStr((int)fpart, res + i + 1, 2);
    res[++i] = 'E';
    i++;
    if (exp < 0)
    {
    	res[i] = '-';
    	exp *= -1;
    }
    else
    {
    	res[i] = '+';
    }
    intToStr(exp, res + i + 1, 1);


}
