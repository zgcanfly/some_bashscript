#!/bin/bash
#author: ZGYANG
#date: 2017/7/4
#
echoflase(){
	echo -e "$1 \033[31mflase\033[0m 0*$2"
}
echoOK(){
	echo -e "$1= \033[36mOK\033[0m \n"
}



#生产环境请自行修改密码
#echo "XsdgVT!Ereg" | passwd --stdin root && echoOK passwd || echoflase passwd 1
#测试环境使用简单passwd
echo "test" | passwd --stdin root && echoOK passwd || echoflase passwd 1



#修改运行级别,c7没有需要修改


sed -i 's@SELINUX=enforcing@SELINUX=disabled@g' /etc/selinux/config &> /dev/null && echoOK selinux || echoflase selinux 2


#chkconfig ip6tables off &>/dev/null &&  echoOK chkconfig-ip6tables ||  echoflase chkconfig-ip6tables 3


#c7没有需要修改firewalld

 echo "\l \D \t   You are logging in to the admin area. Please pay attention to your operation. . \n ">/etc/issue &&  echoOK issue || echoflase etc-issue 4

#增加系统启动速度
 #sed -i 's@timeout=5@timeout=2@g' /boot/grub/grub.conf &>/dev/null && echoOK grub.conf-time || echoflase grub.conf-time 5


 #sed -i 's@hiddenmenu@#hiddenmenu@g' /boot/grub/grub.conf &>/dev/null && echoOK grub.conf-hiddenmenu ||  echoflase grub.conf-hiddenmenu 6

#sed -i 's#HOSTNAME=#&#g' /etc/sysconfig/network &>/dev/null && echoOK HOSTNAME=Yang-linux ||  echoflase HOSTNAME-Yang-linux 15




#修改主机名
Nd="ip a|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'|sort|head -n 1"
echo "`$Nd`-yuangg.com" 2>/dev/null &&  echoOK change_hostname || echoflase change_hostname 7

#修改运行级别
#systemctl set-default multi-user.target切换到3级别
#systemctl set-default graphical.target切换到5级别
systemctl set-default multi-user.target  2>/dev/null  && echoOK change_runlevel ||  echoflase change_runlevel 8

#创建用户，并赋予权限,暂时不用
#if  `useradd yang`>>/etc/yum.repos.d/yang.repo 2>/dev/null;then
#		echoOK gpgcheck
#	else
#		echoflase gpgcheck 6
#	fi
#禁用默认防火墙
systemctl disable firewalld.service 2>/dev/null &&  echoOK dis_firewall || echoflase dis_firewall 9


#启用iptables
#yum install iptables-services 2>/dev/null &&  echoOK en_iptables || echoflase en_iptales 10

chmod +x /etc/rc.d/rc.local && echoOK rc.local || echoflase rc.local 11

#安装一些常用软件

yum install -y epel-release && echoOK epel || echoflase epel 12

yum install -y python-pip htop vim tree git screen  svn iftop  ftp lftp  wget atop dstat krb5-devel  gzip  tmux && echoOK installenv || echoflase installenv 13
#以下建议自己修改

install(){

useradd centos && echo 'test' | passwd --stdin centos && echoOK adduser echoflase adduser 14

# 为centos增加sudo权限
echo "centos    ALL=(ALL)       ALL" >>  /etc/sudoers


# 禁用root用户登录
#sed -i.bak '/PermitRootLogin/c PermitRootLogin no' /etc/ssh/sshd_config
#service sshd restart
mkdir ~centos/.ssh

cat << EOF > ~centos/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsktQ8Bz+rJJTBcQGcPKbpLX3t8wf8hVsxScyJ36vXRY8C1C/b2Nxt/dbMEOM3QLrwH8HYCMKZSlINkw6ZbzUtxJqSfgQsr/60lgMy1W7Fvx9UOeeIOQThlEyCesS/k+h0ILQPL1xcH9k+sRZ84jwtUsD6Ww8JeHHpzXucXl0Gsk8WthXwcIbxvkFbth99MSk2olIWPMs8ZSXgPfAfoI0Qamlwe0p0Xy0wgE+Y3+2FhNSNSLhi8rGTzqYZpFMTK50AecMBw9Y5loM8Hu7kuvfZ4b+vI+TiJKX1+ZbVvwz+1mZGNmT0tjtuKxqMTP6R0IRyg1oISbuzxghr6OyxSjgv codebayby@Cortana.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4a3T9fHM21IoTM22deU6IssPQ5avCTFt0gEkcvvNgl2UUVCr+687fZrAWpDyc37W1TSNIpEk89ur0q5WPvYohuwY2ScI6/ZWBT3ikP3UqAZ7GQqsULTZFyFa4v2MT7Jjx2JV2RdgfdvkATMWAS36+vqifvTitJHhZaQ9tHyU/HFyl6fkKzQ1Sk9GdHUSbcDoylvUrcJkbvfvAvxHbCav+Z/V9bSia664jtmVyHrxDGplOC23zaZ6uBpA0AT0A6tEbTOFogF6c8hyO3fuelqHGdCvMoh1vS3cnRAFNGjA7w5wHhz+oR2TwXsEdxXZjfkpb591grRBlE51/zcX3XLrD root@iZbp1c7whwj30hz9athejcZ
EOF



}

root(){
mkdir ~/.ssh

cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsktQ8Bz+rJJTBcQGcPKbpLX3t8wf8hVsxScyJ36vXRY8C1C/b2Nxt/dbMEOM3QLrwH8HYCMKZSlINkw6ZbzUtxJqSfgQsr/60lgMy1W7Fvx9UOeeIOQThlEyCesS/k+h0ILQPL1xcH9k+sRZ84jwtUsD6Ww8JeHHpzXucXl0Gsk8WthXwcIbxvkFbth99MSk2olIWPMs8ZSXgPfAfoI0Qamlwe0p0Xy0wgE+Y3+2FhNSNSLhi8rGTzqYZpFMTK50AecMBw9Y5loM8Hu7kuvfZ4b+vI+TiJKX1+ZbVvwz+1mZGNmT0tjtuKxqMTP6R0IRyg1oISbuzxghr6OyxSjgv codebayby@Cortana.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4a3T9fHM21IoTM22deU6IssPQ5avCTFt0gEkcvvNgl2UUVCr+687fZrAWpDyc37W1TSNIpEk89ur0q5WPvYohuwY2ScI6/ZWBT3ikP3UqAZ7GQqsULTZFyFa4v2MT7Jjx2JV2RdgfdvkATMWAS36+vqifvTitJHhZaQ9tHyU/HFyl6fkKzQ1Sk9GdHUSbcDoylvUrcJkbvfvAvxHbCav+Z/V9bSia664jtmVyHrxDGplOC23zaZ6uBpA0AT0A6tEbTOFogF6c8hyO3fuelqHGdCvMoh1vS3cnRAFNGjA7w5wHhz+oR2TwXsEdxXZjfkpb591grRBlE51/zcX3XLrD root@iZbp1c7whwj30hz9athejcZ
EOF
chmod 600 ~centos/.ssh/authorized_keys
chown -R centos.centos  ~centos/.ssh/authorized_keys
#对称的id_ras是ltest
cat << 'EOF' >> ~/.bashrc

# custom configuration for centos
if [ "$PS1" ]; then
  complete -cf sudo
fi

export EDITOR=vim
export VISUAL=vim
alias npm='npm --registry=https://registry.npm.taobao.org'
alias pm2="pm2 --log-date-format 'YYYY-MM-DDTHH:mm:ssZ'"
alias yum install='yum install -y'
#export PS1='[\u@dev \W]\$ '

alias redis-cli='redis-cli --raw' #让redis-cli正常显示中文
EOF
}

deploy(){
    mkdir -p /opt/{docker,local}
    mkdir -p /data/{log,tmp,backup,wwww}
    chown -R  centos.centos /opt/
    chown -R centos.centos /data
    chown -R centos.centos ~centos/.ssh
}


install
root
deploy

