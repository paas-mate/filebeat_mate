#!/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
bash $DIR/config-filebeat.sh
nohup $FILEBEAT_HOME/filebeat -e -c $FILEBEAT_HOME/filebeat.yml >>$FILEBEAT_HOME/filebeat.stdout.log 2>>$FILEBEAT_HOME/filebeat.stderr.log &
