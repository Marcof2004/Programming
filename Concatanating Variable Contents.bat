@echo off
Set A= Hello
Set B= Magnificent
Set /A C= 50
::When equaling a varible to other variables, or echoing variables in the same line you concatenate their contents
set D= %A% %B% %C%
echo %D%
echo %A% %B% %C%
PAUSE