@echo off
setlocal

:menu
echo.
echo made by sli4
echo.
echo.
    netsh advfirewall firewall show rule name="Block ME server" | find /i "Block ME server" >nul
    if errorlevel 1 (
        echo Middle East server is currently : unblocked.
    ) else (
        echo Middle East server is currently : blocked.
    )
echo.
echo.
echo 1. Block Middle East server
echo 2. Unblock Middle East server
echo 3. Exit
echo.
set /p choice=Enter your choice (1/2/3): 

if "%choice%"=="1" (
    echo Blocking traffic...
    netsh advfirewall firewall add rule name="Block ME server" dir=in action=block protocol=ANY remoteip=157.175.0.0-157.175.255.255,15.184.0.0-15.184.255.255,15.185.0.0-15.185.255.255,34.18.0.0-34.18.255.255
    netsh advfirewall firewall add rule name="Block ME server" dir=out action=block protocol=ANY remoteip=157.175.0.0-157.175.255.255,15.184.0.0-15.184.255.255,15.185.0.0-15.185.255.255,34.18.0.0-34.18.255.255
    echo Middle East server is now blocked.
    pause
    goto menu
) else if "%choice%"=="2" (
    echo Unblocking traffic...
    netsh advfirewall firewall delete rule name="Block ME server"
    netsh advfirewall firewall delete rule name="Block ME server"
    echo Middle East server is now unblocked.
    pause
    goto menu
) else if "%choice%"=="3" (
    echo Exiting...
) else (
    echo Invalid choice. Please enter 1, 2, 3.
    goto menu
)

endlocal
