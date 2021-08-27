#!/bin/bash


#extract am/AM or pm/PM from the input to do different query
input_ampm=$(grep -Eo '[a-zA-Z]{1,4}' <<< $2)

input_number=$(grep -Eo '[1-9]{1,4}' <<< $2 | head -1)


#Game acceptable input: B/b: blackjack, R/r: Roulette, T/t: Texas Hold'Em
input_game=$3

echo "$input_ampm"

echo "$input_number"

echo "$input_game"

#whole_day_result=$(grep "$input_number" $1_Dealer_schedule)
#echo "$whole_day_result"

#AM_result=$(grep "$input_number" $1_Dealer_schedule | grep -i "AM")
#echo "$AM_result"

#PM_result=$(grep "$input_number" $1_Dealer_schedule | grep -i "PM")

#echo "$PM_result" 

#if user does not specify AM/PM,only put in numbers, script will query both AM and PM

if test -z "$input_ampm"; then
	if grep -qi "$input_game" <<< "R"; then
        	grep "$input_number" $1_Dealer_schedule | awk '{print $5,$6}'
	elif grep -qi "$input_game" <<< "T"; then
		grep "$input_number" $1_Dealer_schedule | awk  '{print $7,$8}'
	elif grep -qi "$input_game" <<< "B"; then
		grep "$input_number" $1_Dealer_schedule | awk  '{print $3,$4}'
	else
		echo "$input_game" " is not in acceptable format. Game acceptable input: B/b, R/r, T/t"
	fi
#if user specify AM/PM, script will query only the specified
else
        if  grep -qi "$input_ampm" <<< "AM"; then
		 if grep -qi "$input_game" <<< "R"; then
                	grep "$input_number" $1_Dealer_schedule | grep -i "AM" | awk  '{print $5,$6}'
        	elif grep -qi "$input_game" <<< "T"; then
                	grep "$input_number" $1_Dealer_schedule | grep -i "AM" | awk  '{print $7,$8}'
        	elif grep -qi "$input_game" <<< "B"; then
                	grep "$input_number" $1_Dealer_schedule | grep -i "AM" | awk  '{print $3,$4}'
        	else
               		echo "$input_game" " is not in acceptable format. Game acceptable input: B/b, R/r, T/t"
		fi
        elif grep -qi "$input_ampm" <<< "PM"; then
		if grep -qi "$input_game" <<< "R"; then
                        grep "$input_number" $1_Dealer_schedule | grep -i "PM" | awk  '{print $5,$6}'
                elif grep -qi "$input_game" <<< "T"; then
                        grep "$input_number" $1_Dealer_schedule | grep -i "PM" | awk  '{print $7,$8}'
                elif grep -qi "$input_game" <<< "B"; then
                        grep "$input_number" $1_Dealer_schedule | grep -i "PM" | awk  '{print $3,$4}'
                else
                        echo "$input_game" " is not in acceptable format. Game acceptable input: B/b, R/r, T/t"
                fi 



        else
                #if user got a typo, system will call out for the user
                echo "$input_ampm" " Does not have AM/PM info, please check your spell"

        fi

fi


