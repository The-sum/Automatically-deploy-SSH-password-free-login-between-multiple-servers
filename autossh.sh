#!/bin/bash

#如果没有.ssh目录就设置成1，有就设置成0
key=1
#当前用户密码
password=123456
#IP列表文件
ip_list_path="./iplist.txt"

ssh_keygen(){
	/usr/bin/expect <<-EOF
		spawn ssh-keygen -t rsa
		expect {
		"Enter file in which to save the key (/home/xx/.ssh/id_rsa): " {send "\r";exp_continue}
		"Enter passphrase (empty for no passphrase): " {send "\r";exp_continue}
		"Enter same passphrase again: " {send "\r";exp_continue}
		}
	EOF
}

ssh_copy(){
	/usr/bin/expect <<-EOF
		spawn ssh-copy-id $1
		expect {
		"(yes/no)? " {send "yes\r"; exp_continue}
		"password: " {send "$password\r";exp_continue}
		}
	EOF
}

#判断是否创建密匙
if [[ $key == 1 ]]; then
	#statements
	ssh_keygen
fi

#分发密匙
while read -r line
do
	ssh_copy $line
done < $ip_list_path