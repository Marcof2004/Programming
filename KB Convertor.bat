@echo OFF
echo KB Convertor

set /p kbs=Enter KB:

set /A kbs= %kbs%/1000000000

echo %kbs%
pause