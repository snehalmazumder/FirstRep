#!/bin/bash
read -p "Enter your value : " NUM1
#echo ${#NUM1}
#I=${#NUM1}
#I=$((I-1))
#while [ $I -ge 0 ]
#do
#	echo "$I - ${NUM1:$I:1}"
#	I=$((I-1))
#done 

N=${#NUM1}
COUNT=1
I=$(($N-1))
PREV=$I
BACK=0
ANS=""
while [ $I -ge 0 ]
do
	if [ ${NUM1:$I:1} = '.' ]
	then
		SIZE=$((PREV-I))
                VAL=${NUM1:$((I+1)):SIZE}
                #echo "$VAL"
		if [ $COUNT -eq 1 ]
		then
			X=${#VAL}
			DEN=$((10**$X))
			#echo "DEN=$DEN"
			DEC=$(echo "scale=$X;$VAL/$DEN" | bc)
			#echo "DEC=$DEC"
			INCREMENT=$(echo "scale=$X;1/$DEN" | bc)
			#echo "INCREMENT=$INCREMENT"
			SUM=$(echo "scale=$X;$DEC+$INCREMENT" | bc)
			#echo "SUM=$SUM"
			CON_VAR=$(echo "$SUM < 1.0" | bc -l)
			#echo "CON_VAR=$CON_VAR"

			if [ $CON_VAR -eq 0 ]
			then
				# IF SUM >= 1.0
				BACK=1
				TEMP=$(echo "$SUM > 1.0" | bc -l)
				#echo "TEMP=$TEMP"
				if [ $TEMP -eq 0 ]
				then
					# IF SUM = 1.0
					J=0
					ADD=""
					ZERO="0"
					DOT="."
					while [ $J -lt $X ]
					do
						#echo "ADDING : $J"
						ADD="${ADD}${ZERO}"
						J=$((J+1))
					done
					ANS="${ANS}${DOT}${ADD}"
				else
					# IF SUM > 1.0
					#ADD1=${echo "$SUM - 1.0" | bc -l)
					#ANS="${ADD1}${ANS}"
					echo " "
				fi
			else
				# IF SUM < 1.0
				BACK=0
				ANS="${SUM}${ANS}"
			fi
			#echo "ANSWER=$ANS : BACK=$BACK"
			COUNT=0
		else
			X=${#VAL}
			DEN=$((10**$X))
                        #echo "DEN=$DEN"
			DEC=$(echo "scale=$X;$VAL/$DEN" | bc)
                        #echo "DEC=$DEC"
			#INCREMENT=$(echo "scale=$X;1/$DEN" | bc)
                        SUM=$(echo "scale=$X;$DEC+$BACK/10" | bc)
                        #echo "SUM=$SUM"

			CON_VAR=$(echo "$SUM < 1.0" | bc -l)
                        #echo "CON_VAR=$CON_VAR"

			if [ $CON_VAR -eq 0 ]
                        then
				# IF SUM >= 1.0
                                BACK=1
                                TEMP=$(echo "$SUM > 1.0" | bc -l)
                                #echo "TEMP=$TEMP"
                                if [ $TEMP -eq 0 ]
                                then
                                        # IF SUM = 1.0
                                        J=0
                                        ADD=""
                                        ZERO="0"
                                        DOT="."
                                        while [ $J -lt $X ]
                                        do
                                                #echo "ADDING : $J"
                                                ADD="${ADD}${ZERO}"
                                                J=$((J+1))
                                        done
                                        #ADD="${DOT}${ADD}"
                                        ANS="${DOT}${ADD}${ANS}"
                                else
                                        # IF SUM > 1.0
					EXCPT=$(echo "$SUM - 1" | bc -l)
					#echo "EXCPT=$EXCPT"
                                        ANS="${EXCPT}${ANS}"
					#echo " "
                                fi
                        else
                                # IF SUM < 1.0
                                BACK=0
				if [ $(echo "$SUM == 0" | bc) -eq 1 ]
				then
					DOT="."
					ANS="${DOT}${SUM}${ANS}"
				else
                                	ANS="${SUM}${ANS}"
				fi
                        fi
                        #echo "ANSWER=$ANS : BACK=$BACK"


		fi
		PREV=$((I-1))
	fi
	if [ $I -eq 0 ]
	then
		VAL=${NUM1:I:$((PREV+1))}
                #echo "$VAL"

                SUM=$(echo "$VAL+$BACK" | bc)
               	#echo "SUM=$SUM"
		ANS="${SUM}${ANS}"
		#echo "ANSWER=$ANS"
	fi
	#echo ""
	I=$((I-1))
done
echo "ANSWER=$ANS"
