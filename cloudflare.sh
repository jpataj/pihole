#!/bin/bash
sleep 50
# Start the first process
#cloudflared service install
#status=$?
#if [ $status -ne 0 ]; then
#  echo "Failed to start cloudflare: $status"
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
