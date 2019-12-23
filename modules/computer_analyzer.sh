#!/bin/bash



function diskspace {
	lsblk
}


function system_info {
	dmidecode -s system-manufacturer
  dmidecode -s system-product-name
}

fuction internet_check {
	
	if [	ping -c 5 1.1.1.1  ]
	then
		echo "You have internet"
	fi 
	echo "You have internet"
	nslookup wwww.google.com && echo
}
