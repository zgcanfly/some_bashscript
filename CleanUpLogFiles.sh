#!/bin/bash
#author seven
#每月执行一次即可
#适用与没有提供docker服务的机器

logpath=/data/log
date=`date +%Y`


cleanlog(){
    rm -rf `ls * |grep "${date}"`
    for i in `du -h *|grep "G"|awk '{print $2}'` ;do echo :> $i;done
    for i in `du -h *|grep "M"|awk '{print $2}'` ;do echo :> $i;done
}
action(){
    for j in $logpath;do

        if [ -d $j ];then
            cd $j && cleanlog
        fi

    done
}
cd $logpath && du -h|grep -q "G" && action || echo "logsize << 1G " >>/dev/null