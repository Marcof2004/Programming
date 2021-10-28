@echo off
set str= What are we doing
call :strLen str strLen
echo String is %strlen% characters long 

:strLen
setlocal enabledelayedexpansion

:strLen_Loop
	if not "!%1:~%len%!"=="" set /A len+=1 & goto :strLen_Loop
(endlocal & set %2=%len%)
goto :eof