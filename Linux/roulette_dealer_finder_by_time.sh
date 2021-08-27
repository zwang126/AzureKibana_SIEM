#!/bin/bash


#extract am/AM or pm/PM from the input to do different query
input_ampm=$(grep -Eo '[a-zA-Z]{1,4}' <<< $2)

input_number=$(grep -Eo '[1-9]{1,4}' <<< $2 | head -1)



echo "$input_ampm"

echo "$input_number"

#if user does not specify AM/PM,only put in numbers, script will query both AM and PM

if test -z "$input_ampm"; then
	grep "$input_number" $1_Dealer_schedule

#if user specify AM/PM, script will query only the specified
else
	if  grep -qi "$input_ampm" <<< "AM"; then
		grep "$input_number" $1_Dealer_schedule | grep -i AM
	elif grep -qi "$input_ampm" <<< "PM"; then
		grep "$input_number" $1_Dealer_schedule | grep -i PM

	
	else
		#if user got a typo, system will call out for the user
		echo "$input_ampm" " Does not have AM/PM info, please check your spell"

	fi

fi
