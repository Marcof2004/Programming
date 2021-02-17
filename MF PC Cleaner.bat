@echo off
Title PC Cleaner

:menu 
cls 
echo ===========================================
echo                  PC Cleaner
echo ===========================================
echo Select the the type of cleanup to be executed.
echo ======
echo Type the option with a number from 1 to 4, or "Exit" if you misclicked or want to get out.
echo 1- Delete Internet Cookies
echo 2- Delete Temporary Files or Temps
echo 3- Disk Cleanup 
echo 4- Delete Defragment
echo. 
set /p op=Run:
if %op%== 1 goto 1
if %op%== 2 goto 2
if %op%== 3 goto 3
if %op%== 4 goto 4
goto error 

:1
cls 
echo ==========================
echo        Delete Cookies 
echo ==========================
echo Before we can delete your web navigation cookies, check your browser is closed.
echo When your browser is closed press enter.
pause>nul
echo Deleting Cookies...
ping localhost -n 3 >nul
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cookies"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cookies-journal"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Extension Cookies"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Extension Cookies-journal"
cls 

echo ==========================
echo        Delete Cookies 
echo ==========================
echo.
echo Internet Cookies Cleaned Succesfully!
echo.
echo Press enter to go to menu
pause >nul
goto menu

:2
cls 
echo ===========================
echo     Delete Temp Files
echo ===========================
echo.
echo Before we can delelete you temporary files, close all apps in your computer.
echo Press enter when you are ready...
pause >nul
echo Deleting temporary files...
ping localhost -n 3 >nul
::The file path is wrong
del /f/q "%userprofile%\AppData\Local\Microsoft\Windows\caches"
del /f/q "%userprofile%\AppData\Local\Microsoft\NetTraces"
del /f/q "C:\Windows\Temp"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\cache"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Code Cache"
del /f/q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Application Cache"
pause
cls
echo ===========================
echo     Delete Temp Files
echo ===========================
echo. 
echo Temporary Files deleted succesfully
echo Press enter to go to menu 
pause >nul 
goto menu


