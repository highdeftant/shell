#!/bin/bash

# !WARNING! - Use Caution when using this script. It can erase a full drive

# Usage: ./imgburn.sh [imgfile] [/dev/sd*]
burnISO() {

	IMG=$1
	sudo dd if="$IMG" of=$2 bs=4M status=progress
}

burnISO
