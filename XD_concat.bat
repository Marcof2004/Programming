@echo off
echo XD moment
set x= XD
set d1= D
set /A op= 0

:S
set op= %op% + 1
set x= %x% %d1%
echo %op%
echo %x%
PAUSE