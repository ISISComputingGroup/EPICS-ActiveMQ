@echo off
setlocal
set MYDIRBLOCK=%~dp0

call %MYDIRBLOCK%..\..\..\config_env_base.bat

%HIDEWINDOW% h

set ACTIVEMQ_CONF=%MYDIRBLOCK%\conf
set ACTIVEMQ_DATA=%ICPVARDIR%\activemq
set ACTIVEMQ_TMP=%ICPVARDIR%\tmp
set ACTIVEMQ_OPTS=-Xms1G -Xmx1G -Djava.util.logging.config.file=logging.properties -Djava.security.auth.login.config="%ACTIVEMQ_CONF%\login.config"

call "%MYDIRBLOCK%apache-activemq-5.15.4\bin\activemq.bat" start

exit
