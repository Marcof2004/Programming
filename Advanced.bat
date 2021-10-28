ECHO OFF && PUSHD "%~dp0" && SETLOCAL && SETLOCAL ENABLEDELAYEDEXPANSION && SETLOCAL ENABLEEXTENSIONS

SET _CRYPTDRIVE=%~d0
SET PATH=%_CRYPTDRIVE%PP;%_CRYPTDRIVE%PPbin;%PATH%
SET _PUTTYBIN=%_CRYPTDRIVE%PPPputty.exe

SET _PSERVER=solar.power.com
SET _PPORT=22
SET _PSESSION=newclean-tunnel

SET _ADMINUSER=admin
SET _RUNUSER=life

REM SAY CHECKING PLINK OUT LOUD
CALL :SPEAK "Checking Putty"
ECHO "CHECKING PUTTY"

REM
IF NOT EXIST "%_CRYPTDRIVE%" (
  CALL :SPEAK "Crypt Not Mounted"
  AT|FOR /F "tokens=1" %%i IN ('FIND /I "%~f0"') DO AT %%i /delete /yes >nul 2>&1
  pskill.exe -t putty >nul 2>&1
  pskill.exe -t thunderbird >nul 2>&1
  pskill.exe -t ThunderbirdPortable >nul 2>&1
  pskill.exe -t Firefox >nul 2>&1
  pskill.exe -t FirefoxPortable >nul 2>&1
  pskill.exe -t GC >nul 2>&1
  EXIT
)

REM CREATE AT JOB TO RUN THIS SCRIPT EVERY 5 MINUTES
CALL :CREATEATJOB

pslist putty >nul 2>&1
IF ERRORLEVEL 1 psexec.exe -i 0 -e -d -u %_RUNUSER% %_PUTTYBIN% -load %_PSESSION%

REM KILL MULTIPLE PSEXEC's
CALL :KILLDUPES "psexec.exe"

REM KILL MULTIPLE CMD.EXE's
CALL :KILLDUPES "cmd.exe"

REM REACHABLE SERVER CHECK
CALL :PINGCHECK %_PSERVER%

REM CHECK FOR INACTIVE PUTTY
CALL :PUTTYCHECK

REM CHECK PORT IS LISTENING (FOR SOCKISFIED TUNNEL)
CALL :PORTCHECK %_PPORT%

REM CALL :SPEAK "OK"
SLEEP 100 && ECHO "OK" && SLEEP 1 && ENDLOCAL && POPD && EXIT

REM =======================================================================================
REM =   SPEAK - Speak text
REM =======================================================================================
:SPEAK
nircmd.exe speak text "%~1" 5 60
ECHO "%~1"
EXIT /B

REM =======================================================================================
REM =   RESTARTPLINK - Sleeps for %1 number of seconds
REM =======================================================================================
:RESTARTPLINK
CALL :SPEAK "%~1 ReSTARTing Plink"
REM runas /savecred /user:admin "%_PUTTYBIN% -load %_PSESSION%"
psexec.exe -i 0 -e -d -u %_RUNUSER% %_PUTTYBIN% -load %_PSESSION%
EXIT
EXIT /B

REM =======================================================================================
REM =   PORTCHECK - Check that Port is being used (for tunnels)
REM =======================================================================================
:PORTCHECK
netstat.exe -n -v -a -p TCP | FIND "ESTABLISHED" | FIND ":%~1" >nul 2>&1
IF ERRORLEVEL 1 CALL :RESTARTPLINK "PORT CHECK FAILED"
EXIT /B

REM =======================================================================================
REM =   INACTIVEPUTTYCHECK - Check for inactive putty windows
REM =======================================================================================
:PUTTYCHECK
tasklist.exe /V /NH /FI "WINDOWTITLE eq PuTTY (inactive)" 2>nul|FIND "INFO: " >nul 2>&1
IF ERRORLEVEL 1 taskkill.exe /T /F /FI "WINDOWTITLE eq PuTTY (inactive)" >nul 2>&1

:: MAKE SURE ONLY 1 putty is running that is connected to the remote server
netstat.exe -n -a -o -p TCP | FIND ":%_PPORT%" | FIND /C ":%_PPORT%" | FIND "1" >nul 2>&1
IF ERRORLEVEL 1 (
  tasklist.exe /V /FO TABLE /NH /FI "IMAGENAME eq putty.exe" 2>nul | FIND /C "Running" | FIND "1" >nul 2>&1
  IF ERRORLEVEL 1 (
    REM kill all running puttys (owned by system)
    FOR /F "usebackq tokens=2 skip=2" %%p IN (`tasklist.exe /V /FO TABLE /NH /FI "IMAGENAME eq putty.exe"`) DO taskkill.exe /F /PID %%p /T >nul 2>&1
    CALL :RESTARTPLINK "EXTRA PUTTY FOUND"
  )
)
EXIT /B

REM =======================================================================================
REM =   PINGCHECK - PING address to make sure it is reachable
REM =======================================================================================
:PINGCHECK
PING %~1 -n 1 -w 5000 | FIND "TTL=" >nul 2>&1
IF ERRORLEVEL 1 (
  PING google.com -n 1 -w 500 | FIND "TTL=" >nul 2>&1
  IF ERRORLEVEL 1 ( CALL :SPEAK "CHECK INTERNET CONNECTION" && SLEEP 60 )

  PING google.com -n 1 -w 5000 | FIND "TTL=" >nul 2>&1
  IF ERRORLEVEL 1 ( CALL :SPEAK "CHECK INTERNET CONNECTION" && SLEEP 60 )

  PING google.com -n 1 -w 5000 | FIND "TTL=" >nul 2>&1
  IF ERRORLEVEL 1 (
    CALL :SPEAK "KILL SOCKS PROGRAMS"
  SLEEP 100
  pskill.exe -t putty >nul 2>&1
  pskill.exe -t thunderbird >nul 2>&1
  pskill.exe -t ThunderbirdPortable >nul 2>&1
  )
)
EXIT /B

REM =======================================================================================
REM =   KILLDUPES - kills duplicate processes, except for the one with lowest pid
REM =======================================================================================
:KILLDUPES
REM Check that more than 1 process is running
tasklist.exe /V /NH /FI "IMAGENAME eq %~1" /FI "USERNAME eq SYSTEM" 2>nul | FIND /C "K Running" | FIND "1" >nul 2>&1
IF NOT ERRORLEVEL 1 EXIT /B

REM Create Filename in current dir (of this script)
SET _T=%TIME: =0%&&SET _T=!_T::=-!&&SET _T=%~dp0%!_T:~0,-2!log

REM Create the file in the same dir as this script named for date and sorted by PID
tasklist.exe /V /NH /FI "IMAGENAME eq %~1" /FI "USERNAME eq SYSTEM" 2>nul | SORT /+29 > "%_T%"

REM Check that the file was created or exit
IF NOT EXIST "%_T%" ( CALL :SPEAK "FILE CREATION FAILED" && EXIT /B )

REM kill all the processes found except for 1, do not kill the process with the lowest pid number
FOR /F "tokens=2 skip=2" %%p IN (%_T%) DO taskkill.exe /F /PID %%p /T

REM erase the file
REM ERASE /Q "%_T%" >nul 2>&1

REM check that the file was erased
REM IF EXIST "%_T%" ( CALL :SPEAK "ERASE FILE FAILED" && EXIT /B )

EXIT /B

REM =======================================================================================
REM =   CREATEATJOB - runs job (START this file) every 5 minutes
REM =======================================================================================
:CREATEATJOB
:: delete all putty AT jobs
AT | FIND /C "%~f0" | FIND "1" >nul 2>&1
IF ERRORLEVEL 1 ( AT|FOR /F "tokens=1" %%i IN ('FIND /I "%~f0"') DO AT %%i /delete /yes >nul 2>&1 )
SET /A H=!TIME:~0,2!&& SET M=!TIME:~3,2!
SET Y=%H%:%M%&& SET /A M+=5
IF !M! GEQ 61 ( SET /A H+=1&&SET /A M-=61 )
IF !H! GEQ 24 SET /A H-=24
SET M=0!M!&& SET H=0!H!
:: create AT job
AT %H:~-2%:%M:~-2% /INTERACTIVE %ComSpec% /E:ON /D /Q /C START /B /MIN %ComSpec% /E:ON /D /Q /C "%~f0" >nul
EXIT /B