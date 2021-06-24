#!/bin/bash

# (Future) way of working:
# - TODO: (to implement) Locate Zipped (or unzipped) image
# - TODO: (to implement) Unzip or copy image to local/temporary location
# - TODO: (to implement) Read WiFi network(s) from central location
# - Apply WiFi network(s) to image (using WPA-supplicant)
# - Enable SSH on image (using file on boot disk)
# - Write image to SD-card (when SD-location given as parameter)


#Paths to scan for raspberry pi images
SCAN_FOR_IMAGES=".
~/scorpio/Downloads/apps/Operating_System_images/RaspberryPi
~/Downloads/apps/Operating_System_images/RaspberryPi
../../../../../../Downloads/apps/Operating_System_images/RaspberryPi
../../../../../Downloads/apps/Operating_System_images/RaspberryPi
../../../../Downloads/apps/Operating_System_images/RaspberryPi
../../../Downloads/apps/Operating_System_images/RaspberryPi"

#Set image name
IMG_NAME=""
TMP_IMAGE_LOCATION="."
MOUNT_POINT="pi_img_mnt"
BOOT_MOUNT_POINT="pi_boot_img_mnt"
TARGET_SYSTEM=""

#Process options
while getopts ":b:i:m:t:" opt; do
	case $opt in
		b)
			BOOT_MOUNT_POINT="${OPTARG}"
			;;
		i)
			IMG_NAME="${OPTARG}"
			;;
		m)
			MOUNT_POINT="${OPTARG}"
			;;
		t)
			TARGET_SYSTEM="${OPTARG}"
			;;
		\?)
			echo "Error: Unknown option: -$OPTARG"
			exit 1
			;;
		:)
			echo "Error: Option -$OPTARG requires an argument"
			exit 1
			;;
	esac
done

#Check if name given and if it exists and if support tools are available
IFS="
"
if [ "${IMG_NAME}" == "" ]
then
	echo "No image name given, attempting to auto-detect"
	for SCAN_FOR_IMAGE in ${SCAN_FOR_IMAGES}
	do
		if [ "${IMG_NAME}" == "" ]
		then
			if [ -d "${SCAN_FOR_IMAGE}" ]
			then
				echo "Searching for images in: ${SCAN_FOR_IMAGE}"
				IMG_NAME=$(cd "${SCAN_FOR_IMAGE}"; ls -1 | grep -e "\.img$" -e "\.zip$" | sed "/^$/d" | sort --numeric --reverse | head -n 1)

				if [ $(echo "${IMG_NAME}" | wc -w) -eq 1 ]
				then
					IMG_NAME="${SCAN_FOR_IMAGE}/${IMG_NAME}"
					echo "Autodetected image to be ${IMG_NAME}"
				fi
			else
				echo "Skipping non-found directory ${SCAN_FOR_IMAGE}"
			fi
		fi
	done
fi
	
if [ "${IMG_NAME}" == "" ]
then
	echo "Error: No image given and no image automatically found!"
	exit 1
elif [ ! -f "${IMG_NAME}" ]
then
	echo "Error: Image given is not found"
	exit 1
elif [ ! -f "/sbin/fdisk" ]
then
	echo "Error: fdisk not found"
	exit 1
fi

# Creating temporary location for images
mkdir -p "${TMP_IMAGE_LOCATION}"
TMP_IMG_NAME="${TMP_IMAGE_LOCATION}/$(basename ${IMG_NAME})"

cp "${IMG_NAME}" "${TMP_IMG_NAME}"
if [ $? -ne 0 ]
then
	echo "Error: Cannot copy image to temporary location"
	exit 1
fi

echo "${TMP_IMG_NAME}" | grep -e "\.zip$"
if [ $? -eq 0 ]
then
	echo "Image is zipped, unzipping and going for ISO"
	unzip "${TMP_IMG_NAME}"
	if [ $? -ne 0 ]
	then
		echo "Error: failed to unzip image"
		exit 1
	fi
	rm "${TMP_IMG_NAME}"
	TMP_IMG_NAME=$(echo "${TMP_IMG_NAME}" | sed "s/\.zip$/\.img/")
fi

if [ ! -f "${TMP_IMG_NAME}" ]
then
	echo "Error: Temporary image not found ${TMP_IMG_NAME}"
	exit 1
fi

mount | grep "${MOUNT_POINT} "
if [ $? -eq 0 ]
then
	echo "Error: Mount point ${MOUNT_POINT} already in use"
	exit 1
fi
mount | grep "${BOOT_MOUNT_POINT} "
if [ $? -eq 0 ]
then
	echo "Error: Mount point ${BOOT_MOUNT_POINT} already in use"
	exit 1
fi

#Create mount-points
mkdir -p "${MOUNT_POINT}"
mkdir -p "${BOOT_MOUNT_POINT}"

#Determine mount start location
FDISK_OUT=$( /sbin/fdisk -l "${TMP_IMG_NAME}" )
echo "Fdisk out:"
echo "${FDISK_OUT}"
echo ""
UNITS_BYTES=$( echo "${FDISK_OUT}" | grep "^Units" | cut -d= -f2 | cut -d\  -f 2 )
echo "Units:          ${UNITS_BYTES}"
LIN_PART_UNIT_START=$( echo "${FDISK_OUT}" | grep "Linux$" | sed "s/ \+/ /" | cut -d\  -f 2)
echo "Start (Linux) in Units: ${LIN_PART_UNIT_START}"
LIN_PART_BYTE_START=$(( UNITS_BYTES * LIN_PART_UNIT_START ))
echo "Start (Linux) in Bytes: ${LIN_PART_BYTE_START}"

BOOT_PART_UNIT_START=$( echo "${FDISK_OUT}" | grep "FAT32" | sed "s/ \+/ /" | cut -d\  -f 2)
echo "Start (Boot) in Units:  ${BOOT_PART_UNIT_START}"
BOOT_PART_BYTE_START=$(( UNITS_BYTES * BOOT_PART_UNIT_START ))
echo "Start (Boot) in Bytes:  ${BOOT_PART_BYTE_START}"

echo "Mount the boot partition"
mount -o offset="${BOOT_PART_BYTE_START}" "${TMP_IMG_NAME}" "${BOOT_MOUNT_POINT}"
if [ $? -ne 0 ]
then
	echo "Error: Mount (Boot) failed"
	exit 1
fi

echo "Setup remote SSH login"
#Make sure the ssh file exists
touch "${BOOT_MOUNT_POINT}/ssh"
#Perform sync to ensure all writes are finished
sync

echo "Setup WLAN settings Scorpio"
/bin/cat <<EOF >${BOOT_MOUNT_POINT}/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=NL

network={
    ssid=""
    psk=""
    key_mgmt=WPA-PSK
}
EOF

echo "Unmount the boot partitition"
umount "${BOOT_MOUNT_POINT}"
if [ $? -ne 0 ]
then
	echo "Error: Unmounting (Boot) failed"
	lsof | grep "${BOOT_MOUNT_POINT}"
	exit 1
fi

echo "Mount main (Linux) partition"
mount -o offset="${LIN_PART_BYTE_START}" "${TMP_IMG_NAME}" "${MOUNT_POINT}"
if [ $? -ne 0 ]
then
	echo "Error: Mount (Linux) failed"
	lsof | grep "${MOUNT_POINT}"
	exit 1
fi

echo "Unmounting main (Linux) partition"
#Perform sync to ensure all writes are finished
sync
umount "${MOUNT_POINT}"
if [ $? -ne 0 ]
then
	echo "Error: Unmounting (Linux) failed"
	lsof | grep "${MOUNT_POINT}"
	exit 1
fi

echo "Removing mountpoints"
rmdir "${MOUNT_POINT}"
rmdir "${BOOT_MOUNT_POINT}"

if [ "${TARGET_SYSTEM}" != "" ]
then
	echo "Writing image to device at ${TARGET_SYSTEM}"
	dd if="${TMP_IMG_NAME}" of="${TARGET_SYSTEM}" bs=16M
	sync
else
	echo "No target device given; not writing image."
fi

echo "Cleaning up temporary image"
rm -f "${TMP_IMG_NAME}"
rmdir "${TMP_IMAGE_LOCATION}"

exit 0
