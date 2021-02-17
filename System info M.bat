@echo off
::I will retrieve my system info from my computers database
Title System Info 
echo This program made by Marco Figueroa will retrive your system info.
echo Plesae wait checking system info...
::First section, Windows OS Info
echo =================================
echo          Windows OS Info            
echo =================================
systeminfo | findstr /c:"OS Name" 
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type" 

:: Second Section,Hardware Information

echo =================================
echo            Hardware Info 
echo =================================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name 
echo Motherboard Info
wmic baseboard get product,Manufacturer

:: Third Section, Network Information

echo =================================
echo            Network Info 
echo =================================
ipconfig | findstr IPv4
ipconfig | findstr IPv6
PAUSE
