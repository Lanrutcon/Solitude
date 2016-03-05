::Prompt user for adding/removing sound files
@echo off
echo ####################################
echo ,---.     '    o'             '
echo `---.,---.'    ''--  .   .,---',---.
echo     ''   ''    ''    '   ''   ''---'
echo `---'`---'`---'``---'`---'`---'`---'
echo ####################################


:start
set /p input="Enter ADD to add the sound files. Enter RM to remove the sound files (after adding): "
if %input% == ADD goto addFiles
if %input% == RM goto removeFiles
goto start

:addFiles
::Creates a Sound/Interface directory in WoW folder
mkdir ..\..\..\Sound\Interface
::Copy .ogg files to Sound/Interface directory
copy Sounds\*.ogg ..\..\..\Sound\Interface

echo "Sound files added - Press any key to exit"
pause
exit

:removeFiles
::Removes Sound folder that was created before
rmdir /s /q ..\..\..\Sound 

echo "Sound files removed - Press any key to exit"
pause
exit