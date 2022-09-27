#!/usr/bin/python

import serial
import os

# def leak(ser):
#     leak = []
#     np_leak = []
#     if ser.in_waiting > 0:
#         line = ser.readline().decode('utf-8').rstrip()
#         return True
#     else:
#         return False

if __name__ == '__main__':
    ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
    ser.reset_input_buffer()
    while True:
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8').rstrip()
            if line == "Leak Detected!":
                print(line)
                os.system("shutdown now -h")
            else:
                print(line)