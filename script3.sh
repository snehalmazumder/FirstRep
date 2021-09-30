#!/bin/bash
read -p "Entire directory name : " DIR
FILE=$(ls $DIR)
for F in $FILE
do
	#ls ./$DIR/$F >> outputscript3
	echo "$F" >> outputscript3
done
ANS=$(cat outputscript3)
echo -e "Displaying contents of the output file : \n$ANS"

