
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
	
	MOVE ".\Standard_GCC_Ether\__Standard_GCC_Compilation.bat" .\%PROJECTNAME%\src
	MOVE ".\Standard_GCC_Ether\__Standard_GCC_Execution.bat" .\%PROJECTNAME%
	MOVE ".\Standard_GCC_Ether\README__Standard_GCC.txt" .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src\main
	ECHO. > Main.c
	
	ECHO STANDARD G++ PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\..\"Standard_GCC_Ether"

:exit
	rem does not do anything
