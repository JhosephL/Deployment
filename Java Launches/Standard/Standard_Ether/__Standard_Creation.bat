
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
	MD bin bin\resources lib src\main src\resources
	CD ..
	
	MOVE .\Standard_Ether\__Standard_Compilation.bat .\%PROJECTNAME%\src
	MOVE .\Standard_Ether\__Standard_Execution.bat .\%PROJECTNAME%
	MOVE .\Standard_Ether\README__Standard.txt .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src\main
	ECHO. > Main.java
	
	ECHO STANDARD JAVA PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\..\Standard_Ether

:exit
	rem does not do anything
