@echo off
:: Set the initial condition
set /A i= 0
::Check if condition has been satified
:S
if %i% LSS == 1000 goto L 
goto E
::"L" stands for the content of the loop
:L
set /A i= %i% + 1
echo XD
goto S
::Exit from Loop
:E
echo 1000 XD have been printed
PAUSE