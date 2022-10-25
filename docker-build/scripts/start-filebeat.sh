#!/bin/bash

echo '' > $FILEBEAT_HOME/filebeat.yml
echo -e 'filebeat.inputs:' >> $FILEBEAT_HOME/filebeat.yml
echo -e '- type: log' >> $FILEBEAT_HOME/filebeat.yml
echo -e '  enabled: true' >> $FILEBEAT_HOME/filebeat.yml
echo -e '  paths:' >> $FILEBEAT_HOME/filebeat.yml
echo -e '  - /opt/filebeat/*.log' >> $FILEBEAT_HOME/filebeat.yml
if [ "$FILEBEAT_OUTPUT_TYPE" == "" ] || [ "$FILEBEAT_OUTPUT_TYPE" == "ELASTICSEARCH" ]; then
  echo -e 'output.elasticsearch:' >> $FILEBEAT_HOME/filebeat.yml
elif [ "$FILEBEAT_OUTPUT_TYPE" == "KAFKA" ]; then
  echo -e 'output.kafka:' >> $FILEBEAT_HOME/filebeat.yml
  echo -e '  hosts: ["localhost:9092"]' >> $FILEBEAT_HOME/filebeat.yml
  echo -e '  topic: filebeat-topic' >> $FILEBEAT_HOME/filebeat.yml
fi
echo -e 'logging.level: info' >> $FILEBEAT_HOME/filebeat.yml
echo -e 'logging.to_files: true' >> $FILEBEAT_HOME/filebeat.yml
echo -e 'logging.files:' >> $FILEBEAT_HOME/filebeat.yml
echo -e ' path: /opt/filebeat/' >> $FILEBEAT_HOME/filebeat.yml
echo -e ' name: filebeat.log' >> $FILEBEAT_HOME/filebeat.yml
echo -e 'logging.json: false' >> $FILEBEAT_HOME/filebeat.yml
nohup $FILEBEAT_HOME/filebeat -e -c $FILEBEAT_HOME/filebeat.yml >>$FILEBEAT_HOME/filebeat.stdout.log 2>>$FILEBEAT_HOME/filebeat.stderr.log &
