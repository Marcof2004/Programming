@echo off
:menu
echo ===================================
echo           Calculator
echo ===================================
echo 1- Multiplication
echo 2- Division
echo 3- Addition
echo 4- Subtraction
echo 5- Powers
echo Place the number of the option to choose
echo If opened by accident type Exit to leave.
set /p opt=Choose:
if %opt%== 1 goto opx1
if %opt%== 2 goto opx2
if %opt%== 3 goto opx3
if %opt%== 4 goto opx4
if %opt%== 5 goto opx5
if %opt%== Exit goto out
if %opt%== exit goto out 
goto 404

:opx1
::Multiplication
::Mu var name for number to be multiplied mox to do the operation.

echo Place first number to multiply
set /p mu_1=Number 1:
echo Place second number to multiply 
set /p mu_2=Number 2:
set /a mox= %mu_1% * %mu_2%
echo %mox%

pause
goto menu
:opx2
::Division
echo Place the first number to divide
set /p dv_1=Number 1:
echo Place the second number to multiply
set /p dv_2=Number 2:
set /a divid= %dv_1% / %dv_2%
echo %divid%
pause 
goto menu

:opx3
::Addition
echo Place the first number to add 
set /p add_1=Number 1:
echo Place the second number to add 
set /p add_2=Number 2:
set /a addit= %add_1% + %add_2%
echo %addit%
pause 
goto menu

:opx4 
::Subtraction
echo Place the first number to subtract
set /p sub_1=Number 1:
echo Place the second number to add
set /p sub_2=Number 2:
set /a subt= %sub_1% - %sub_2%
echo %subt%
pause 
goto menu

:opx5
::POWERS
::Power to be aplied to conditienated goto with comparasion argument LSS, 
::multiplication will be apllied until comparison is satiesfied than echo and goto menu. 
::Base is the number that the exponent will be applied to
echo Place the number you want to apply the exponent to.(The base)
set /p bs=Base:
echo Place the exponent to be applied
set /p ex=Exponent:
::exptmp is the value used to quantify multiplication times
set /a exptmp=0

:mainex
::mainex gives the initial condition
if %exptmp% LSS %ex% goto exp_1
goto outputex

::mainex_2 gives the secondary condition
:mainex_2
if %exptmp% LSS %ex% goto exp_2
goto outputex

:exp_1
set /a exptmp= %exptmp% + 2
::expon is the value for the final answers
set /a expon= %bs% * %bs%
goto mainex_2

:exp_2
set /a exptmp= %exptmp% + 1
set /a expon= %expon% * %bs%
goto mainex_2

:outputex
echo %expon%
pause 
goto menu

:404
echo msgbox "The option you are selecting was not specified, choose a valid option." > %tmp%\tmp.vbs
cscript /nologo %tmp%\\tmp.vbs 
del %tmp%\tmp.vbs  
echo Press enter to go to menu.
pause >null
goto menu

:out
Exit