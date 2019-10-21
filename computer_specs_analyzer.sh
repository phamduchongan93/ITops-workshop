#!/bin/bash
# Description: the template and outline of the this scripted was taken from treehouses team. I did not come up with design. To know more about the team project please visit https://treehouses.io  The lib and commands are rewritten wto fit my own need.



library_path=modules
# extracting library


read_file_to_array {
i=1
while read line
do 
	array[$i]="$line"
	(( i++ ))
 
done 
}


[[ ! `whoami` == root ]] && echo 'error: require root privellege'



function toolbox_supported_command {
  # importing modules filename  to an array
  array=(`ls  "$library_path"` | xargs)
  echo ${array[@]}
}


function help {
}

case $1 in 
  f
    ram_report 
  ;; 
esac
  
