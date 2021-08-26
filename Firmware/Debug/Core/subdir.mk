################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Device.cpp \
../Core/Display.cpp \
../Core/LCDI2C.cpp \
../Core/Pin.cpp \
../Core/Pirani.cpp \
../Core/TurboPump.cpp 

OBJS += \
./Core/Device.o \
./Core/Display.o \
./Core/LCDI2C.o \
./Core/Pin.o \
./Core/Pirani.o \
./Core/TurboPump.o 

CPP_DEPS += \
./Core/Device.d \
./Core/Display.d \
./Core/LCDI2C.d \
./Core/Pin.d \
./Core/Pirani.d \
./Core/TurboPump.d 


# Each subdirectory must supply rules for building sources it contributes
Core/%.o: ../Core/%.cpp Core/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

