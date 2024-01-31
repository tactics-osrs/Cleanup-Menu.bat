REM Script Name: Cleanup Menu
REM Date Written: January 31, 2024
REM Written By: Tactics

@echo off
:Start
cls
echo.
echo Please select an option:
echo 1. Delete temporary files
echo 2. Open recycle bin
echo 3. Remove unnecessary files
echo 4. Disk clean up
echo 5. Exit
echo.

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    echo Deleting temporary files...
    del /q %temp%\*.*
    echo Temporary files deleted.
    pause
    goto Start
)

if "%choice%"=="2" (
    echo Opening recycle bin...
    start "" %systemroot%\explorer.exe /e,::{645FF040-5081-101B-9F08-00AA002F954E}
    pause
    goto Start
)

if "%choice%"=="3" (
    echo Removing unnecessary files...
    del /q /s "C:\Windows\Temp\*"
    echo Unnecessary files removed.
    pause
    goto Start
)

if "%choice%"=="4" (
    echo Running disk clean up...
    cleanmgr /sagerun:1
    echo Disk clean up completed.
    pause
    goto Start
)

if "%choice%"=="5" (
    echo Exiting...
    exit /b
)

goto Start
