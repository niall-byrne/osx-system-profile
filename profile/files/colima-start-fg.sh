#!/bin/bash

export PATH=export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

function shutdown() {
  colima stop
}

trap shutdown SIGTERM
trap shutdown SIGINT

while true; do
  if colima status > /dev/null; then
    break
  fi
  colima start &
  sleep 5
done

tail -f /dev/null
wait "$!"
