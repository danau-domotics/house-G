#!/bin/bash
# Configure raspberry pi to work as climate controller

#For now just hardcoded MAC addresses here. Need to switch to CSV parsing later
# TODO: parse data from central csv files
MASTER_IP="192.168.50.20"
MASTER_MAC=""
ONE_IP="192.168.50.18"
ONE_MAC=""
TROPICAL_IP="192.168.50.22"
TROPICAL_MAC=""
SENTINEL_IP="192.168.50.21"
SENTINEL_MAC=""
SHIELDED_IP="192.168.50.19"
SHIELDED_MAC=""


function set_network
{
	MAC_ADDRESSES=$(/sbin/ifconfig | grep ether | sed "s/^[ ]*//" | cut -d\  -f2)
	IP_ADDRESS=""
	for MAC_ADDRESS in ${MAC_ADDRESSES}
	do
		if [ "${MAC_ADDRESS}" == "${MASTER_MAC}" ]
		then
			IP_ADDRESS="${MASTER_IP}"
		elif [ "${MAC_ADDRESS}" == "${ONE_MAC}" ]
		then
			IP_ADDRESS="${ONE_IP}"
		elif [ "${MAC_ADDRESS}" == "${TROPICAL_MAC}" ]
		then
			IP_ADDRESS="${TROPICAL_IP}"
		elif [ "${MAC_ADDRESS}" == "${SENTINEL_MAC}" ]
		then
			IP_ADDRESS="${SENTINEL_IP}"
		elif [ "${MAC_ADDRESS}" == "${SHIELDED_MAC}" ]
		then
			IP_ADDRESS="${SHIELDED_IP}"
		fi
	done
	
	INTERFACES=$( sudo ifconfig -a | sed "/^[ \t]/d" | sed "/^$/d" | grep -v "^lo:" | cut -d: -f1 )
	NR_IF=$( echo "$INTERFACES" | wc -l )
	
	if [ "$IP_ADDRESS" != "" ]
	then
		cat /etc/dhcpcd.conf | grep --quiet --ignore-case "${IP_ADDRESS}"
		if [ $? -ne 1 ]
		then
			echo "IP address ${IP_ADDRESS} already set for climate function"
		elif [ "$NR_IF" == "2" ]
		then
			echo "Setting up wired interface to ${IP_ADDRESS}"
			echo "
# Static settings
interface eth0
static ip_address=${IP_ADDRESS}/24
static routers=192.168.50.254
static domain_name_servers=192.168.50.254

" | sudo tee -a /etc/dhcpcd.conf
			echo ""	
		else
			echo "Setting IP-address to ${IP_ADDRESS}"
			sudo mount -o remount,rw /
		
			echo "
# Static settings
interface wlan0
static ip_address=${IP_ADDRESS}/24
static routers=192.168.50.254
static domain_name_servers=192.168.50.254

" | sudo tee -a /etc/dhcpcd.conf
			echo ""
		fi
	else
		echo "ERROR: cannot determine role based on MAC ${MAC_ADDRESSES}, not setting ip-address"
		return
	fi
}

set_network

sudo mount -o remount,rw /

