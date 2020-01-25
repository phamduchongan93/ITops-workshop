#!/bin/bash
### variable ###
user=anpham

function read_bench_mark() {
  mkdir -p "/home/$user/"
  cd "/home/$user/"
	dd if=/dev/zero of=diskbench bs=1M count=1024 conv=fdatasync
}

function write_bench_mark() {
	# disable buffer caches
	# echo 3 | sudo tee /proc/sys/vm/drop_caches
	# read speed dd
	read_bench_mar()
	dd if=diskbench of=/dev/null bs=1M count=1024
	rm diskbench
}  

### function ###

### main ###
case $1 
  read)
    read_bench_mark()
	write)
	  write_bench_mark()
  *)
	  echo 'invalid input'
		;;	
esac
