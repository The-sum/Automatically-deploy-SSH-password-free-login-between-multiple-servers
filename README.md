# Automatically-deploy-SSH-password-free-login-between-multiple-servers
使用shell脚本和expect工具完成

# autossh.sh
在当前主机创建密匙，并且分发到iplist.txt中所有的主机节点

# iplist.txt
存放主机节点

# xsync.sh
将文件分发到iplist.txt中所有的主机节点

# allsshcopy.sh
遍历iplist.txt中所有主机，创建密匙，并分发给所有主机。

# 使用说明
## 在iplist.txt中存放要配置的服务器的IP地址，必须遵守一行为一个IP的格式  
hadoop102  
hadoop103  
hadoop104  
## 四个代码文件必须在同一个目录下
## 所有主机都必须安装expect，否则会报错
	yum install -y expect
## 在allsshcopy.sh文件中有一个path和iptop变量，这个必须根据自己的目录来设置
path设置成四个代码文件所在的目录  
如果代码文件在/home/xx/bin/目录下  
path=/home/xx/bin  
iptop设置成主节点的IP地址
## 执行过程  
1.在iplist.txt文件中添加需要配置的所有主机IP  
2.选择一个主节点，在主节点执行allsshcopy.sh(主节点的选择随意)  

 
出现问题欢迎提问  
vx:xx_ojbk
