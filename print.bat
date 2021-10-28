@echo off

set /A i = 0
:S
if %i% LSS == 999 goto L
goto E

:L
set /A i= %i% + 1
echo XD
goto S
:E
echo 1000 XD have been typed.
PAUSE