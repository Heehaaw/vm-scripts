#!/bin/sh

command=$2

if [ "$1" = "win10-passthrough" ]; then

	if [ "$command" = "prepare" ]; then
		# Finish writing any outstanding writes to disk.
		sync
		# Drop all filesystem caches to free up more memory.
		echo 3 > /proc/sys/vm/drop_caches
		# Do another run of writing any possible new outstanding writes.
		sync
		# Tell the kernel to "defragment" memory where possible.
		echo 1 > /proc/sys/vm/compact_memory

	elif [ "$command" = "start" ]; then
		# Detach the PCI devices
		#echo 0000:03:00.0 | tee /sys/bus/pci/drivers/amdgpu/unbind 
		#echo 0000:03:00.0 | tee /sys/bus/pci/drivers/vfio-pci/bind
        #echo 0000:03:00.1 | tee /sys/bus/pci/drivers/snd-hda-intel/unbind 
        #echo 0000:03:00.1 | tee /sys/bus/pci/drivers/vfio-pci/bind
		echo 0 > /sys/class/vtconsole/vtcon*/bind
		#virsh nodedev-dettach pci_0000_03_00_0 
     	#virsh nodedev-dettach pci_0000_03_00_1
		# Allow host to use only unpinned CPUs
		systemctl set-property --runtime -- system.slice AllowedCPUs=0,1,2,3
		systemctl set-property --runtime -- user.slice AllowedCPUs=0,1,2,3
		systemctl set-property --runtime -- init.scope AllowedCPUs=0,1,2,3

	elif [ "$command" = "release" ]; then
		# Revert the CPU restrictions
	    systemctl set-property --runtime -- system.slice AllowedCPUs=0-15
	    systemctl set-property --runtime -- user.slice AllowedCPUs=0-15
	    systemctl set-property --runtime -- init.scope AllowedCPUs=0-15
		# Reattach PCI devices
	    #virsh nodedev-reattach pci_0000_03_00_0 
	    #virsh nodedev-reattach pci_0000_03_00_1
	fi
fi
