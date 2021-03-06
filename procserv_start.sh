#!/bin/bash

# Path to this script
SCRIPT=$(readlink -f ${BASH_SOURCE[0]})
SCRIPTPATH=`dirname "$SCRIPT"`
MYDIRIOCLOG=$SCRIPTPATH

# Ensure environment is set up
if [ -z "$EPICS_ROOT" ]; then
    . $MYDIRIOCLOG/../../../config_env_base.sh
fi

# Set Logging directory
IOCLOGROOT="$ICPVARDIR/logs/ioc"

# *****************************************
# *        JMS SERVER
# *****************************************
STARTCMD="/bin/bash -i -O huponexit $MYDIRIOCLOG/start-jms-server.sh"
CONSOLEPORT="9001"
LOG_FILE="$IOCLOGROOT/JMS-$(date +'%Y%m%d').log"

echo "Starting JMS Log Server on 127.0.0.1 (console port $CONSOLEPORT)"
echo "* log file - $LOG_FILE"
procServ --logstamp --logfile="$LOG_FILE" --timefmt="%c" --restrict --ignore="^D^C" --name=JMS --pidfile="$EPICS_ROOT/EPICS_JMS.pid" $CONSOLEPORT $STARTCMD

