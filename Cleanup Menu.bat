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
echo 5. Set and Run Disk Clean up
echo 6. Help (Functions Descriptions)
echo 7. Exit
echo.

REM Code to take user input to choose what command to execute...
set "choice="
set /p choice=Enter your choice: 

REM Check if the input is a number between 1 and 7
echo.%choice%|findstr /r /c:"^[1-7]$" >nul || (
    echo Invalid input! Please enter a number between 1 and 7.
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

REM Set/Run Cleanmgr Disk Clean up...
if "%choice%"=="5" (
    echo Setting up disk clean up...
    cleanmgr /sageset:1
    echo Running disk clean up...
    cleanmgr /sagerun:1
    echo Disk clean up completed.
    pause
    goto Start
)

if "%choice%"=="6" (
    echo Here are the functions:
	echo.
    echo 1. Open recycle bin: Opens the recycle bin via directory.
	echo.
    echo 2. Delete temporary files: Removes temp files, directories, and subdirectories, then creates clean directory files them.
	echo.    
	echo 3. Deployment Image Servicing and Management tool: Begins system scan to check for corruption and automatically fix any problems it finds as well as clean up the system image on the running operating system.
	echo.    
	echo 4. System File Checker: Runs Command-Line Windows tool SFC to varify the integrity of every protected operating system file on your computer. If the utility finds any files that have wrong versions, it replaces them with the correct, varified ones.
	echo.    
	echo 5. Disk clean up: Runs Disk Cleanup tool settings first for user to set preferences, then performs a Disk Cleanup.
	echo.    
	echo 6. Help: Displays this help message.
	echo.    
	echo 7. Exit: Exits the program.
	echo.
    pause
    goto Start
)

REM Code for exiting...
if "%choice%"=="7" (
    echo Exiting...
    exit /b
)

goto Start
