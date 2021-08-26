# Turbo-Pump-Controller

Simple controller for turbo-molecular pumps based on a STM32F303
microcontroller.

## Description

The controller was built for controlling two turbo-molecular pumps of different
models (one Turbovac and one Agilent).
It allows to execute some basic operations on the pump (starting and stopping)
while also displaying their status (rotation speed and fault signals).
As an extra layer of security, a Pirani pressure gauge is used to monitor the
pressure on the exhaust side of the pumps.
Therefore, the controller will not allow the pumps to be started if the
fore-vacuum pressure is too high and will automatically stop the pumps if the
pressure increases above safe levels.
The information about the status of all components is also transmitted via a
RS232 connection.

The controller is based on a STM32F303 microcontroller.
An alphanumerical Liquid Chrystal Display with an I2C interface is used for
displaying all the current information about the system.
User interaction with the controller is accomplished via a rotary encoder.
Since two different pumps had to be controlled, a slightly different input
circuitry had to be implemented (refer to the schematic diagram) that
__presents__ both pumps in a similar way to the microcontroller.
This part of the schematics, however, can be easily modified to accommodate for
different pumps, as well as for a different number of units.

### RS232 communication

The controller is sending the status of the system via a serial link every 2
seconds.
To connect to the controller use the following settings for the serial port:

    __Baud Rate__ : 115200
    __Data Bits__ : 8
    __Flow Control__ : None
    __Parity__ : None
    __Stop Bits__: 1

The message structure is as follows:

    FV-<NO>: <PRESS> mbar, P0-<NO>: <FREQ> Hz,P1-<NO>: <FREQ> Hz\r\n

where **\<NO>** is a boolean value for the device normal operation (**1** for normal
operation and **0** for fault), **\<PRESS>** is the pressure of the pirani
pressure gauge, and **\<FREQ>** is the rotor frequency of the turbo-molecular
pump.

## User Interface

The User interfaces with the controller with a rotary encoder.
Rotating it in either direction will result in the change of the display page
(Pump status page or Fore-Vacuum pressure).
On the Pump status page the user can enter the __Edit__ mode by pressing the
button of the rotary encoder -- a triangle will appear indicating the selected
line (i.e. pump).
A second click of the button will toggle the selected pump and exit the __Edit__
mode.
To return from the __Edit__ mode without toggling any of the pumps, the user can
rotate the rotary encoder beyond the limits of the display.

In case of a fault (of either devices) a warning message will appear along with
a sound alarm, both of which can be dismissed by pressing the button of the
rotary encoder.
