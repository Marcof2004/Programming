@echo off
mode 50
echo =================================
echo      Random Number Generator
echo =================================
echo By: Marco Figueroa
set /A L=0

::"F" are the desired number of possible 4 digit numbers to be generated
set /A F= 19
:I
if %L% LEQ == %F% goto Z
goto E

:Z
set /A L= %L% + 1
set /A num%L%= %random% %%9999 + 1
goto I

:E

set rand= %num1% %num2% %num3% %num4% %num5% %num6%
set rand2= %num7% %num8% %num9% %num10% %num11% %num12%
set rand3= %num13% %num14% %num16% %num17% %num18% %num19%

	
echo %rand%
echo %rand2% 
echo %rand3% 

PAUSE 