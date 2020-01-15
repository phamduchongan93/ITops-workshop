#!/bin/bash
# modules for checking overrall system
function system_check {
	# checking if the user have systemd
	if [ $(which sytemd) ]; then
		echo 'systemd'
	fi
}

function distro_check {
	case $1
		--nameonly,n)
			lsb_release -ar 2>/dev/null | grep -i distributor | cut -s -f2
		--numberonly,N) 
		  lsb_release -ar 2>/dev/null | grep -i release | cut -s -f2 
	esac
}
function rootcheck {
	if [[ $(id -u) -ne 0 ]]; then 
		echo 'error: require root privellege'
	fi 
}

function shellcheck {
	if [ ! $(which shellcheck) ];	then
		echo 'error: shellcheck snot installed'	
		if [ distro_check() == 'Ubuntu' ]; then
			apt-get install shellcheck -y && echo 'shellcheck is installed'
	  else
			yum install shellcheck -y && echo 'shellcheck is installed'
		fi 
	fi
}
