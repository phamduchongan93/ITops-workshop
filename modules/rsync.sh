#!/bin/bash
# this script will backup selected directory or remote server.
# Description: this will backup current hard drive to a remote server. 

## variable ##
host=192.168.0.88
user=pi
remote_directory_path=/mnt/external
## function ##
function check_net {
	if [ ping -c $1 ]; then
		echo "error: can't find the host"
		exit 1
	fi
}


function dd_over_ssh {
  partition_to_clone="$1"
	check_net "$host"
	[ nmap -p 22 "$user@$host" = 0 ] && echo 'The port 22 is opend' || echo 'error: please check ssh port on the server'
	dd if=$1 bs=128K conv=sync | gzip -c | ssh pi@host:"$remote_directory_path" dd of=$imagename status=progress
}

function sendfiles_overssh{
	rsync "$1" "$user@$host:$2"
}

## main program ##

case $1 in
	--rsync)
		echo 'Sending files over the network'
		echo ''
	;;
  --image-ssh)
		echo 'Create images of localhost on remote server'
		dd_over_ssh
	;;
*)
	  echo 'invalid argument'
		exit 1;
esac


