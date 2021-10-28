import pyautogui as auto
from time import sleep


while True:
    posXY = auto.position()
    print(posXY, auto.pixel(posXY[0],posXY[1]))
    sleep(1)
    if posXY[0] == 0:
        break