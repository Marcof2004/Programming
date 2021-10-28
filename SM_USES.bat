@echo off
echo ===============================
echo       Use System Uses
echo ===============================
echo 1- Delete Temp Files
echo 2-
echo 3- 
echo 4- 
echo Type the number of the option you would like to execute 
set /P uf= Run:
if %uf% == 1 goto TF
if %uf% == 2 goto 
if %uf% == 3 goto 
if %uf% == 4 goto 

:TF
cd %Temp%
echo Current Directory:
cd
echo The directory is the file location in which the program is executing
echo Is the directory set to the termination \Appdata\Local\Temp ?
PAUSE