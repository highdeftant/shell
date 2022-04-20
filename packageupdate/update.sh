#!/bin/bash

upgrade='update autoclean autoremove'

for each in $upgrade
do 
	sudo apt $each -y
done

exit
