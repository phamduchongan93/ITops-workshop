#!/bin/bash
# Description: built to setup new server by sending ssh public key on the new server

### variable ###
public_key="$(whoami)/.ssh/id_rsa.pub"
# copying public key to new server

### function ### 
ssh_copy() {
	ssh-copy-id -i "$1" "$2@$3"
}



function help {
	echo " usuage: $(basename $0) <remote_username> <remote_server>"
	echo "Where: "
	echo -e "\t -i or --interactive will enable you to enter interactive mode"
	echo -e "\t <remote_username> is the user name that you can login in remote server"
	echo -e "\t <server_hostname> is the hostname or ip address of remote server " 
}

function addinghostname {
	local $ssh_config_template
	# sed "$ a$hostname " ssh_config - work in process
	
}
function interactive() {
	read -p 'Username: ' $username
	read -p 'Hostname: ' $hostname 

	if [[ ! -z $username || ! -z $hostname ]]
	then
		echo "You haven't enter the username or hostname"
	fi
}

if [[ $1 = '--interactive' ]]
then
	interactive
else
	username="$1"
	hostname="$2"
fi

### Main ###
case "$1" in
	--copy-ssh)	
		ssh-copy "$public_key" "$username@$hostname"
    ssh -i "$public_key" user@host && echo 'success: the private and public key work' || echo 'fail: key authentication fail'
		;;
	--interactive)
		remote_interactive 
  *)
	  echo 'fail: invalid input'
		help
		;;
esac	
