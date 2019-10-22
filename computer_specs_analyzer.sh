#!/bin/bash
# Description: the template and outline of the this scripted was taken from treehouses team. I did not come up with design. To know more about the team project please visit https://treehouses.io  The lib and commands are rewritten wto fit my own need.

set -e
library_path='modules'
# extracting library




[[ ! `whoami` == root ]] && echo 'error: require root privellege'



function toolbox_supported_command {
  # importing modules filename  to an array
  array=(`ls  "$1" | xargs`)
  echo ${array[@]}
}


echo "the argument is $1"
case $1 in 
	'ram')
		ram_report 
    ;; 
  'list')
		toolbox_supported_command "$library_path"
	  ;;	
	 *)
		echo 'error: this argument is not supported'
    ;;
esac
  
