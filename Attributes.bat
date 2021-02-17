@echo OFF
cd "C:\Users\marco\pictures"
::It will display the attributes in selected file
attrib Try.txt
::Add the "r" attribute to let know this program is a read-only
attrib +r Try.txt
::Display once again
attrib Try.txt
::Add the "ah" attibute to make the file hidden
attrib +h Try.txt
::Display current attributes
attrib Try.txt
attrib -h -r Try.txt
attrib Try.txt
pause