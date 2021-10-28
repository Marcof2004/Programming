@echo off
set /A i= 0

set obj[0].Name= Jose
set obj[0].ID= 1
set obj[1].Name= Carlos
set obj[1].ID= 2
set obj[2].Name= Breve
set obj[2].ID= 3
for /L %%i in (0 1 2) do (
	call echo Name = %%obj[%%i].Name%%
	call echo Value = %%obj[%%i].ID%%
)
PAUSE