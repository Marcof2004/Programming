import pyautogui as auto
import time

x = 0

time.sleep(0.5)

while x < 100:
    x = x + 1
    auto.write("Diego deja de andar con pendejadas")
    auto.press('Enter')
    time.sleep(0.1)

    if x == 100:
        auto.write("Si te los voy a pasar, pero no me vengas con que es cosa seria otra vez por esto...")
        auto.press('Enter')
