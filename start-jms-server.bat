@echo off
set MYDIRBLOCK=%~dp0

call %MYDIRBLOCK%..\..\..\config_env_base.bat

%HIDEWINDOW% h

call "%MYDIRBLOCK%bin\activemq.bat" start

exit
