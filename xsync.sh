#!/bin/bash

# #1. 判断参数个数
if [ $# -lt 1 ]
then
    echo Not Enough Arguement!
    exit;
fi


ip_list_path="./iplist.txt"


#2. 遍历集群所有机器
for line in `cat $ip_list_path`;
do
    echo ====================  $line  ====================
    #3. 遍历所有目录，挨个发送
    for file in $@
    do
        #4. 判断文件是否存在
        if [ -e $file ]
            then
                #5. 获取父目录
                pdir=$(cd -P $(dirname $file); pwd)

                #6. 获取当前文件的名称
                fname=$(basename $file)
                ssh $line "mkdir -p $pdir"
                rsync -av $pdir/$fname $line:$pdir
            else
                echo $file does not exists!
        fi
    done
done
