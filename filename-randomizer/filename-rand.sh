#!/bin/bash
num_files=$(ls | wc -l)
pad=$(echo "l($num_files)/l(10) + 1" | bc -l)
pad=${pad%.*}

counter=0
ls -A | shuf | while read filename; do num=$(printf "%0${pad}d" $counter); mv "$filename" "$num - $filename"; counter=$(($counter+1)); done;
