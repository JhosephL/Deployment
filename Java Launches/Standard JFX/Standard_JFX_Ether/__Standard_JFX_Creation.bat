
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
	MD bin bin\resources src\main src\resources
	CD ..
	
	MOVE .\Standard_JFX_Ether\lib .\%PROJECTNAME%
	MOVE .\Standard_JFX_Ether\__Standard_JFX_Compilation.bat .\%PROJECTNAME%\src
	MOVE .\Standard_JFX_Ether\__Standard_JFX_Execution.bat .\%PROJECTNAME%
	MOVE .\Standard_JFX_Ether\Main.java .\%PROJECTNAME%\src\main
	MOVE .\Standard_JFX_Ether\README__Standard_JFX.txt .\%PROJECTNAME%
	
	CD .\%PROJECTNAME%\src\main
	ECHO. > Primary_FXML_Controller.java
	CD ..\..\..
	CD .\%PROJECTNAME%\src\resources
	ECHO. > Primary_FXML_Interface.fxml
	
	ECHO STANDARD JAVAFX PROJECT SUCCESSFULLY CREATED.
	ECHO ►   PWD: "%CD%"
	RD /S/Q ..\..\..\Standard_JFX_Ether

:exit
	rem does not do anything
