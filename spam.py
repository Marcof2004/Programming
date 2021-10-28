import time
import random 
import pyautogui as auto
#Setting list to make choice
ch_list = [1,2,3,4]
x=0

time.sleep(0.1)

while x < 88:
    x = x + 1
    rand_num = random.choice(ch_list)
    if rand_num == 1:
        auto.write("Juan es gil")
        auto.press('Enter')
        time.sleep(0.1)
    if rand_num == 2:
        auto.write("Ricky el poderoso")
        auto.press('Enter')
        time.sleep(0.1)
    if rand_num == 3:
        auto.write("No me funen")
        auto.press('Enter')
        time.sleep(0.1)
    if rand_num == 4:
        auto.write("Osi, ose")
        auto.press("Enter")
        time.sleep(0.1)
    elif x == 45:
        auto.write("YA FALTA POCO")
        auto.press('Enter')
        time.sleep(0.2)