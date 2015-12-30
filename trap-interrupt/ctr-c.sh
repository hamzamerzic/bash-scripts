#!/bin/bash

# trap ctrl-c and call cleanup
trap cleanup INT

function cleanup() {
  echo "** Trapped CTRL-C"
}

for i in `seq 1 5`; do
  sleep 1
  echo -n "."
done
