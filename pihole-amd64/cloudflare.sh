#!/bin/bash
sleep 50
# Start the first process
#cloudflared service install
#status=$?
#if [ $status -ne 0 ]; then
#  echo "Failed to start my_first_process: $status"
#  exit $status
#fi

#sleep 15

# Start the second process
/etc/init.d/cloudflared start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi
# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds
