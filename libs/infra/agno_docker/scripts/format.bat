@echo off
REM ###########################################################################
REM # Format the agno_docker library using ruff
REM # Usage: libs\infra\agno_docker\scripts\format.bat
REM ###########################################################################

SETLOCAL ENABLEDELAYEDEXPANSION

REM Get current directory
SET "CURR_DIR=%~dp0"
SET "AGNO_DOCKER_DIR=%CURR_DIR%\.."

ECHO.
ECHO ##################################################
ECHO # Formatting agno_docker
ECHO ##################################################
ECHO.

REM Check if ruff is installed
python -c "import ruff" 2>nul
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERROR] ruff is not installed. Please install it with: pip install ruff
    EXIT /B 1
)

ECHO.
ECHO ##################################################
ECHO # Running: ruff format %AGNO_DOCKER_DIR%
ECHO ##################################################
ECHO.

python -m ruff format "%AGNO_DOCKER_DIR%"

ECHO.
ECHO ##################################################
ECHO # Running: ruff check --select I --fix %AGNO_DOCKER_DIR%
ECHO ##################################################
ECHO.

python -m ruff check --select I --fix "%AGNO_DOCKER_DIR%"

ECHO [INFO] agno_docker formatting complete.
EXIT /B 