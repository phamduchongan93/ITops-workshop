#!/bin/bash

save_destination=$1
if [ -n $save_destination ] ; then
  mkdir -p "/home/`whoami`/conf_backup"
  save_destination="/home/`whoami`/conf_backup"
fi

tar -rPf "$save_destination/conf_file.tar" "/home/`whoami`/.bashrc" "/home/`whoami`/.tmux.conf" | tee conf_files_list.log && echo 'Success: config files are backed up'
tar -rPf "$save_destination/Documents.tar" "/home/`whoami`/Documents" | tee Document.log && echo 'Sucess: Documents are backed up'



