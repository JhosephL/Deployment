
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
	
	MOVE .\Standard_Swing_Ether\__Standard_Swing_Compilation.bat .\%PROJECTNAME%\src
	MOVE .\Standard_Swing_Ether\Main.java .\%PROJECTNAME%\src\main
	MOVE .\Standard_Swing_Ether\__Standard_Swing_Execution.bat .\%PROJECTNAME%
	MOVE .\Standard_Swing_Ether\README__Standard_Swing.txt .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src
	
	ECHO STANDARD JAVA SWING PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\Standard_Swing_Ether

:exit
	rem does not do anything
