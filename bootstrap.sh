#!/bin/bash

if [ $? -gt 0 ]; then
    echo "Starting daemon failed."
    exit 1
fi



CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
        /opt/cloudera/livy-server/bin/livy-server
else
        /opt/cloudera/livy-server/bin/livy-server &
	echo "$*"
	/bin/bash -c "$*"
fi
