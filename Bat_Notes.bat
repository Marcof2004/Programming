::Batch File Notes
@echo OFF
echo Batch file variables are named by using "set"
echo The set command is used by "set" "varible name"="varible content"(No quotations)
echo We print the varible content by usign "echo" "%variable name%"(No quotations)
echo Start Batch files with the "@echo OFF"
echo Comments are placed by using the "::" symbol
echo If you want your Batch file to stay after run use the "PAUSE" command
echo The "/A" attribute tells the compueter that the variable in use has a numeric value.
echo The "/A" attribute should be use to set EVERY arithmetic value.
echo Arithmetic operations are performed in excel notation. "+,-,*,/"
echo For processor to perform a arithmetic operation equal de operation to another varible and then echo the variable value.
echo The "dir" commnad lists files in the current directory, if another isnt specified
echo The ">" symbol sends the programm output to the specified file.
echo When a variable doesnt exist, or isnt in the current directory, the "echo is off" message will appear.
echo Use the if [%"varibale name"%] echo "String is empty" to let the system tell you if a varible content is empty
echo When equaling a variable to other variables in the set command, or echoing variables in the same line you concatenate their contents
PAUSE