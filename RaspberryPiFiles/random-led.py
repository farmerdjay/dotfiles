from gpiozero import LED
from time import sleep
import random

red = LED(17)
yellow = LED(27)
green = LED(22)
blue = LED(23)

light = (red, yellow, green, blue)

while True:
    temp = random.choice(light)
    temp.on()
    sleep(.05)
    #sleep(random.uniform(.1, .2))
    temp = random.choice(light)
    temp.off()
    sleep(.05)
    #sleep(random.uniform(.1,.2))
