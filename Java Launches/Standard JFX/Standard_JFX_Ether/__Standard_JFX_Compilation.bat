
@ECHO off

ECHO.

ATTRIB -H JavaFiles.list
DIR /S/B *.java > JavaFiles.list
ATTRIB +H JavaFiles.list

FOR /f "tokens=*" %%i IN (JavaFiles.list) DO ( JAVAC -d ..\bin --module-path ..\lib\javafx-sdk-18.0.1\lib --add-modules javafx.controls,javafx.fxml "%%i" )
IF %errorlevel% == 0 GOTO continue
IF %errorlevel% == 1 GOTO exit

:continue
	CD ..
	COPY /Y .\src\resources\* .\bin\resources
	ECHO ——————————————————————————————————
	ECHO         Resources updated.
	ECHO ——————————————————————————————————
	ECHO. && ECHO.
	CD .\bin
	JAVA --module-path ..\lib\javafx-sdk-18.0.1\lib --add-modules javafx.controls,javafx.fxml main.Main
	CD ..
	CD .\src
	GOTO exit

:exit
	ECHO. && ECHO.
	ECHO ►   PWD: "%CD%"
	ECHO.
