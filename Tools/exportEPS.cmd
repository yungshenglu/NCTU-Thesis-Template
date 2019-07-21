@echo off
set CWD=%~dp0.
set FIG=%CWD%\..\Figures
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\segment_update 1
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\segment_update_example 2
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\recovery_update 3
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\case2_c1_crt 5
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\case2_c2_crt 6
call :exportEPS %FIG%\figures_recovery.pptx %FIG%\case2_topology 7
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\drop_rate_single 8
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\recovery_80_cdf 9
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\drop_rate_0_1 10
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\drop_rate_0_3 11
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\drop_rate_0_5 12
rem call :exportEPS %FIG%\figures_recovery.pptx %FIG%\drop_rate_combine 13
goto :eof

:exportEPS
echo File: %~f2.eps
call :print %1 %2.ps %3
call :ps2eps %2.ps %2.eps
goto :eof

:print
cscript //Nologo %CWD%\print.vbs %1 %2 %3 > nul
goto :eof

:ps2eps
call %CWD%\ps2eps.cmd %1 %2
goto :eof