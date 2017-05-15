#!/bin/bash

#logstash 

source /etc/profile 

#echo 
sed -i -E "s#CODEC#$CODEC#g" $LOGSTASH_HOME/agent/node.conf
sed -i -E "s#LogFile#$LogFile#g" $LOGSTASH_HOME/agent/node.conf
sed -i -E "s#ES_SERVER#$ES_SERVER#g" $LOGSTASH_HOME/agent/node.conf
sed -i -E "s#INDICES#$INDICES#g" $LOGSTASH_HOME/agent/node.conf

#Start logstash
$LOGSTASH_HOME/bin/logstash -f $LOGSTASH_HOME/agent/node.conf

#Foreground
echo "Press Ctrl+P and Ctrl+Q to background this process."
echo 'Use exec command to open a new bash instance for this instance (Eg. "docker exec -i -t CONTAINER_ID bash"). Container ID can be obtained using "docker ps" command.'
echo "Start Terminal"
bash
echo "Press Ctrl+C to stop instance."
sleep infinity
