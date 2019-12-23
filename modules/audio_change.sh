#!/bin/bash
# built to resolve bluetooth issue. this script will help you to  
#
# assign your bluetooth address mac address here
bluetooth_device="98:52:3D:66:21:88"
# this line is optional, used to change config of i3wm. If you don't use i3, please leave this line empty
config_loca="/home/$(whoami)/.config/i3/config"

function audio_bluetooth {
	printf '%s\n' 'power on' 'agent on' "connect $bluetooth_device" | bluetoothctl
}


function audio_internal {
	printf '%s\n' 'power on' 'agent on' "disconnect $bluetooth_device" | bluetoothctl
}

function i3_conf {
		# set up control volume for i3
	if [ "$1" = '-i' ]
	then
		local bluetooth_name=$(echo -e "$bluetooth_device" | sed "s/:/_/g")
		sed -i "s/bluez_sink.$bluetooth_name.a2dp_sink/alsa_output.pci-0000_00_1f.3.analog-stereo/g" '/home/anpham/.config/i3/config'
	else [ "$1" = '-b' ]
		local bluetooth_name=$(echo -e "$bluetooth_device" | sed "s/:/_/g")
		sed -i "s/alsa_output.pci-0000_00_1f.3.analog-stereo/bluez_sink.$bluetooth_name.a2dp_sink/g" '/home/anpham/.config/i3/config'
	fi
	i3-msg reload
}


function help {
	echo " usuage: audio_change <internal|bluetooth> "
	echo -e " \t-i, --internal  \tSwitch audio to internal audio  "
	echo -e " \t-b, --bluetooth \tSwicht audio to bluetooth headset " 
}

if [[ "$1" = '-i' || "$1" = '--internal' ]]; then
	echo "Changing to internal audio" 
	audio_internal && echo "Success"
	i3_conf '-i'
elif  [[ "$1" = '-b' || "$1" = '--internal' ]]; then
	echo "Changing to bluetooth audio"
	audio_bluetooth  && echo "Success"
	i3_conf '-b' 
else
	echo "Invalid argument" && sleep 2s &&  help 
	exit 1
fi





