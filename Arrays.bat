@echo off
set a[0]=1
set list= 1 2 3 4 5 6 7 8
set c= This will show the %%a element
(for %%a in (%list%) do (
	echo Show the the %%a element
))

PAUSE


setlocal enabledelayedexpansion 
set topic[0]= comments
set topic[1]= variables
set topic[2]= arrays 
set topic[3]= Decision making
set topic[4]= Time and Date
set topic[5]= Operators

for /l %%n in (0,1,5) do (
	echo !topic[%%n]!
)
PAUSE	