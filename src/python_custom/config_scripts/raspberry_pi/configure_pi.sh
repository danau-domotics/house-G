#!/bin/bash

# Network to scan for hosts online
LOCAL_NETWORK="192.168.50.0/24"

DEFAULT_USER="pi"
DEFAULT_PASS="raspberry"
COMMON_PASS=""
TMP_FILE=/tmp/pi_commands_root

function get_unified_macs
{
	echo "$1" | sed "s/-/:/g" | tr '[:upper:]' '[:lower:]' | \
		grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
}

if [ "${1}" == "" ]
then
	echo "Scanning for active hosts"
	ACTIVE_NET=$( nmap -n -sP "${LOCAL_NETWORK}" )
	ACTIVE_MACS=$( get_unified_macs "${ACTIVE_NET}" )
	echo "Active hosts:"
	echo "${ACTIVE_NET}"
	exit 0
else
	while [[ $# > 0 ]]
	do
		TARGET_HOST="$1"
		shift
		TARGET_PASS="${COMMON_PASS}"
		echo "Configuring ${TARGET_HOST}"
		
		echo "Reconfiguring RPI root for read/write"
		# And check for which password to use in the process
		sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" sudo mount / -o remount,rw
		if [ $? -ne 0 ]
		then
			echo "Failed to reconfigure for read/write, trying default password"
			TARGET_PASS="${DEFAULT_PASS}"
			sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" sudo mount / -o remount,rw
			if [ $? -ne 0 ]
			then
				echo "Error: failure to reconfigure for read/write on ${TARGET_HOST}, skipping"
				continue
			fi
		fi
		echo "Copying setup scripts to remote host"
		# Remove previous scripts (if any)
		sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" rm /home/pi/pi_config_scripts -rf
		# Copy updated scripts
		sshpass -p ${TARGET_PASS} scp -r ./pi_config_scripts "pi@${TARGET_HOST}":/home/pi
		# Copy additional devices information into config scripts directory
		sshpass -p ${TARGET_PASS} scp -r ../../devices "pi@${TARGET_HOST}":/home/pi/pi_config_scripts
		# Execute default updated scripts
		sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" /home/pi/pi_config_scripts/pi_default_reconfigure.sh
		# Execute climate scripts
		sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" /home/pi/pi_config_scripts/pi_climate_controller_configure.sh
		if [ $? -ne 0 ]
		then
			echo "Failed to reconfigure for climate control, trying scorpio-default password"
			TARGET_PASS="${COMMON_PASS}"
			sshpass -p ${TARGET_PASS} ssh "pi@${TARGET_HOST}" /home/pi/pi_config_scripts/pi_climate_controller_configure.sh
		fi
	done
fi
