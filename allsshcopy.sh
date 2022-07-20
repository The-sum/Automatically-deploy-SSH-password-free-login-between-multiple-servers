#!/bin/bash

path="/home/xx/bin"
xsync_path="./xsync.sh"
iplist_path="./iplist.txt"
autossh_path="./autossh.sh"
iptop="hadoop102"

yum install -y expect

$autossh_path

$xsync_path $iplist_path $autossh_path



for host in `cat $iplist_path`; do
	#statements
	if [[ $iptop != $host ]]; then
		#statements
		echo "--------------- $host -------------------"
		ssh $host "sudo yum install -y expect"
		ssh $host "cd $path; $autossh_path"
	fi
done