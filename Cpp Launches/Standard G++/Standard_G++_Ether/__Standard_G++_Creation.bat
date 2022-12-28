
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
	MD bin bin\resources lib src\main src\resources\headers
	CD ..
	
	MOVE ".\Standard_G++_Ether\__Standard_G++_Compilation.bat" .\%PROJECTNAME%\src
	MOVE ".\Standard_G++_Ether\README__Standard_G++.txt" .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src\main
	ECHO. > Main.cpp
	
	ECHO STANDARD G++ PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\..\"Standard_G++_Ether"

:exit
	rem does not do anything
