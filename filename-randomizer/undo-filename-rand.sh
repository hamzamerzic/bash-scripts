#!/bin/bash
ls -A | while read filename; do newname=$(echo $filename | sed "s/[0-9]* - \(.*\)/\1/"); mv "$filename" "$newname"; done;
