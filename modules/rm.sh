#!/bin/bash

function move_to_trash () {
 # check if you have the backup directory.
 
  if [ -d "/home/`whoami`/backup/" ]; then
		 echo "You haven't creat the backup folder. The backup will be"
		 local backup="/home/`whoami`/backup/"
     mkdir -p "$backup"; 
  fi
 # copy the files or folders before deleting it.
  cp -r "$@" "$backup" &&	command rm -rf "$@" && echo "Moved to trash";

}

alias rm='move_to_trash'


function help () {
		"syntax: rm <filename> 
}
