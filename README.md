# Automatically-deploy-SSH-password-free-login-between-multiple-servers
使用shell脚本和expect工具完成

autossh.sh:在当前主机创建密匙，并且分发到iplist.txt中所有的主机节点

iplist.txt:存放主机节点

xsync.sh:将文件分发到iplist.txt中所有的主机节点

allsshcopy.sh:遍历iplist.txt中所有主机，创建密匙，并分发给所有主机。

