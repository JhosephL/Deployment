
@ECHO off
echo.

CD ..

SET /P PROJECTNAME="Project name: "
echo.

MD %PROJECTNAME%
IF %errorlevel% == 0 GOTO continue
IF %errorlevel% == 1 GOTO exit

:continue
	CD %PROJECTNAME%
	MD lib src\main src\resources
	CD ..
	
	MOVE ".\Standard_python_Ether\__Standard_python_Compilation.bat" .\%PROJECTNAME%\src
	MOVE ".\Standard_python_Ether\__Standard_python_Execution.bat" .\%PROJECTNAME%
	MOVE ".\Standard_python_Ether\README__Standard_python.txt" .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src\main
	ECHO. > Main.py
	
	ECHO STANDARD PYTHON PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\..\"Standard_python_Ether"

:exit
	rem does not do anything
