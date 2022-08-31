@echo off
setlocal

set MYDIR=%~dp0
REM kill procservs that manage Active MQ

set CSPID=
for /F %%i in ( c:\windows\temp\EPICS_JMS.pid ) DO set CSPID=%%i
if "%CSPID%" == "" (
    @echo JMS server is not running
) else (
    @echo Killing JMS server PID %CSPID%
    %ICPCYGBIN%\kill.exe %CSPID%
    del c:\windows\temp\EPICS_JMS.pid
)

