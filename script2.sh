#!/bin/bash
read -p "Enter mail id : " MAILID
STR=$(df -h /root)
#echo "$STR"
INDEX=${STR%%"Mounted on"*}
INDEX=${#INDEX}
STR1=${STR:INDEX+10}
#echo "$STR1"

INDEX=${STR1%%" "*}
INDEX=${#INDEX}
STR1=${STR1:INDEX}
#echo "$STR1"

INDEX=${STR1%%"G"*}
INDEX=${#INDEX}
#echo "$INDEX"
echo "Total Size : ${STR1:0:INDEX+2}"
STR1=${STR1:INDEX+1}
#echo "$STR1"

INDEX=${STR1%%"G"*}
INDEX=${#INDEX}
STR1=${STR1:INDEX+1}

INDEX=${STR1%%"G"*}
INDEX=${#INDEX}
echo "Available size : ${STR1:0:INDEX+1}"

SIZE=${STR1:0:INDEX}
INDEX=${SIZE%%"."*}
INDEX=${#INDEX}
SIZE=${SIZE:0:INDEX}
SIZE1=$(echo $SIZE | bc)
#echo "$SIZE1"
if [ $SIZE1 -lt 50 ]
then
	#echo  "Alert! Disk Space is underutilized"
	mail -s "Linux Disk Space" $MAILID <<< "Alert! Disk Space is underutilized"
fi

#if [ ${STR1:LEN-1:LEN}!="G" ]
#then
#	echo  "Alert! Disk Space is underutilized"
#else
#	if [ ${STR1:0:LEN-1}<"50" ]
#	then
#		echo  "Alert! Disk Space is underutilized"
#	fi
#fi
