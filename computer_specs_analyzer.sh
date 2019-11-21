#!/bin/bash
# Description: the template and outline of the this scripted was taken from treehouses team. I did not come up with design. To know more about the team project please visit https://treehouses.io  The lib and commands are rewritten wto fit my own need.

set -e
library_path='modules'
# extracting library

[[ ! `whoami` == root ]] && echo 'error: require root privellege' && exit 1

function toolbox_supported_command {
  # importing modules filename  to an array
	echo -e "The following command are supported: \n"
	array=( "$1"/*) 	
 	"${array[*]}"
}

toolbox_supported_command  $library_path


case $1 in 
	'ram')
		ram_report 
    ;; 
  'list')
		toolbox_supported_command "$library_path" # list files in module document
	  ;;	
	'internet')
		internet_check
 		# check internet connection
		;;
esac	

# deploy multiple backup 

array=(etc ~/.*)

#function deploy_folders{
#	mkdir -p "~/backup/"

			
#		;;
#	*)
#		echo -e "Error: This argument is not supported \nPlease type --help for more guide"

#    ;;
#esac
  
