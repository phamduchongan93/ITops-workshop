#!/bin/env bats

echo -e "\t\t ITops workbench "
echo -e "\t 1. Display the disk space "
echo -e "\t 2. Display the cpu info "echo -e "\t 3. Display the model "
echo -e "\t 4. Display the "


case  $option in 
	1)
		echo 'Displaying the disk usuage '	
	  lsblk -f
		;;
	2)
		echo 'Display cpu usuage'
		rootcheck
		vmstat 5
	  ;;
	3)
		echo ''
		;;
	4)
		;;
	*)
		echo "invalid argument"
		exit 1
		;;
esac
	
