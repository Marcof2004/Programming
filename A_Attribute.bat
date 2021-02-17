@echo off 
set /A globalvar = 5
SETLOCAL
set /A var = 13145
set /A A = %var% + 5
echo %var%
echo %A%
echo %globalvar%
PAUSE
ENDLOCAL