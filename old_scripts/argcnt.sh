#!/bin/bash

num=1

echo "there are $# arguments"

for i in $@
do
	if [[ $num -eq ]]
		then
			echo "arg $num: $i"
			((num++))
	fi
done

exit

