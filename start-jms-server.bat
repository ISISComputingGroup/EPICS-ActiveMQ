@echo off
setlocal
set MYDIRBLOCK=%~dp0

call %MYDIRBLOCK%..\..\..\config_env_base.bat

%HIDEWINDOW% h

set ACTIVEMQ_CONF=%MYDIRBLOCK%\conf
set ACTIVEMQ_DATA=%ICPVARDIR%\activemq
set ACTIVEMQ_TMP=%ICPVARDIR%\tmp
set ACTIVEMQ_OPTS=-Xms64m -Xmx128m -Djava.util.logging.config.file=logging.properties -Djava.security.auth.login.config="%ACTIVEMQ_CONF%\login.config"

call "%MYDIRBLOCK%apache-activemq-5.16.0\bin\activemq.bat" start

exit
