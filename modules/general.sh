#!/bin/bash
function system_check{
	# checking if the user have systemd
	if [ $(which sytemd) ]; then
		echo 'systemd'
	fi
}


function rootcheck {
	if [[ $(id -u) -ne 0 ]]; then 
		echo 'error: require root privellege'
	fi 
}
