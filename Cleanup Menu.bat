REM Script Name: Cleanup Menu
REM Date Written: January 31, 2024
REM Written By: Tactics

@echo off
color 0A
:Start
cls
echo.
echo Please select an option:
echo 1. Open recycle bin
echo 2. Delete temporary files 
echo 3. Deployment Image Servicing and Management tool
echo 4. System File Checker
echo 5. Disk clean up
echo 6. Disk Cleanup Settings
echo 7. Exit
echo.

REM Code to take user input to choose what command to execute...
set "choice="
set /p choice=Enter your choice: 

REM Check if the input is a number between 1 and 8
echo.%choice%|findstr /r /c:"^[1-8]$" >nul || (
    echo Invalid input! Please enter a number between 1 and 8.
    pause
    goto Start
)

REM open recycle bin code ...
if "%choice%"=="1" (
    echo Opening recycle bin...
    start "" %systemroot%\explorer.exe /e,::{645FF040-5081-101B-9F08-00AA002F954E}
    pause
    goto Start
)

REM delete all temp files in multiple directories code below ...
if "%choice%"=="2" (
    echo Deleting temporary files...
	rd /s /q c:windowstemp
	md c:windowstemp
	del /s /f /q %temp%*.*
	rd /s /q %temp%
	md %temp%
    echo Temporary files deleted.
    pause
    goto Start
)



REM Code to run DISM tool...
if "%choice%"=="3" (
	echo Beginning system scan. This process will take some time.
	Dism /Online /Cleanup-Image /RestoreHealth
	echo Press any button to return back to the menu...
	pause
	goto Start
)

REM Code to run system file scan (SFC)... 
if "%choice%"=="4" (
	echo Running System File Checker...
	sfc /scannow
	pause
	goto Start
)

REM Run Cleanmgr Disk Clean up...
if "%choice%"=="5" (
    echo Running disk clean up...
    cleanmgr /sagerun:1
    echo Disk clean up completed.
    pause
    goto Start
)

REM Open disk cleanup settings...
if "%choice%"=="6" (
	echo Opening Disk Cleanup settings...
	cleanmgr /sageset:1
	pause
	goto Start
)

REM Code for exiting...
if "%choice%"=="7" (
    echo Exiting...
    exit /b
)

goto Start


goto Start
