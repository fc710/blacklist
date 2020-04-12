#!/bin/bash

while read VAR ; do
if [ -z "$VAR" ]; then
	break
fi
	if [ "${VAR:0:13}" = "agi_callerid:" ]; then
		caller_num=${VAR:14}
	fi
done
#caller_num=$1

re='^\+?[0-9]+$'

#not supported in ash
if ! [[ $caller_num =~ $re ]]; then
	#echo "Exiting: Nan"
	echo 'HANGUP'
	exit 1
fi
#echo "Calling number read in script : $caller_num" 
score_page=$(curl -sm 3 https://www.tellows.it/num/"$caller_num")
#score=$(echo $score_page | grep -oP "(?<=:\sScore\s)\d")
score=$(echo "$score_page" | grep -oE "alt=\"tellows Valutazione per.*[[:space:]]Score[[:space:]][[:digit:]]\"")
#bash only
score=${score: -2:1}
#ash variant
#pos=$((${#score} - 2))
#score=${score:$pos:1}
#echo "Score parsed online: $score"
if [[ $score -gt 5 && $score -lt 10 ]]; then
	echo 'SET VARIABLE is_annoying "1" '; else
	echo 'SET VARIABLE is_annoying "0" '
fi

exit 0
