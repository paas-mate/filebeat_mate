#!/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
mkdir -p $FILEBEAT_HOME/logs
bash $DIR/config-filebeat.sh
nohup $FILEBEAT_HOME/filebeat -e -c $FILEBEAT_HOME/filebeat.yml 2>>$FILEBEAT_HOME/logs/filebeat.log &
