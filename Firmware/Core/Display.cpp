/*
 * Display.cpp
 *
 *  Created on: Aug 10, 2021
 *      Author: DD
 */

#include "Display.h"

Display::Display()
{
}

void Display::addLCD(LCD_I2C* _lcd)
{
	lcd = _lcd;
	createChars();
}

void Display::addLCD(I2C_HandleTypeDef i2cHandler,
					uint16_t _address)
{
	lcd = new LCD_I2C(i2cHandler, _address);
	createChars();
}

void Display::addTP(TurboPump* tp, int idx)
{
	switch(idx)
	{
		case 0: tp0 = tp; break;
		case 1: tp1 = tp; break;
		default: break;
	}
}

void Display::addPS(Pirani* ps)
{
	pirani = ps;
}

void Display::createChars()
{
	for (int i = 0; i < 3; i++)
	{
		lcd->createChar(Fan[i], i);
	}
	lcd->createChar(Arrow, 3);
}

void Display::showPumps()
{
	lcd->put_cur(0, 0);
	int idx_0 = index, idx_1 = index;
	if (!tp0->isRunning()) idx_0 = 0;
	lcd->printCustomChar(idx_0);
	lcd->print((char*)tp0->getLabel().c_str());
	lcd->print3Dig((uint32_t)tp0->getValue());
	lcd->print((char*)tp0->getUnit().c_str());
	if(tp0->hasFault())
	{
		lcd->print((char*)(" Err"));
	}
	else
	{
		lcd->print((char*)("     "));
	}
	lcd->put_cur(1, 0);
	if (!tp1->isRunning()) idx_1 = 0;
	lcd->printCustomChar(idx_1);
	lcd->print((char*)tp1->getLabel().c_str());
	lcd->print3Dig((uint32_t)tp1->getValue());
	lcd->print((char*)tp1->getUnit().c_str());
	if(tp1->hasFault())
	{
		lcd->print((char*)(" Err"));
	}
	else
	{
		lcd->print((char*)("     "));
	}
	index++;
	if(index == 3)
	{
		index = 0;
	}

	// If in edit mode then show the arrow

	if (editMode)
	{
		lcd->put_cur(lineIdx, 15);
		lcd->printCustomChar(3);
		lcd->printBlank(1-lineIdx, 15);
	}
	else
	{
		lcd->printBlank(1, 15);
		lcd->printBlank(0, 15);
	}


}
void Display::showPres()
{
	if (editMode) editMode = false;
	lcd->put_cur(0, 0);
	lcd->print((char*)("  Fore Vacuum:"));
	lcd->put_cur(1, 0);
	if (pirani->hasFault())
	{
		lcd->print((char*)("     Error     "));
	}
	else
	{
		lcd->print((char*)("  "));
		lcd->print(pirani->getValue());
		lcd->print((char*)pirani->getUnit().c_str());
	}

}

void Display::showFault()
{
	lcd->put_cur(0, 0);
	lcd->print((char*)("   "));
	lcd->print((char*)faultLabel.c_str());
	lcd->print((char*)(" Fault!"));
	lcd->put_cur(1, 0);
	lcd->print((char*)("Press to dismiss"));
}

void Display::up()
{
	if (editMode)
	{
		// Change the line
		lineIdx--;
		if (lineIdx < 0)
		{
			lineIdx = 0;
			editMode = false;
		}
	}
	else
	{
		// Change the page
		pageIdx++;

		if (pageIdx >= pages)
		{
			pageIdx = 0;
		}
		lcd->clear();
	}
}

void Display::down()
{

	if (editMode)
	{
		// Change the line
		lineIdx++;
		if (lineIdx > 1)
		{
			lineIdx = 0;
			editMode = false;

		}
	}
	else
	{
		// Change the page
		pageIdx--;

		if (pageIdx < 0)
		{
			pageIdx = pages - 1;
		}
		lcd->clear();
	}

}

void Display::pushDown()
{
	// Clear the fault
	if (fault && !override)
	{
		override = true;
		lcd->clear();
		return;
	}

	if (!editMode)
	{
		// Only go in the edit mode on the first page
		editMode = true;
	}
	else
	{
		switch (lineIdx)
		{
		case 0:
		{
			if (tp0->isRunning())
			{
				tp0->stop();
			}
			else
			{
				tp0->start();
			}
			editMode = false;

			break;
		}
		case 1:
		{
			if (tp1->isRunning())
			{
				tp1->stop();
			}
			else
			{
				tp1->start();
			}
			editMode = false;
			break;
		}

		}
	}
}

void Display::display()
{
	// Check for faults
	fault = false;
	if (tp0->hasFault())
	{
		fault = true;
		faultLabel = tp0->getLabel();
	}
	if (tp1->hasFault())
	{
		fault = true;
		faultLabel = tp1->getLabel();
	}
	if (pirani->hasFault())
	{
		fault = true;
		faultLabel = pirani->getLabel();
	}

	if (!fault && override)
	{
		override = false;
	}
	// Show the fault screen
	if (fault && !override)
	{
		showFault();
		return;
	}
	// Show normal screens
	switch(pageIdx)
	{
		case 0: showPumps(); break;
		case 1: showPres();	break;
	}
}

bool Display::hasFault()
{
	return fault && !override;
}
