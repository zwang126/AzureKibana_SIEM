#!/bin/bash

directory=(
"shadow"
"passwd"
)

for file in ${directory[@]}
do
	permission=$(ls -l /etc/$file)
	echo "file permission for $file is $permission" 
	

done


for user in $(ls /home)
do
	result=$(sudo -l -U $user | grep "(ALL : ALL) ALL")
	if [ -z "$result" ]
	then
		echo $user
	fi
done
