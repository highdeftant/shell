#!/bin/bash

LOGFILE="user_audit_$(date +%F).log"
USER_=($(sudo awk -F: '{print $1}' /etc/shadow))
PASS_=($(sudo awk -F: '{print $2}' /etc/shadow))

# Arrays for all users and passwords on system
declare -A USER_PASS=(
	["Users"]=$(sudo awk -F: '{print $1}' /etc/shadow)
	["Passwords"]=$(sudo awk -F: '{print $2}' /etc/shadow)
	)

# Counters for Accounts & Errors
ACCOUNTS=0
LOCKED_ACC=0
ERR=0

# Get accounts with Wheel access
get_wheel() {
	local IFS=","
	WHEEL_ACC=($(sudo awk -F: '/wheel/' {print $4}))
	for acc in ${!WHEEL_ACC[@]}; do
		echo $WHEEL_ACC | cut -d "," -f $acc
		if [[ $acc  ]]
}

audit_users() {

	INACTIVE_DATE=$(date -d "14 days ago" +%s)

	echo -e "\n====[ USER AUDIT REPORT ]====\n" | tee -a "$LOGFILE"

	# Iterates through /etc/shadow and finds accounts with passwords
	for x in ${!USER_[@]}; do
		if [[ ${PASS_[x]} != '!'* ]]; then
			ACTIVE_USERS+=(${USER_[x]})
			(( ACCOUNTS++ ))
		else
			(( LOCKED_ACC++ ))
			INACTIVE_USERS+=(${USER_[x]})
			echo "${USER_[x]} Account is Locked/Disabled." | tee -a "$LOGFILE"
		fi
	done

# Sets which account is Active/Inactive based on last logged date
	for USER in ${ACTIVE_USERS[@]}; do
		if [[ $USER != "root" ]] && [[ $LASTLOGGED -lt $INACTIVE_DATE ]]; then
			declare -A USERSTATUS=(
				["Inactive"]=""
				["Active"]=""
				)
			USERSTATUS["Active"]+="$USER"
		else
			USERSTATUS["Inactive"]+="$USER"
		fi
	done

		# Format for User Info output
		for ACCOUNT in ${USER_[@]}; do
			for USERS in ${ACTIVE_USERS[@]}; do
				if [[ "$ACCOUNT" == "$USERS" ]] && [[ "$ACCOUNT" != "root" ]] then
					echo -e "\n*--- Account: $ACCOUNT ---*" | tee -a "$LOGFILE"
					echo "Status: $USERSTATUS" | tee -a "$LOGFILE"
					echo "Groups: " | tee -a "$LOGFILE"
					echo "Home Dir: " | tee -a "$LOGFILE"
					echo "Sudo Status: $SUDOSTATUS" | tee -a "$LOGFILE"
					echo "Last Logged Time: $(last $ACCOUNT | head -1 | awk '{print $5, $6}')" | tee -a "$LOGFILE"
					echo -e "----------------------\n"
						fi
		done
			done
	
	# Audit Summary area
	echo -e "====[ AUDIT SUMMARY ]====\n"
	if [[ $ACCOUNTS -gt 1 ]]; then
		echo -e "$ACCOUNTS Accounts have been found.\n" | tee -a "$LOGFILE"
	else
		echo -e $ACCOUNTS "Account has been found.\n" | tee -a "$LOGFILE"
	fi

}

# Test if user is in sudo group before script execution
if ! $(sudo -v &> /dev/null); then
	echo "ERROR: root privileges are need to run this script."
	echo "Exiting..."
	exit 87
fi

audit_users
