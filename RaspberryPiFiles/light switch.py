from gpiozero import LED
from time import sleep
import random

red = LED(17)
yellow = LED(27)
green = LED(22)
blue = LED(23)

while True:
    red.on()
    sleep(1)
    red.off()
    sleep(1)
    yellow.on()
    sleep(1)
    yellow.off()
    green.on()
    sleep(1)
    green.off()
    sleep(1)
    blue.on()
    sleep(1)
    blue.on()
    sleep(1)
    blue.off()
    sleep(1)
    red.on()
    yellow.on()
    green.on()
    blue.on()
    red.on()
    sleep(1)
