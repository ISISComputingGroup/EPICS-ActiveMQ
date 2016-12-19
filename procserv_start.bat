@echo off

set CYGWIN=nodosfilewarning
set MYDIRIOCLOG=%~dp0

call %MYDIRIOCLOG%..\..\..\config_env_base.bat

REM Set Logging directory
IF "%ICPVARDIR%"=="" (
	set ICPVARDIR=C:/Instrument/Var
)
set IOCLOGROOT=%ICPVARDIR%/logs/ioc
for /F "usebackq" %%I in (`cygpath %IOCLOGROOT%`) do SET IOCCYGLOGROOT=%%I

REM *****************************************
REM *        JMS SERVER
REM *****************************************
set STARTCMD=%ComSpec% /c %MYDIRIOCLOG%start-jms-server.bat
set CONSOLEPORT=9001
set LOG_FILE=%IOCCYGLOGROOT%/JMS-%%Y%%m%%d.log

@echo Starting JMS Log Server on 127.0.0.1 (console port %CONSOLEPORT%)
@echo * log file - %LOG_FILE%
%ICPTOOLS%\cygwin_bin\procServ.exe --logstamp --logfile="%LOG_FILE%" --timefmt="%%c" --restrict --ignore="^D^C" --name=JMS --pidfile="/cygdrive/c/windows/temp/EPICS_JMS.pid" %CONSOLEPORT% %STARTCMD%
