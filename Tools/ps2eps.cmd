@echo off
set CWD=%~dp0.
set GS="C:\Program Files\gs\gs9.23\bin\gswin64c.exe"
call :rotate %1 %2.tmp.eps
call :boundingbox %2.tmp.eps %2
:call :boundingbox %1 %2
del %2.tmp.eps
goto :eof

:rotate
%GS% -q -dSAFER ^
    -dBATCH ^
	-dNOPAUSE^
	-sDEVICE=eps2write ^
	-sOutputFile=%2^
	-c "<</Orientation 3>> setpagedevice" ^
	-f %1 ^
	-c quit > nul
goto :eof

:boundingbox
call "%CWD%\head" 1 %1 >%2
call :get_bbox %1 >> %2
call "%CWD%\skip" 3 %1 >> %2
call "%CWD%\dos2unix" %2
goto :eof

:get_bbox
%GS% -sDEVICE=bbox -o nul %1 2>&1 | find "BoundingBox"
goto :eof
