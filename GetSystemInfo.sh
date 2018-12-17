#!/bin/bash
#
status(){
	echo -e "\033[31m服务器状态检测脚本，用于监控cpu，mem，disk，network状态\033[0m \n"
    cpus=`lscpu|head -n 4|grep "CPU(s)"`
    Mem_Total=`free -m|grep "Mem"|awk '{print $2}'`
    Mem_Use=`free -m|grep "Mem"|awk '{print $3}'`
    Mem_Free=`free -m|grep "Mem"|awk '{print $4}'`
    Disk=`df -h`
    Date=`date +%F-%T`
    Update=`top -n 1|head -n 1|awk '{print$3}'`
    Network=`ss -alt`
    Who=`w`
    Runlevel=`who -r |awk '{print $1 $2}'`
    top_LB=`top -n 1|head -n 1|awk '{print $10,$11,$12}'`
    echo -e "\033[31m当前时间:\033[0m \033[36m$Date\033[0m  \033[31m服务器已运行时间:\033[0m  \033[36m$Update\033[0m \033[31m系统运行级别\033[0m \033[36m$Runlevel\033[0m \n"
    echo -e "\033[31m当前CPU核心数\033[0m   CPU核心数 \033[36m$cpus\033[0m \n "
    echo -e "\033[31mCPU负载\033[0m   \033[36m$top_LB\033[0m \n "
    echo -e "\033[31m当前内存使用量\033[0m  总内存 \033[36m$Mem_Total\033[0m    已使用 \033[36m$Mem_Use\033[0m       剩余内存 \033[36m$Mem_Free\033[0m \n"
    echo -e "\033[31m当前磁盘使用量\033[0m \033[36m$Disk\033[0m \n"
    echo -e "\033[31m当前网络链接\033[0m \033[36m$Network\033[0m \n"
    echo -e "\033[31m当前用户登录\033[0m \033[36m$Who\033[0m \n"
}

status
