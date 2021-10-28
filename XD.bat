@echo off
:menu
cls 
echo ===========================================
echo                 Esta mamada
echo ===========================================
echo Select the the dessired option
echo ======
echo Type the option with a number from 1 to 4, or "Exit" if you misclicked or want to get out.
echo 1- Option 1
echo 2- Option 2
echo 3- Option 3
echo 4- Option 4
set /p op=Run:
if %op%== 1 goto 1
if %op%== 2 goto 2
if %op%== 3 goto 3
if %op%== 4 goto 4
if %op%== Exit goto out
goto 404

:1
cls 
echo SOS GIL
echo Press enter to go to menu
pause >null
goto menu

:2 
cls 
echo Sos pendejo
echo Press enter to go to menu
pause >null 
goto menu

:3
cls 
echo Ola buenas sos tremendo
echo Press enter to go to menu
pause >null
goto menu

:4 
cls 
echo Sos idiota
pause > null
echo pero si lograste ver esto tenes algo de cerebro
echo Press enter to go to menu
pause >null
goto menu

:404
cls 
echo msgbox "LA CAGASTE PONIENDO 4 NUMEROS" > %tmp%\tmp.vbs
cscript /nologo %tmp%\\tmp.vbs 
del %tmp%\tmp.vbss
goto menu

:out
Exit