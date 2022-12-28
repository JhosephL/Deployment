
@ECHO off

ECHO. && ECHO.

python main\Main.py
IF %errorlevel% == 0 GOTO continue
IF %errorlevel% == 1 GOTO exit

:continue
	GOTO exit

:exit
	ECHO. && ECHO.
	ECHO ►   PWD: "%CD%"
	ECHO.
