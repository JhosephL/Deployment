
@ECHO off
SETLOCAL EnableDelayedExpansion

ECHO.

ATTRIB -H "G++Files.list"
DIR /S/B *.cpp > "G++Files.list"
ATTRIB +H "G++Files.list"

SET /A G++_FILES_STRING

for /f "tokens=*" %%i in (G++Files.list) do (set "G++_FILES_STRING=^"^%%i" !G++_FILES_STRING!")

g++ %G++_FILES_STRING% -o ..\bin\Main.exe
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
