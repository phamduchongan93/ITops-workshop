#!/bin/bash

function find_block_device{
	block_name=$(lsblk | grep -i /dev/)
}
save_destination="$1"
if [ -n $save_destination ] ; then
  save_destination="/home/`whoami`"
  mkdir -p "$save_destination/conf_backup"
fi


echo "Your file is going to save at $save_destination/conf_backup"
tar -rPf "$save_destination/conf_backup/conf_file.tar" "$save_destination/.bashrc" "$save_destination/.tmux.conf" "$save_destination/.config/i3/config" | tee conf_files_list.log && echo 'Success: config files are backed up'
tar -rPf "$save_destination/conf_backup/Documents.tar" "/home/`whoami`/Documents" | tee Document.log && echo 'Sucess: Documents are backed up'




