
@ECHO off
SETLOCAL EnableDelayedExpansion

ECHO.

ATTRIB -H "GccFiles.list"
DIR /S/B *.c > "GccFiles.list"
ATTRIB +H "GccFiles.list"

SET /A GCC_FILES_STRING

for /f "tokens=*" %%i in (GccFiles.list) do (set "GCC_FILES_STRING=^"^%%i" !GCC_FILES_STRING!")

gcc %GCC_FILES_STRING% -o ..\bin\Main.exe
IF %errorlevel% == 0 GOTO continue
IF %errorlevel% == 1 GOTO exit

:continue
	CD ..
	COPY /Y .\src\resources\* .\bin\resources
	ECHO ——————————————————————————————————
	ECHO         Resources updated.
	ECHO ——————————————————————————————————
	ECHO. && ECHO.
	.\bin\Main.exe
	CD .\src
	GOTO exit

:exit
	ECHO. && ECHO. && ECHO.
	ECHO ►   PWD: "%CD%"
	ECHO.
