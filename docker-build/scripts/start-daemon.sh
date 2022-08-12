#!/bin/bash


nohup $FILEBEAT_HOME/mate/filebeat_mate >$FILEBEAT_HOME/filebeat_mate.stdout.log 2>$FILEBEAT_HOME/filebeat_mate.stderr.log
