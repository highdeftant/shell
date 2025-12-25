#!/bin/bash

num=1

echo "there are $# arguments"

for i in $@
do
	if [[ $num -lt 0 ]]; then
			echo "arg $num: $i"
			((num++))
	fi
done

exit

