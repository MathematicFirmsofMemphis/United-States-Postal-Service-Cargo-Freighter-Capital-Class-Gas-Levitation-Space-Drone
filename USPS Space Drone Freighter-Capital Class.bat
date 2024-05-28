@echo off
title United States Postal Service Freighter Management System
color 1F

:: Initialize variables
set cargo=0
set fuel=100
set engine_status=off
set engine_count=4
set pathfinding_status=disabled

:main_menu
cls
echo ==================================================
echo            Welcome to United States Postal Service Freighter
echo         Shipping Container Management
echo ==================================================
echo 1. Login
echo 2. Exit
echo ==================================================
set /p choice="Please choose an option (1-2): "

if %choice%==1 goto login
if %choice%==2 goto exit
goto main_menu

:login
cls
set /p user="Enter Pilot Name: "
set /p pass="Enter Password: "
echo Authenticating...
:: Simulating a database check for username and password
if "%user%"=="pilot" if "%pass%"=="evepassword" (
    echo Authentication successful!
    pause
    goto ship_menu
) else (
    echo Invalid username or password. Please try again.
    pause
    goto main_menu
)

:ship_menu
cls
echo ==================================================
echo               Freighter Control Panel
echo ==================================================
echo 1. Check Cargo
echo 2. Load Container
echo 3. Unload Container
echo 4. Engine Management
echo 5. Pathfinding Management
echo 6. Log Out
echo ==================================================
set /p ship_choice="Please choose an option (1-6): "

if %ship_choice%==1 goto check_cargo
if %ship_choice%==2 goto load_container
if %ship_choice%==3 goto unload_container
if %ship_choice%==4 goto engine_management
if %ship_choice%==5 goto pathfinding_management
if %ship_choice%==6 goto main_menu
goto ship_menu

:check_cargo
cls
echo Current cargo: %cargo% containers
pause
goto ship_menu

:load_container
cls
set /p cargo_type="Enter cargo type: "
if "%cargo_type%"=="hazardous" (
    echo Loading hazardous materials is not allowed.
    pause
) else if "%cargo_type%"=="explosives" (
    echo Loading explosives is not allowed.
    pause
) else if "%cargo_type%"=="ammo" (
    echo Loading ammunition is not allowed.
    pause
) else if "%cargo_type%"=="firearms" (
    echo Loading firearms is not allowed.
    pause
) else (
    set /a cargo+=1
    echo Loading container...
    echo Container loaded. Current cargo: %cargo% containers
    pause
)
goto ship_menu

:unload_container
cls
if %cargo% LEQ 0 (
    echo No containers to unload.
) else (
    set /a cargo-=1
    echo Unloading container...
    echo Container unloaded. Current cargo: %cargo% containers
)
pause
goto ship_menu

:engine_management
cls
echo ==================================================
echo                Engine Management
echo ==================================================
echo 1. Check Fuel Level
echo 2. Refuel
echo 3. Start Engine
echo 4. Stop Engine
echo 5. Back to Main Menu
echo ==================================================
set /p engine_choice="Please choose an option (1-5): "

if %engine_choice%==1 goto check_fuel
if %engine_choice%==2 goto refuel
if %engine_choice%==3 goto start_engine
if %engine_choice%==4 goto stop_engine
if %engine_choice%==5 goto ship_menu
goto engine_management

:check_fuel
cls
echo Current fuel level: %fuel% units
pause
goto engine_management

:refuel
cls
set /a fuel=100
echo Refueling...
echo Fuel tank is now full. Current fuel level: %fuel% units
pause
goto engine_management

:start_engine
cls
if %engine_status%==on (
    echo Engine is already running.
) else (
    if %fuel% LEQ 0 (
        echo Insufficient fuel to start the engine.
    ) else (
        set engine_status=on
        echo Starting V6 engine with Liquid Heavy Hydrogen...
        echo Attempting Gas Levitation and RS-25 Thrust started. Current fuel level: %fuel% units
    )
)
pause
goto engine_management

:stop_engine
cls
if %engine_status%==off (
    echo Engine is already stopped.
) else (
    set engine_status=off
    echo Stopping engine...
    echo Engine stopped.
)
pause
goto engine_management

:pathfinding_management
cls
echo ==================================================
echo             Pathfinding Management
echo ==================================================
echo 1. Enable Pathfinding
echo 2. Disable Pathfinding
echo 3. Back to Ship Menu
echo ==================================================
set /p pathfinding_choice="Please choose an option (1-3): "

if %pathfinding_choice%==1 goto enable_pathfinding
if %pathfinding_choice%==2 goto disable_pathfinding
if %pathfinding_choice%==3 goto ship_menu
goto pathfinding_management

:enable_pathfinding
cls
if %pathfinding_status%==enabled (
    echo Pathfinding is already enabled.
) else (
    set pathfinding_status=enabled
    echo Pathfinding enabled.
)
pause
goto pathfinding_management

:disable_pathfinding
cls
if %pathfinding_status%==disabled (
    echo Pathfinding is already disabled.
) else (
    set pathfinding_status=disabled
    echo Pathfinding disabled.
)
pause
goto pathfinding_management

:exit
cls
echo Thank you for using the United States Postal Service Freighter Management System. Fly safe!
pause
exit
