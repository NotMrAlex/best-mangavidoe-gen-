@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"

echo ==============================================
echo    DANK ENGINE STUDIO - Installer
echo ==============================================
echo.

REM 1. Check Python is installed
where python >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Python was not found.
    echo.
    echo 1. Go to https://www.python.org/downloads/
    echo 2. Download Python 3.10, 3.11 or 3.12.
    echo 3. Run the installer and TICK "Add Python to PATH".
    echo 4. Run this installer again.
    echo.
    pause
    exit /b 1
)

echo Python detected. Building environment...
echo.

REM 2. Create a virtual environment (keeps everything in one folder)
if not exist "dank_env\Scripts\python.exe" (
    python -m venv dank_env
    if errorlevel 1 (
        echo [ERROR] Could not create the virtual environment.
        pause
        exit /b 1
    )
)

call dank_env\Scripts\activate.bat
python -m pip install --upgrade pip >nul

REM 3. Install the Python dependencies
echo Installing dependencies...
python -m pip install -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Dependency installation failed.
    echo Check your internet connection and run this installer again.
    pause
    exit /b 1
)

REM 4. Check FFmpeg
where ffmpeg >nul 2>nul
if errorlevel 1 (
    echo.
    echo FFmpeg was not found. Trying to install it automatically...
    winget install --id Gyan.FFmpeg -e --accept-package-agreements --accept-source-agreements
    if errorlevel 1 (
        echo.
        echo [INFO] Could not install FFmpeg automatically.
        echo.
        echo 1. Go to https://www.gyan.dev/ffmpeg/builds/
        echo 2. Download the "release essentials" zip.
        echo 3. Unzip it anywhere (for example C:\ffmpeg).
        echo 4. Add the "bin" folder inside it to your PATH.
        echo 5. Close and reopen this window, then run the installer again.
        echo.
    ) else (
        echo FFmpeg installed. Close and reopen any windows, then run engine.bat.
    )
)

echo.
echo ==============================================
echo    Done! Now double-click engine.bat to start.
echo ==============================================
echo.
pause
endlocal