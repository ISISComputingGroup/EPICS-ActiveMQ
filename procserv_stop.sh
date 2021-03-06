#!/bin/bash

SCRIPT=$(readlink -f ${BASH_SOURCE[0]})
SCRIPTPATH=`dirname "$SCRIPT"`
MYDIR=$SCRIPTPATH

# Ensure environment is set up
if [ -z "$EPICS_ROOT" ]; then
    . $MYDIR/../../../config_env_base.sh
fi

# kill procservs that manage active MQ

PIDFILE="$EPICS_ROOT/EPICS_JMS.pid"
if [ -r "$PIDFILE" ]; then
    CSPID=`cat "$PIDFILE"`
    echo "Killing JMS server PID: $CSPID"
    kill $CSPID
    rm "$PIDFILE"
else
    echo "JMS server is not running (or $PIDFILE not readable)"
fi

PIDFILE="$MYDIR/ActiveMQ/data/activemq-`hostname`.pid"
if [ -r "$PIDFILE" ]; then
    CSPID=`cat "$PIDFILE"`
    echo "Killing JMS ActiveMQ server PID: $CSPID"
    kill $CSPID
    rm "$PIDFILE"
else
    echo "JMS ActiveMQ server is not running (or $PIDFILE not readable)"
fi

