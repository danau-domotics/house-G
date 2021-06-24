#!/bin/bash

DEFAULT_USER="pi"
COMMON_PASS=""

REBOOT_REQUIRED="false"

LAN_MAC=$(  sudo ifconfig eth0  | grep ether | sed "s/[ \t]*ether[ \t]*//g" | cut -d\  -f1 )
WIFI_MAC=$( sudo ifconfig wlan0 | grep ether | sed "s/[ \t]*ether[ \t]*//g" | cut -d\  -f1 )
echo
echo
echo "**********************"
echo "Performing maintenance"
echo "**********************"
echo " LAN-MAC: ${LAN_MAC}"
echo " WiFi-MAC: ${WIFI_MAC}"
echo "*************************"
echo "-Set boot and root-filesystems (temporary) to read-write"
sudo mount -o remount,rw /
sudo mount -o remount,rw /boot

ROOT_DISK_FREE_SPACE=$(sudo parted /dev/mmcblk0 unit B print free | grep "Free Space" | cut -dB -f3 | sed 's/ //g' | sort --numeric --reverse | head -n 1)
#Check if more than 400MB is unused (and ask for resize in such case)
if [ ${ROOT_DISK_FREE_SPACE} -gt 400000000 ]
then
	echo "-Request resize of root partition (free space: ${ROOT_DISK_FREE_SPACE})"
	REBOOT_REQUIRED="true"
	sudo raspi-config nonint do_expand_rootfs
fi

# Should actually use ssh-keygen from host-side and disable password
echo "-Reconfigure password for pi-user"
echo "${DEFAULT_USER}:${COMMON_PASS}" | sudo chpasswd

# TODO: Add watchdog timer from:
# https://k3a.me/how-to-make-raspberrypi-truly-read-only-reliable-and-trouble-free/

echo "********************"
echo "Minimize disk-writes"
echo "********************"
#Based on:
# https://hallard.me/raspberry-pi-read-only/
# https://gist.github.com/doegox
if false
then
	echo "-Add rootwait and noswap if needed"
	sudo sed -i 's/rootwait$/rootwait noswap ro/' /boot/cmdline.txt
fi

#sudo rm -rf /var/lib/dhcp/ /var/lib/dhcpcd5 /etc/resolv.conf
#sudo /etc/resolv.conf
#sudo touch /tmp/dhcpcd.resolv.conf
#sudo ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf
echo ""
echo "Just set some default nameservers until automatically written"
echo ""                          | sudo tee /etc/resolv.conf
echo "nameserver 192.168.50.254" | sudo tee -a /etc/resolv.conf
echo "nameserver 192.168.50.1"   | sudo tee -a /etc/resolv.conf
sudo chmod 644 /etc/resolv.conf 

#echo "-Move DHCP PID-files to /tmp"
#sudo sed -i 's#PIDFile=/run/dhcpcd.pid#PIDFile=/var/run/dhcpcd.pid#' /etc/systemd/system/dhcpcd5.service
#sudo sed -i 's#PIDFile=/run/dhcpcd.pid#PIDFile=/var/run/dhcpcd.pid#' /lib/systemd/system/dhcpcd.service

if false
then
	echo "-Set root-fs to read-only in /etc/fstab"
	sudo sed -i "s/defaults,noatime/defaults,ro,noatime/" /etc/fstab

	echo "-Remove random-seed file and replace by tmp-version"
	sudo rm /var/lib/systemd/random-seed
	sudo touch /tmp/random-seed
	sudo chmod 600 /tmp/random-seed
	sudo chown root:root /tmp/random-seed
	sudo ln -s /tmp/random-seed /var/lib/systemd/random-seed

	cat /lib/systemd/system/systemd-random-seed.service | grep --quiet 'ExecStartPre=/bin/echo "" >/tmp/random-seed'
	if [ $? -ne 0 ]
	then
		echo "-Make sure (temporary) random-seed file gets created during startup"
		sudo sed -i '/RemainAfterExit=yes/ a ExecStartPre=/bin/echo "" >/tmp/random-seed' /lib/systemd/system/systemd-random-seed.service
	fi
fi


echo "********************"
echo "Finalize maintenance"
echo "********************"

if false
then
	echo "-Set root-filesystem (back) to read-only"
	sudo mount -o remount,ro /
	if [ $? -ne 0 ]
	then
		echo "--RO remount failed, requesting reboot."
		REBOOT_REQUIRED="true"
	fi

	echo "-Set boot-filesystem (back) to read-only"
	sudo mount -o remount,rw /boot
	if [ $? -ne 0 ]
	then
		echo "--RO remount failed, requesting reboot."
		REBOOT_REQUIRED="true"
	fi

	if [ ${REBOOT_REQUIRED} == "true" ]
	then
		echo "-Reboot is required!"
		# echo "--Rebooting system"
		# sudo reboot
	fi
fi


echo ""
