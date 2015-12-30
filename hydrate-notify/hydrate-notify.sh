#!/bin/bash
min=$(date | awk -F ':' '{print $2}')
crontab -l | sed "s/[0-9]* \(.*# Notify\)/$min \1/" | crontab -
