#!/bin/bash

while :
do
	batc=$(cat /sys/class/power_supply/BAT0/capacity);
	date=$(date +"%a %e/%m %R");
	echo -e "+@fn=1;🔋+@fn=0;:$batc | $date";
	sleep 60;
done


