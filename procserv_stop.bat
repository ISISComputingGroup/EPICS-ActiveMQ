@echo off
setlocal

set MYDIR=%~dp0
REM kill procservs that manage Active MQ

set CSPID=
if exist c:\instrument\var\run\EPICS_JMS.pid (
    for /F %%i in ( c:\instrument\var\run\EPICS_JMS.pid ) DO set CSPID=%%i
)
if "%CSPID%" == "" (
    @echo %DATE% %TIME% JMS server is not running
) else (
    @echo %DATE% %TIME% Killing JMS server cygwin PID %CSPID%
    REM %ICPCYGBIN%\kill.exe %CSPID%
    del c:\instrument\var\run\EPICS_JMS.pid
)

