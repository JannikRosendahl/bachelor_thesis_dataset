#!/bin/bash

PID=$(pgrep -u "$USER" -f 'ssh -fN -L 5432:localhost:5432 vmrosendahl')
# check if the PID is empty
if [ -z "$PID" ]; then
    echo "No tunnel found"
    exit 1
fi
echo "Killing tunnel with PID: $PID"
kill "$PID"