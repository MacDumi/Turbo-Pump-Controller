EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "Pump Controller"
Date "2021-07-28"
Rev "1.0"
Comp "University of Rostock"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PumpController-rescue:DB9_Female-Connector J1
U 1 1 61016718
P 2850 2650
F 0 "J1" H 2768 3342 50  0000 C CNN
F 1 "DB9_Female" H 2768 3251 50  0000 C CNN
F 2 "" H 2850 2650 50  0001 C CNN
F 3 " ~" H 2850 2650 50  0001 C CNN
	1    2850 2650
	-1   0    0    -1  
$EndComp
$Comp
L PumpController-rescue:NHD-C0220BIZ-Display_Character U2
U 1 1 6101C02E
P 15250 13550
F 0 "U2" H 14850 14050 50  0000 C CNN
F 1 "NHD-C0220BIZ" H 14750 14150 50  0000 C CNN
F 2 "Display:NHD-C0220BiZ" H 15250 12950 50  0001 C CNN
F 3 "http://www.newhavendisplay.com/specs/NHD-C0220BiZ-FSW-FBW-3V3M.pdf" H 14950 14150 50  0001 C CNN
	1    15250 13550
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:Rotary_Encoder_Switch-Device SW1
U 1 1 6101F226
P 10700 13750
F 0 "SW1" H 10700 14117 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 10700 14026 50  0000 C CNN
F 2 "" H 10550 13910 50  0001 C CNN
F 3 "~" H 10700 14010 50  0001 C CNN
	1    10700 13750
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:DB9_Male-Connector J4
U 1 1 61020152
P 2800 13750
F 0 "J4" H 2718 13058 50  0000 C CNN
F 1 "DB9_Male" H 2718 13149 50  0000 C CNN
F 2 "" H 2800 13750 50  0001 C CNN
F 3 " ~" H 2800 13750 50  0001 C CNN
	1    2800 13750
	-1   0    0    1   
$EndComp
$Comp
L PumpController-rescue:Conn_02x03_Odd_Even-Connector_Generic J3
U 1 1 61025AB1
P 2850 9450
F 0 "J3" H 2900 9767 50  0000 C CNN
F 1 "Conn_Pirani_PG" H 2900 9676 50  0000 C CNN
F 2 "" H 2850 9450 50  0001 C CNN
F 3 "~" H 2850 9450 50  0001 C CNN
	1    2850 9450
	1    0    0    -1  
$EndComp
Text Notes 1250 1750 0    98   ~ 20
Pump 0 (Varian 301)
Text Notes 1200 3000 0    50   ~ 0
1 - Start +           \n2 - Start -             \n3 - NC                   \n4 - Soft Start +  \n5 - Soft Start - \n6 - 24 V\n7 - Fault (active high) \n8 - Frequency (analog 0 ... 10 V)\n9 - GND
Wire Wire Line
	3150 2950 3600 2950
Wire Wire Line
	3600 2950 3600 3350
$Comp
L PumpController-rescue:GND-power #PWR0101
U 1 1 61030C29
P 3600 3350
F 0 "#PWR0101" H 3600 3100 50  0001 C CNN
F 1 "GND" H 3605 3177 50  0000 C CNN
F 2 "" H 3600 3350 50  0001 C CNN
F 3 "" H 3600 3350 50  0001 C CNN
	1    3600 3350
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+24V-power #PWR0102
U 1 1 610332DC
P 3600 1850
F 0 "#PWR0102" H 3600 1700 50  0001 C CNN
F 1 "+24V" H 3615 2023 50  0000 C CNN
F 2 "" H 3600 1850 50  0001 C CNN
F 3 "" H 3600 1850 50  0001 C CNN
	1    3600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2350 3600 2350
Wire Wire Line
	3600 2350 3600 2250
$Comp
L PumpController-rescue:R-Device R2
U 1 1 61037200
P 4500 2950
F 0 "R2" H 4570 2996 50  0000 L CNN
F 1 "33k" H 4570 2905 50  0000 L CNN
F 2 "" V 4430 2950 50  0001 C CNN
F 3 "~" H 4500 2950 50  0001 C CNN
	1    4500 2950
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R3
U 1 1 61037AB1
P 4500 3350
F 0 "R3" H 4570 3396 50  0000 L CNN
F 1 "10k" H 4570 3305 50  0000 L CNN
F 2 "" V 4430 3350 50  0001 C CNN
F 3 "~" H 4500 3350 50  0001 C CNN
	1    4500 3350
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR0103
U 1 1 61037D5A
P 4500 3600
F 0 "#PWR0103" H 4500 3350 50  0001 C CNN
F 1 "GND" H 4505 3427 50  0000 C CNN
F 2 "" H 4500 3600 50  0001 C CNN
F 3 "" H 4500 3600 50  0001 C CNN
	1    4500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2750 4500 2750
Wire Wire Line
	4500 2750 4500 2800
Wire Wire Line
	4500 3100 4500 3150
Wire Wire Line
	4500 3500 4500 3550
Text GLabel 4800 3150 2    50   Input ~ 0
Pump_0_FREQ
Wire Wire Line
	4800 3150 4500 3150
Connection ~ 4500 3150
Wire Wire Line
	4500 3150 4500 3200
$Comp
L PumpController-rescue:R-Device R8
U 1 1 6103C79D
P 5700 2950
F 0 "R8" H 5770 2996 50  0000 L CNN
F 1 "39k" H 5770 2905 50  0000 L CNN
F 2 "" V 5630 2950 50  0001 C CNN
F 3 "~" H 5700 2950 50  0001 C CNN
	1    5700 2950
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R9
U 1 1 6103DAAF
P 5700 3350
F 0 "R9" H 5770 3396 50  0000 L CNN
F 1 "3.3k" H 5770 3305 50  0000 L CNN
F 2 "" V 5630 3350 50  0001 C CNN
F 3 "~" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR0104
U 1 1 6103DCE2
P 5700 3600
F 0 "#PWR0104" H 5700 3350 50  0001 C CNN
F 1 "GND" H 5705 3427 50  0000 C CNN
F 2 "" H 5700 3600 50  0001 C CNN
F 3 "" H 5700 3600 50  0001 C CNN
	1    5700 3600
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:DZ2S033X0L-Diode D1
U 1 1 6104081D
P 6150 3350
F 0 "D1" V 6104 3430 50  0000 L CNN
F 1 "DZ2S033X0L" V 6195 3430 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 6150 3175 50  0001 C CNN
F 3 "https://industrial.panasonic.com/content/data/SC/ds/ds4/DZ2S03300L_E.pdf" H 6150 3350 50  0001 C CNN
	1    6150 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 2550 5700 2550
Wire Wire Line
	5700 2550 5700 2800
Wire Wire Line
	5700 3100 5700 3150
Wire Wire Line
	5700 3500 5700 3550
Wire Wire Line
	6150 3500 6150 3550
Wire Wire Line
	6150 3550 5700 3550
Connection ~ 5700 3550
Wire Wire Line
	5700 3550 5700 3600
Wire Wire Line
	5700 3150 6150 3150
Wire Wire Line
	6150 3150 6150 3200
Connection ~ 5700 3150
Wire Wire Line
	5700 3150 5700 3200
Text GLabel 6350 3150 2    50   Input ~ 0
Pump_0_FAULT
Wire Wire Line
	6350 3150 6150 3150
Connection ~ 6150 3150
$Comp
L PumpController-rescue:2N3904-Transistor_BJT Q1
U 1 1 6104393C
P 7500 2950
F 0 "Q1" H 7691 2996 50  0000 L CNN
F 1 "2N3904" H 7691 2905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7700 2875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 7500 2950 50  0001 L CNN
	1    7500 2950
	-1   0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR0105
U 1 1 61046250
P 7400 3600
F 0 "#PWR0105" H 7400 3350 50  0001 C CNN
F 1 "GND" H 7405 3427 50  0000 C CNN
F 2 "" H 7400 3600 50  0001 C CNN
F 3 "" H 7400 3600 50  0001 C CNN
	1    7400 3600
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R12
U 1 1 610467C9
P 8000 2950
F 0 "R12" V 7793 2950 50  0000 C CNN
F 1 "1k" V 7884 2950 50  0000 C CNN
F 2 "" V 7930 2950 50  0001 C CNN
F 3 "~" H 8000 2950 50  0001 C CNN
	1    8000 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 2950 7850 2950
Wire Wire Line
	7400 3150 7400 3600
Text GLabel 8350 2950 2    50   Input ~ 0
Pump_0_START
Wire Wire Line
	8150 2950 8350 2950
$Comp
L PumpController-rescue:DB9_Female-Connector J2
U 1 1 6105C72C
P 2750 6250
F 0 "J2" H 2668 6942 50  0000 C CNN
F 1 "DB9_Female" H 2668 6851 50  0000 C CNN
F 2 "" H 2750 6250 50  0001 C CNN
F 3 " ~" H 2750 6250 50  0001 C CNN
	1    2750 6250
	-1   0    0    -1  
$EndComp
Text Notes 1150 5350 0    98   ~ 20
Pump 1 (TurboVac 250)
Text Notes 1100 6600 0    50   ~ 0
1 - Start (High) / Reset (Low)           \n2 - Error (com)\n3 - Error (n.o.)  \n4 - Normal operation (com)  \n5 - Normal operation (n.o.)\n6 - 24 V\n7 - NC \n8 - Frequency (analog 0 ... 10 V)\n9 - GND
Wire Wire Line
	3050 6550 3500 6550
Wire Wire Line
	3500 6550 3500 6950
$Comp
L PumpController-rescue:GND-power #PWR0106
U 1 1 6105C736
P 3500 6950
F 0 "#PWR0106" H 3500 6700 50  0001 C CNN
F 1 "GND" H 3505 6777 50  0000 C CNN
F 2 "" H 3500 6950 50  0001 C CNN
F 3 "" H 3500 6950 50  0001 C CNN
	1    3500 6950
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+24V-power #PWR0107
U 1 1 6105C73C
P 3500 5450
F 0 "#PWR0107" H 3500 5300 50  0001 C CNN
F 1 "+24V" H 3515 5623 50  0000 C CNN
F 2 "" H 3500 5450 50  0001 C CNN
F 3 "" H 3500 5450 50  0001 C CNN
	1    3500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5950 3500 5950
Wire Wire Line
	3500 5950 3500 5450
$Comp
L PumpController-rescue:GND-power #PWR0108
U 1 1 6105C78E
P 7800 7200
F 0 "#PWR0108" H 7800 6950 50  0001 C CNN
F 1 "GND" H 7805 7027 50  0000 C CNN
F 2 "" H 7800 7200 50  0001 C CNN
F 3 "" H 7800 7200 50  0001 C CNN
	1    7800 7200
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R14
U 1 1 6105C794
P 8400 6600
F 0 "R14" V 8193 6600 50  0000 C CNN
F 1 "1k" V 8284 6600 50  0000 C CNN
F 2 "" V 8330 6600 50  0001 C CNN
F 3 "~" H 8400 6600 50  0001 C CNN
	1    8400 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 6600 8250 6600
Text GLabel 8750 6600 2    50   Input ~ 0
Pump_1_START
Wire Wire Line
	8550 6600 8750 6600
$Comp
L PumpController-rescue:+3.3V-power #PWR0109
U 1 1 6107D921
P 3850 5450
F 0 "#PWR0109" H 3850 5300 50  0001 C CNN
F 1 "+3.3V" H 3865 5623 50  0000 C CNN
F 2 "" H 3850 5450 50  0001 C CNN
F 3 "" H 3850 5450 50  0001 C CNN
	1    3850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6050 3850 5450
Connection ~ 3850 6050
Connection ~ 6050 6250
Wire Wire Line
	6250 6250 6050 6250
Wire Wire Line
	6050 7200 6050 6700
Wire Wire Line
	6050 6250 6050 6400
$Comp
L PumpController-rescue:R-Device R10
U 1 1 610886A2
P 6050 6550
F 0 "R10" H 6120 6596 50  0000 L CNN
F 1 "10k" H 6120 6505 50  0000 L CNN
F 2 "" V 5980 6550 50  0001 C CNN
F 3 "~" H 6050 6550 50  0001 C CNN
	1    6050 6550
	1    0    0    -1  
$EndComp
Text GLabel 6250 6250 2    50   Input ~ 0
Pump_1_FAULT
$Comp
L PumpController-rescue:GND-power #PWR0110
U 1 1 6105C76A
P 6050 7200
F 0 "#PWR0110" H 6050 6950 50  0001 C CNN
F 1 "GND" H 6055 7027 50  0000 C CNN
F 2 "" H 6050 7200 50  0001 C CNN
F 3 "" H 6050 7200 50  0001 C CNN
	1    6050 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6750 5000 6800
Connection ~ 5000 6750
Wire Wire Line
	5300 6750 5000 6750
Text GLabel 5300 6750 2    50   Input ~ 0
Pump_1_FREQ
Wire Wire Line
	5000 7100 5000 7150
Wire Wire Line
	5000 6700 5000 6750
Wire Wire Line
	5000 6350 5000 6400
$Comp
L PumpController-rescue:GND-power #PWR0111
U 1 1 6105C750
P 5000 7200
F 0 "#PWR0111" H 5000 6950 50  0001 C CNN
F 1 "GND" H 5005 7027 50  0000 C CNN
F 2 "" H 5000 7200 50  0001 C CNN
F 3 "" H 5000 7200 50  0001 C CNN
	1    5000 7200
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R7
U 1 1 6105C74A
P 5000 6950
F 0 "R7" H 5070 6996 50  0000 L CNN
F 1 "10k" H 5070 6905 50  0000 L CNN
F 2 "" V 4930 6950 50  0001 C CNN
F 3 "~" H 5000 6950 50  0001 C CNN
	1    5000 6950
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R6
U 1 1 6105C744
P 5000 6550
F 0 "R6" H 5070 6596 50  0000 L CNN
F 1 "33k" H 5070 6505 50  0000 L CNN
F 2 "" V 4930 6550 50  0001 C CNN
F 3 "~" H 5000 6550 50  0001 C CNN
	1    5000 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6650 3800 6650
Wire Wire Line
	3800 6650 3800 6800
$Comp
L PumpController-rescue:R-Device R1
U 1 1 610A4C08
P 3800 6950
F 0 "R1" H 3870 6996 50  0000 L CNN
F 1 "10k" H 3870 6905 50  0000 L CNN
F 2 "" V 3730 6950 50  0001 C CNN
F 3 "~" H 3800 6950 50  0001 C CNN
	1    3800 6950
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR0112
U 1 1 610A4C0F
P 3800 7200
F 0 "#PWR0112" H 3800 6950 50  0001 C CNN
F 1 "GND" H 3805 7027 50  0000 C CNN
F 2 "" H 3800 7200 50  0001 C CNN
F 3 "" H 3800 7200 50  0001 C CNN
	1    3800 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6650 3050 6650
Connection ~ 3800 6650
Wire Wire Line
	3800 7200 3800 7100
$Comp
L PumpController-rescue:2N3904-Transistor_BJT Q3
U 1 1 6105C788
P 7900 6600
F 0 "Q3" H 8091 6646 50  0000 L CNN
F 1 "2N3904" H 8091 6555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8100 6525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 7900 6600 50  0001 L CNN
	1    7900 6600
	-1   0    0    -1  
$EndComp
$Comp
L PumpController-rescue:BC327-Transistor_BJT Q2
U 1 1 610B8C42
P 7150 5900
F 0 "Q2" H 7341 5946 50  0000 L CNN
F 1 "BC327" H 7341 5855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7350 5825 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/BC327-D.PDF" H 7150 5900 50  0001 L CNN
	1    7150 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 5850 4300 6100
$Comp
L PumpController-rescue:+24V-power #PWR0113
U 1 1 610C7500
P 7050 5500
F 0 "#PWR0113" H 7050 5350 50  0001 C CNN
F 1 "+24V" H 7065 5673 50  0000 C CNN
F 2 "" H 7050 5500 50  0001 C CNN
F 3 "" H 7050 5500 50  0001 C CNN
	1    7050 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5700 7050 5500
Wire Wire Line
	7050 7200 7050 6700
$Comp
L PumpController-rescue:R-Device R11
U 1 1 610CD078
P 7050 6550
F 0 "R11" H 7120 6596 50  0000 L CNN
F 1 "10k" H 7120 6505 50  0000 L CNN
F 2 "" V 6980 6550 50  0001 C CNN
F 3 "~" H 7050 6550 50  0001 C CNN
	1    7050 6550
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR0114
U 1 1 610CD07E
P 7050 7200
F 0 "#PWR0114" H 7050 6950 50  0001 C CNN
F 1 "GND" H 7055 7027 50  0000 C CNN
F 2 "" H 7050 7200 50  0001 C CNN
F 3 "" H 7050 7200 50  0001 C CNN
	1    7050 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 6400 7050 6100
Connection ~ 7050 6100
$Comp
L PumpController-rescue:R-Device R13
U 1 1 610D3900
P 7600 5900
F 0 "R13" V 7393 5900 50  0000 C CNN
F 1 "1k" V 7484 5900 50  0000 C CNN
F 2 "" V 7530 5900 50  0001 C CNN
F 3 "~" H 7600 5900 50  0001 C CNN
	1    7600 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 5900 7350 5900
Wire Wire Line
	7750 5900 7800 5900
Wire Wire Line
	7800 5900 7800 6400
Wire Wire Line
	7800 7200 7800 6800
Text Notes 1200 8850 0    98   ~ 20
Pressure Gauge (Pirani)
Text Notes 1100 9600 0    50   ~ 0
1 - 24 V\n2 - NC\n3 - Signal GND \n4 - Signal (analog 0 ... 10 V)\n5 - NC\n6 - GND\n
$Comp
L PumpController-rescue:+24V-power #PWR01
U 1 1 610F79C3
P 3750 9050
F 0 "#PWR01" H 3750 8900 50  0001 C CNN
F 1 "+24V" H 3765 9223 50  0000 C CNN
F 2 "" H 3750 9050 50  0001 C CNN
F 3 "" H 3750 9050 50  0001 C CNN
	1    3750 9050
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR02
U 1 1 610FA31D
P 3750 9900
F 0 "#PWR02" H 3750 9650 50  0001 C CNN
F 1 "GND" H 3755 9727 50  0000 C CNN
F 2 "" H 3750 9900 50  0001 C CNN
F 3 "" H 3750 9900 50  0001 C CNN
	1    3750 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 9050 2550 9050
Wire Wire Line
	2550 9050 2550 9350
Wire Wire Line
	2550 9350 2650 9350
Wire Wire Line
	3750 9900 3750 9800
Wire Wire Line
	3750 9800 2550 9800
Wire Wire Line
	2550 9800 2550 9550
Wire Wire Line
	2550 9550 2650 9550
Wire Wire Line
	3150 9550 3750 9550
Wire Wire Line
	3750 9550 3750 9800
Connection ~ 3750 9800
Wire Wire Line
	5050 9700 5050 9750
Connection ~ 5050 9700
Wire Wire Line
	5350 9700 5050 9700
Text GLabel 5350 9700 2    50   Input ~ 0
PG_SIGNAL
Wire Wire Line
	5050 10050 5050 10100
Wire Wire Line
	5050 9650 5050 9700
$Comp
L PumpController-rescue:GND-power #PWR04
U 1 1 6110A04E
P 5050 10150
F 0 "#PWR04" H 5050 9900 50  0001 C CNN
F 1 "GND" H 5055 9977 50  0000 C CNN
F 2 "" H 5050 10150 50  0001 C CNN
F 3 "" H 5050 10150 50  0001 C CNN
	1    5050 10150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R5
U 1 1 6110A054
P 5050 9900
F 0 "R5" H 5120 9946 50  0000 L CNN
F 1 "10k" H 5120 9855 50  0000 L CNN
F 2 "" V 4980 9900 50  0001 C CNN
F 3 "~" H 5050 9900 50  0001 C CNN
	1    5050 9900
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R4
U 1 1 6110A05A
P 5050 9500
F 0 "R4" H 5120 9546 50  0000 L CNN
F 1 "33k" H 5120 9455 50  0000 L CNN
F 2 "" V 4980 9500 50  0001 C CNN
F 3 "~" H 5050 9500 50  0001 C CNN
	1    5050 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 9450 2500 9450
Wire Wire Line
	2500 9450 2500 9200
Wire Wire Line
	2500 9200 5050 9200
Wire Wire Line
	5050 9200 5050 9350
Text Notes 1150 12700 0    98   ~ 20
RS232 (connection with Pressure gauge controller)
$Comp
L PumpController-rescue:GND-power #PWR03
U 1 1 6111AFC8
P 3650 14400
F 0 "#PWR03" H 3650 14150 50  0001 C CNN
F 1 "GND" H 3655 14227 50  0000 C CNN
F 2 "" H 3650 14400 50  0001 C CNN
F 3 "" H 3650 14400 50  0001 C CNN
	1    3650 14400
	1    0    0    -1  
$EndComp
Text Notes 1050 14100 0    50   ~ 0
1 - NC\n2 - RX\n3 - TX\n4 - NC \n5 - GND\n6 - NC\n7 - NC \n8 - NC\n9 - NC
Wire Wire Line
	3100 14150 3650 14150
Wire Wire Line
	3650 14150 3650 14400
$Comp
L PumpController-rescue:MAX232-Interface_UART U4
U 1 1 6112132B
P 6750 13700
F 0 "U4" H 7150 14950 50  0000 C CNN
F 1 "MAX232" H 7200 15100 50  0000 C CNN
F 2 "" H 6800 12650 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 6750 13800 50  0001 C CNN
	1    6750 13700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5950 14000 4700 14000
Wire Wire Line
	4700 14000 4700 13550
Wire Wire Line
	4700 13550 3100 13550
Wire Wire Line
	5950 14400 4850 14400
Wire Wire Line
	4850 14400 4850 13750
Wire Wire Line
	4850 13750 3100 13750
$Comp
L PumpController-rescue:+5V-power #PWR06
U 1 1 61133D59
P 6750 11900
F 0 "#PWR06" H 6750 11750 50  0001 C CNN
F 1 "+5V" H 6765 12073 50  0000 C CNN
F 2 "" H 6750 11900 50  0001 C CNN
F 3 "" H 6750 11900 50  0001 C CNN
	1    6750 11900
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR07
U 1 1 611391BC
P 6750 15050
F 0 "#PWR07" H 6750 14800 50  0001 C CNN
F 1 "GND" H 6755 14877 50  0000 C CNN
F 2 "" H 6750 15050 50  0001 C CNN
F 3 "" H 6750 15050 50  0001 C CNN
	1    6750 15050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 15050 6750 14900
Text GLabel 8100 14400 2    50   Input ~ 0
PGC_TX
Text GLabel 8100 14000 2    50   Input ~ 0
PGC_RX
Wire Wire Line
	7550 14000 8100 14000
Wire Wire Line
	7550 14400 8100 14400
$Comp
L PumpController-rescue:CP-Device C4
U 1 1 611427E6
P 7300 12200
F 0 "C4" H 7418 12246 50  0000 L CNN
F 1 "1u" H 7418 12155 50  0000 L CNN
F 2 "" H 7338 12050 50  0001 C CNN
F 3 "~" H 7300 12200 50  0001 C CNN
	1    7300 12200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 11900 6750 12000
Wire Wire Line
	7300 12050 7300 12000
Wire Wire Line
	7300 12000 6750 12000
Connection ~ 6750 12000
Wire Wire Line
	6750 12000 6750 12500
$Comp
L PumpController-rescue:GND-power #PWR08
U 1 1 61149C03
P 7300 12450
F 0 "#PWR08" H 7300 12200 50  0001 C CNN
F 1 "GND" H 7305 12277 50  0000 C CNN
F 2 "" H 7300 12450 50  0001 C CNN
F 3 "" H 7300 12450 50  0001 C CNN
	1    7300 12450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 12450 7300 12350
$Comp
L PumpController-rescue:CP-Device C2
U 1 1 6114CD53
P 5350 14700
F 0 "C2" H 5232 14654 50  0000 R CNN
F 1 "1u" H 5232 14745 50  0000 R CNN
F 2 "" H 5388 14550 50  0001 C CNN
F 3 "~" H 5350 14700 50  0001 C CNN
	1    5350 14700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 14550 5350 13600
Wire Wire Line
	5350 13600 5950 13600
$Comp
L PumpController-rescue:GND-power #PWR05
U 1 1 61151226
P 5350 15050
F 0 "#PWR05" H 5350 14800 50  0001 C CNN
F 1 "GND" H 5355 14877 50  0000 C CNN
F 2 "" H 5350 15050 50  0001 C CNN
F 3 "" H 5350 15050 50  0001 C CNN
	1    5350 15050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 15050 5350 14850
$Comp
L PumpController-rescue:CP-Device C1
U 1 1 61154B1C
P 5350 12950
F 0 "C1" H 5468 12996 50  0000 L CNN
F 1 "1u" H 5468 12905 50  0000 L CNN
F 2 "" H 5388 12800 50  0001 C CNN
F 3 "~" H 5350 12950 50  0001 C CNN
	1    5350 12950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 12800 5950 12800
Wire Wire Line
	5950 13100 5350 13100
$Comp
L PumpController-rescue:CP-Device C5
U 1 1 6115CC74
P 8000 12950
F 0 "C5" H 8118 12996 50  0000 L CNN
F 1 "1u" H 8118 12905 50  0000 L CNN
F 2 "" H 8038 12800 50  0001 C CNN
F 3 "~" H 8000 12950 50  0001 C CNN
	1    8000 12950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 13100 7550 13100
Wire Wire Line
	7550 12800 8000 12800
$Comp
L PumpController-rescue:CP-Device C3
U 1 1 61163EF8
P 5650 12500
F 0 "C3" H 5532 12454 50  0000 R CNN
F 1 "1u" H 5532 12545 50  0000 R CNN
F 2 "" H 5688 12350 50  0001 C CNN
F 3 "~" H 5650 12500 50  0001 C CNN
	1    5650 12500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 12000 5650 12000
Wire Wire Line
	5650 12000 5650 12350
Wire Wire Line
	5650 12650 5650 13300
Wire Wire Line
	5650 13300 5950 13300
Text Notes 10050 12300 0    98   ~ 20
Rotary encoder
$Comp
L PumpController-rescue:GND-power #PWR010
U 1 1 611A693C
P 9700 14450
F 0 "#PWR010" H 9700 14200 50  0001 C CNN
F 1 "GND" H 9705 14277 50  0000 C CNN
F 2 "" H 9700 14450 50  0001 C CNN
F 3 "" H 9700 14450 50  0001 C CNN
	1    9700 14450
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R15
U 1 1 611ADECD
P 9550 13150
F 0 "R15" H 9620 13196 50  0000 L CNN
F 1 "10k" H 9620 13105 50  0000 L CNN
F 2 "" V 9480 13150 50  0001 C CNN
F 3 "~" H 9550 13150 50  0001 C CNN
	1    9550 13150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R16
U 1 1 611AE7C6
P 9850 13150
F 0 "R16" H 9920 13196 50  0000 L CNN
F 1 "10k" H 9920 13105 50  0000 L CNN
F 2 "" V 9780 13150 50  0001 C CNN
F 3 "~" H 9850 13150 50  0001 C CNN
	1    9850 13150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 13000 9550 12900
Wire Wire Line
	9550 12900 9700 12900
Wire Wire Line
	9700 12900 9850 12900
Wire Wire Line
	9850 12900 9850 13000
Connection ~ 9700 12900
Wire Wire Line
	9850 13300 9850 13650
Wire Wire Line
	9850 13650 10400 13650
Wire Wire Line
	10400 13850 9550 13850
Wire Wire Line
	9550 13850 9550 13300
Wire Wire Line
	9700 13750 9700 14450
Text GLabel 9200 13650 0    50   Input ~ 0
RE_OUT_A
Text GLabel 9200 13850 0    50   Input ~ 0
RE_OUT_B
Wire Wire Line
	9550 13850 9200 13850
Connection ~ 9550 13850
Wire Wire Line
	9200 13650 9850 13650
Connection ~ 9850 13650
$Comp
L PumpController-rescue:+3.3V-power #PWR09
U 1 1 611E0070
P 9700 12700
F 0 "#PWR09" H 9700 12550 50  0001 C CNN
F 1 "+3.3V" H 9715 12873 50  0000 C CNN
F 2 "" H 9700 12700 50  0001 C CNN
F 3 "" H 9700 12700 50  0001 C CNN
	1    9700 12700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 12700 9700 12900
$Comp
L PumpController-rescue:R-Device R18
U 1 1 611E63A7
P 11700 13150
F 0 "R18" H 11770 13196 50  0000 L CNN
F 1 "10k" H 11770 13105 50  0000 L CNN
F 2 "" V 11630 13150 50  0001 C CNN
F 3 "~" H 11700 13150 50  0001 C CNN
	1    11700 13150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+3.3V-power #PWR012
U 1 1 611E6835
P 11700 12700
F 0 "#PWR012" H 11700 12550 50  0001 C CNN
F 1 "+3.3V" H 11715 12873 50  0000 C CNN
F 2 "" H 11700 12700 50  0001 C CNN
F 3 "" H 11700 12700 50  0001 C CNN
	1    11700 12700
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR011
U 1 1 611E6E90
P 11200 14450
F 0 "#PWR011" H 11200 14200 50  0001 C CNN
F 1 "GND" H 11205 14277 50  0000 C CNN
F 2 "" H 11200 14450 50  0001 C CNN
F 3 "" H 11200 14450 50  0001 C CNN
	1    11200 14450
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:C-Device C6
U 1 1 611F047F
P 11700 14100
F 0 "C6" H 11815 14146 50  0000 L CNN
F 1 "0.1u" H 11815 14055 50  0000 L CNN
F 2 "" H 11738 13950 50  0001 C CNN
F 3 "~" H 11700 14100 50  0001 C CNN
	1    11700 14100
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R17
U 1 1 611F1597
P 11300 13650
F 0 "R17" V 11093 13650 50  0000 C CNN
F 1 "1k" V 11184 13650 50  0000 C CNN
F 2 "" V 11230 13650 50  0001 C CNN
F 3 "~" H 11300 13650 50  0001 C CNN
	1    11300 13650
	0    1    1    0   
$EndComp
Wire Wire Line
	11000 13850 11200 13850
Wire Wire Line
	11200 13850 11200 14350
Wire Wire Line
	11700 14250 11700 14350
Wire Wire Line
	11700 14350 11200 14350
Connection ~ 11200 14350
Wire Wire Line
	11200 14350 11200 14450
Wire Wire Line
	11450 13650 11700 13650
Wire Wire Line
	11700 13650 11700 13950
Wire Wire Line
	11700 13300 11700 13650
Connection ~ 11700 13650
Wire Wire Line
	11700 13000 11700 12700
Wire Wire Line
	11150 13650 11000 13650
Text GLabel 11950 13650 2    50   Input ~ 0
RE_BT
Wire Wire Line
	11950 13650 11700 13650
Text Notes 14000 12650 0    98   ~ 20
LCD (16x2 alphanumerical display I2C)
$Comp
L PumpController-rescue:GND-power #PWR019
U 1 1 61223EC6
P 15250 14250
F 0 "#PWR019" H 15250 14000 50  0001 C CNN
F 1 "GND" H 15255 14077 50  0000 C CNN
F 2 "" H 15250 14250 50  0001 C CNN
F 3 "" H 15250 14250 50  0001 C CNN
	1    15250 14250
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+5V-power #PWR018
U 1 1 61224681
P 15250 12900
F 0 "#PWR018" H 15250 12750 50  0001 C CNN
F 1 "+5V" H 15265 13073 50  0000 C CNN
F 2 "" H 15250 12900 50  0001 C CNN
F 3 "" H 15250 12900 50  0001 C CNN
	1    15250 12900
	1    0    0    -1  
$EndComp
Wire Wire Line
	15250 13050 15250 12900
Wire Wire Line
	15250 14050 15250 14250
$Comp
L PumpController-rescue:C-Device C8
U 1 1 6122F7BE
P 16250 13350
F 0 "C8" H 16365 13396 50  0000 L CNN
F 1 "1u" H 16365 13305 50  0000 L CNN
F 2 "" H 16288 13200 50  0001 C CNN
F 3 "~" H 16250 13350 50  0001 C CNN
	1    16250 13350
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:C-Device C7
U 1 1 612302F3
P 14550 13950
F 0 "C7" H 14665 13996 50  0000 L CNN
F 1 "1u" H 14665 13905 50  0000 L CNN
F 2 "" H 14588 13800 50  0001 C CNN
F 3 "~" H 14550 13950 50  0001 C CNN
	1    14550 13950
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 13800 14550 13750
Wire Wire Line
	14550 13750 14750 13750
Wire Wire Line
	14750 13750 14750 13850
Wire Wire Line
	14750 13850 14850 13850
$Comp
L PumpController-rescue:GND-power #PWR017
U 1 1 61239A1F
P 14550 14250
F 0 "#PWR017" H 14550 14000 50  0001 C CNN
F 1 "GND" H 14555 14077 50  0000 C CNN
F 2 "" H 14550 14250 50  0001 C CNN
F 3 "" H 14550 14250 50  0001 C CNN
	1    14550 14250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 14250 14550 14100
Wire Wire Line
	15650 13350 15850 13350
Wire Wire Line
	15850 13350 15850 13200
Wire Wire Line
	15850 13200 16250 13200
Wire Wire Line
	16250 13500 15850 13500
Wire Wire Line
	15850 13500 15850 13450
Wire Wire Line
	15850 13450 15650 13450
$Comp
L PumpController-rescue:GND-power #PWR020
U 1 1 612483CA
P 15850 14250
F 0 "#PWR020" H 15850 14000 50  0001 C CNN
F 1 "GND" H 15855 14077 50  0000 C CNN
F 2 "" H 15850 14250 50  0001 C CNN
F 3 "" H 15850 14250 50  0001 C CNN
	1    15850 14250
	1    0    0    -1  
$EndComp
Wire Wire Line
	15850 14250 15850 13750
Wire Wire Line
	15850 13750 15650 13750
$Comp
L PumpController-rescue:R-Device R20
U 1 1 6124E816
P 14250 13150
F 0 "R20" H 14320 13196 50  0000 L CNN
F 1 "4.7k" H 14320 13105 50  0000 L CNN
F 2 "" V 14180 13150 50  0001 C CNN
F 3 "~" H 14250 13150 50  0001 C CNN
	1    14250 13150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R19
U 1 1 6124F588
P 13950 13150
F 0 "R19" H 14020 13196 50  0000 L CNN
F 1 "4.7k" H 14020 13105 50  0000 L CNN
F 2 "" V 13880 13150 50  0001 C CNN
F 3 "~" H 13950 13150 50  0001 C CNN
	1    13950 13150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R21
U 1 1 6124FB57
P 16700 13100
F 0 "R21" H 16770 13146 50  0000 L CNN
F 1 "220" H 16770 13055 50  0000 L CNN
F 2 "" V 16630 13100 50  0001 C CNN
F 3 "~" H 16700 13100 50  0001 C CNN
	1    16700 13100
	1    0    0    -1  
$EndComp
Wire Wire Line
	15650 13650 16700 13650
Wire Wire Line
	16700 13650 16700 13250
Wire Wire Line
	14250 13300 14250 13450
Wire Wire Line
	13950 13550 13950 13300
$Comp
L PumpController-rescue:+5V-power #PWR023
U 1 1 6125FEDD
P 16700 12850
F 0 "#PWR023" H 16700 12700 50  0001 C CNN
F 1 "+5V" H 16715 13023 50  0000 C CNN
F 2 "" H 16700 12850 50  0001 C CNN
F 3 "" H 16700 12850 50  0001 C CNN
	1    16700 12850
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+3.3V-power #PWR016
U 1 1 61261908
P 14100 12900
F 0 "#PWR016" H 14100 12750 50  0001 C CNN
F 1 "+3.3V" H 14115 13073 50  0000 C CNN
F 2 "" H 14100 12900 50  0001 C CNN
F 3 "" H 14100 12900 50  0001 C CNN
	1    14100 12900
	1    0    0    -1  
$EndComp
Wire Wire Line
	14250 13000 14100 13000
Wire Wire Line
	14100 13000 14100 12900
Wire Wire Line
	13950 13000 14100 13000
Connection ~ 14100 13000
Wire Wire Line
	16700 12950 16700 12850
Wire Wire Line
	14250 13450 14850 13450
Wire Wire Line
	14850 13550 13950 13550
Text GLabel 13700 13450 0    50   Input ~ 0
SDA
Text GLabel 13700 13600 0    50   Input ~ 0
SCL
Text GLabel 13700 13750 0    50   Input ~ 0
RST
Wire Wire Line
	13700 13450 14250 13450
Connection ~ 14250 13450
Wire Wire Line
	13700 13600 13950 13600
Wire Wire Line
	13950 13600 13950 13550
Connection ~ 13950 13550
Wire Wire Line
	14850 13650 14000 13650
Wire Wire Line
	14000 13650 14000 13750
Wire Wire Line
	14000 13750 13700 13750
$Comp
L PumpController-rescue:+3.3V-power #PWR013
U 1 1 612B45C7
P 20150 1900
F 0 "#PWR013" H 20150 1750 50  0001 C CNN
F 1 "+3.3V" H 20165 2073 50  0000 C CNN
F 2 "" H 20150 1900 50  0001 C CNN
F 3 "" H 20150 1900 50  0001 C CNN
	1    20150 1900
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+5V-power #PWR014
U 1 1 612B806F
P 19900 1900
F 0 "#PWR014" H 19900 1750 50  0001 C CNN
F 1 "+5V" H 19800 2100 50  0000 L CNN
F 2 "" H 19900 1900 50  0001 C CNN
F 3 "" H 19900 1900 50  0001 C CNN
	1    19900 1900
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR015
U 1 1 612CBC1C
P 19950 8350
F 0 "#PWR015" H 19950 8100 50  0001 C CNN
F 1 "GND" H 19955 8177 50  0000 C CNN
F 2 "" H 19950 8350 50  0001 C CNN
F 3 "" H 19950 8350 50  0001 C CNN
	1    19950 8350
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:REF3030-Reference_Voltage U3
U 1 1 6131C52C
P 11050 3300
F 0 "U3" H 10820 3346 50  0000 R CNN
F 1 "REF3030" H 10820 3255 50  0000 R CIN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11050 2850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/ref3033.pdf" H 11150 2950 50  0001 C CIN
	1    11050 3300
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+5V-power #PWR021
U 1 1 61335C5C
P 10950 2700
F 0 "#PWR021" H 10950 2550 50  0001 C CNN
F 1 "+5V" H 10965 2873 50  0000 C CNN
F 2 "" H 10950 2700 50  0001 C CNN
F 3 "" H 10950 2700 50  0001 C CNN
	1    10950 2700
	-1   0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR022
U 1 1 613372EC
P 10950 3800
F 0 "#PWR022" H 10950 3550 50  0001 C CNN
F 1 "GND" H 10955 3627 50  0000 C CNN
F 2 "" H 10950 3800 50  0001 C CNN
F 3 "" H 10950 3800 50  0001 C CNN
	1    10950 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10950 3000 10950 2700
Wire Wire Line
	10950 3600 10950 3800
Text GLabel 12400 6400 0    50   Input ~ 0
Pump_0_FAULT
Text GLabel 20300 3100 2    50   Input ~ 0
Pump_1_START
Text GLabel 12400 6500 0    50   Input ~ 0
Pump_1_FAULT
Text GLabel 4000 6650 2    50   Input ~ 0
Pump_1_NORMAL
Text GLabel 12300 3200 0    50   Input ~ 0
Pump_1_FREQ
Text GLabel 12300 3100 0    50   Input ~ 0
Pump_0_FREQ
Text GLabel 12300 3000 0    50   Input ~ 0
PG_SIGNAL
Wire Wire Line
	12800 3100 12300 3100
Wire Wire Line
	12300 3200 12800 3200
Wire Wire Line
	12800 3000 12300 3000
Text GLabel 20300 3000 2    50   Input ~ 0
Pump_0_START
Wire Wire Line
	12400 6400 12800 6400
Wire Wire Line
	12400 6500 12800 6500
Text GLabel 20300 4300 2    50   Input ~ 0
RE_OUT_A
Text GLabel 20300 4200 2    50   Input ~ 0
RE_OUT_B
Text GLabel 20300 4400 2    50   Input ~ 0
RE_BT
Text GLabel 12250 4400 0    50   Input ~ 0
SDA
Text GLabel 12250 4500 0    50   Input ~ 0
SCL
Wire Wire Line
	9700 13750 10400 13750
Wire Wire Line
	7400 2450 3150 2450
Wire Wire Line
	7400 2450 7400 2750
Wire Wire Line
	3150 2250 3600 2250
Connection ~ 3600 2250
Wire Wire Line
	3600 2250 3600 1850
$Comp
L PumpController-rescue:Buzzer-Device BZ?
U 1 1 6106CA8E
P 21050 12700
F 0 "BZ?" H 21202 12729 50  0000 L CNN
F 1 "Buzzer" H 21202 12638 50  0000 L CNN
F 2 "" V 21025 12800 50  0001 C CNN
F 3 "~" V 21025 12800 50  0001 C CNN
	1    21050 12700
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:2N2219-Transistor_BJT Q?
U 1 1 6106E2A4
P 20550 13150
F 0 "Q?" H 20740 13196 50  0000 L CNN
F 1 "2N2219" H 20740 13105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 20750 13075 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 20550 13150 50  0001 L CNN
	1    20550 13150
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:+5V-power #PWR?
U 1 1 610727B8
P 20650 12450
F 0 "#PWR?" H 20650 12300 50  0001 C CNN
F 1 "+5V" H 20665 12623 50  0000 C CNN
F 2 "" H 20650 12450 50  0001 C CNN
F 3 "" H 20650 12450 50  0001 C CNN
	1    20650 12450
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:GND-power #PWR?
U 1 1 610730E6
P 20650 13550
F 0 "#PWR?" H 20650 13300 50  0001 C CNN
F 1 "GND" H 20655 13377 50  0000 C CNN
F 2 "" H 20650 13550 50  0001 C CNN
F 3 "" H 20650 13550 50  0001 C CNN
	1    20650 13550
	1    0    0    -1  
$EndComp
$Comp
L PumpController-rescue:R-Device R?
U 1 1 6107384E
P 20050 13150
F 0 "R?" V 19843 13150 50  0000 C CNN
F 1 "1k" V 19934 13150 50  0000 C CNN
F 2 "" V 19980 13150 50  0001 C CNN
F 3 "~" H 20050 13150 50  0001 C CNN
	1    20050 13150
	0    1    1    0   
$EndComp
Wire Wire Line
	20950 12600 20650 12600
Wire Wire Line
	20650 12600 20650 12450
Wire Wire Line
	20650 12950 20650 12800
Wire Wire Line
	20650 12800 20950 12800
Wire Wire Line
	20650 13350 20650 13550
Wire Wire Line
	20200 13150 20350 13150
Text GLabel 19700 13150 0    50   Input ~ 0
BUZZER
Wire Wire Line
	19900 13150 19700 13150
Text GLabel 20300 6400 2    50   Input ~ 0
BUZZER
$Comp
L PumpController-rescue:DZ2S033X0L-Diode D?
U 1 1 610DC5CB
P 4200 3350
F 0 "D?" V 4200 3050 50  0000 L CNN
F 1 "DZ2S033X0L" V 4050 2850 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 4200 3175 50  0001 C CNN
F 3 "https://industrial.panasonic.com/content/data/SC/ds/ds4/DZ2S03300L_E.pdf" H 4200 3350 50  0001 C CNN
	1    4200 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 3150 4200 3150
Wire Wire Line
	4200 3150 4200 3200
Wire Wire Line
	4200 3500 4200 3550
Wire Wire Line
	4200 3550 4500 3550
Connection ~ 4500 3550
Wire Wire Line
	4500 3550 4500 3600
$Comp
L PumpController-rescue:DZ2S033X0L-Diode D?
U 1 1 610F661F
P 4600 6950
F 0 "D?" V 4600 6650 50  0000 L CNN
F 1 "DZ2S033X0L" V 4450 6450 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 4600 6775 50  0001 C CNN
F 3 "https://industrial.panasonic.com/content/data/SC/ds/ds4/DZ2S03300L_E.pdf" H 4600 6950 50  0001 C CNN
	1    4600 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 7100 4600 7150
Wire Wire Line
	4600 7150 5000 7150
Connection ~ 5000 7150
Wire Wire Line
	5000 7150 5000 7200
Wire Wire Line
	5000 6750 4600 6750
Wire Wire Line
	4600 6750 4600 6800
$Comp
L PumpController-rescue:DZ2S033X0L-Diode D?
U 1 1 61112B59
P 4750 9900
F 0 "D?" V 4750 9600 50  0000 L CNN
F 1 "DZ2S033X0L" V 4600 9400 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 4750 9725 50  0001 C CNN
F 3 "https://industrial.panasonic.com/content/data/SC/ds/ds4/DZ2S03300L_E.pdf" H 4750 9900 50  0001 C CNN
	1    4750 9900
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 9750 4750 9700
Wire Wire Line
	4750 9700 5050 9700
Wire Wire Line
	4750 10050 4750 10100
Wire Wire Line
	4750 10100 5050 10100
Connection ~ 5050 10100
Wire Wire Line
	5050 10100 5050 10150
$Comp
L STM32F3DISCOVERY:STM32F3DISCOVERY TB?
U 1 1 611027E8
P 16300 5200
F 0 "TB?" H 16250 8367 50  0000 C CNN
F 1 "STM32F3DISCOVERY" H 16250 8276 50  0000 C CNN
F 2 "SHIELD_STM32F3DISCOVERY" H 16300 5200 50  0001 L BNN
F 3 "" H 16300 5200 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 16300 5200 50  0001 L BNN "STANDARD"
F 5 "ST MICROELECTRONICS" H 16300 5200 50  0001 L BNN "MANUFACTURER"
F 6 "5" H 16300 5200 50  0001 L BNN "PARTREV"
	1    16300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6100 7050 6100
Wire Wire Line
	3050 5850 4300 5850
Wire Wire Line
	3050 6050 3850 6050
Wire Wire Line
	3050 6250 6050 6250
Wire Wire Line
	3050 6350 5000 6350
Wire Wire Line
	3050 6450 3850 6450
Wire Wire Line
	3850 6050 3850 6450
Wire Wire Line
	19700 8100 19950 8100
Wire Wire Line
	19950 8100 19950 8350
Wire Wire Line
	19900 1900 19900 2400
Wire Wire Line
	19900 2400 19700 2400
Wire Wire Line
	19700 2500 20150 2500
Wire Wire Line
	20150 1900 20150 2500
Wire Wire Line
	12250 4400 12800 4400
Wire Wire Line
	12250 4500 12800 4500
Wire Wire Line
	19700 4400 20300 4400
Wire Wire Line
	19700 4300 20300 4300
Wire Wire Line
	19700 4200 20300 4200
Wire Wire Line
	19700 6400 20300 6400
Wire Wire Line
	19700 3100 20300 3100
Wire Wire Line
	19700 3000 20300 3000
Wire Wire Line
	12800 6800 12300 6800
Wire Wire Line
	12300 6900 12800 6900
Text GLabel 12400 6900 0    50   Input ~ 0
PGC_RX
Text GLabel 12400 6800 0    50   Input ~ 0
PGC_TX
Wire Wire Line
	12800 3300 11350 3300
$EndSCHEMATC