#!/bin/bash
text="default_up"
 grep -v -q "env.sh" /Users/codebayby/.bashrc || echo "source /opt/sg_deploy/shell/env.sh " >> /Users/codebayby/.bashrc
 grep -v -q "env.sh" /root/.baserc || echo "source /opt/sg_deploy/shell/env.sh " >> /root/.baserc
 grep -v -q "env.sh" /home/centos/.bashrc || echo "source /opt/sg_deploy/shell/env.sh " >> /home/centos/.bashrc
 grep -v -q "env.sh" /Users/zgyang/.bash_profile || echo "source /opt/sg_deploy/shell/env.sh " >> /Users/zgyang/.bash_profile
 clear

gitpush(){
    git add --all && git commit -am "$text" && git push
}
gitpull(){
    git pull
}
gitset(){
    git config --global http.sslVerify false
    git config --global core.autocrlf input
    git config --global http.postBuffer 524288000
    git config --global push.default simple
    git config --global core.filemode false
    git config --unset core.filemode
    git config core.filemode false
    # 下面这句设置在本地命令行下记住账号密码
    git config --global credential.helper store
    # 下面这条为了让合并有单独的记录，而不是rebase式的fast-forward
    git config --global --add merge.ff false
}


vimnginx(){
    vim /etc/nginx/nginx.conf
}

vimhostname(){
    vim /etc/hostname
}

vimhosts(){
    vim /etc/hosts
}

vimenv(){
    vim /opt/sg_deploy/shell/env.sh
}

vimbaserc(){
    vim ~/.baserc
}
crontset(){
    #only root can setting...
    crontab -l |grep -v -q "pm2-zabbix" && echo " ##pm2-zabbix 守护进程">>/var/spool/cron/$USER
    crontab -l |grep -v -q "deamon.sh" && echo "* * * * * /bin/bash /opt/sg_deploy/shell/deamon.sh &">>/var/spool/cron/$USER
    crontab -l |grep -v -q "deamon.sh" && echo "* * * * * cd /opt/sg_deploy/shell/ && gitpull &">>/var/spool/cron/$USER
    crontab -l |grep -v -q "logsclean.sh" && echo "#logsclean.sh">>/var/spool/cron/$USER
    crontab -l |grep -v -q "cleanlog.sh" && echo "1 1 * 1 * /bin/bash /opt/sg_deploy/shell/cleanlog.sh &">>/var/spool/cron/$USER
    crontab -l
}

catnginx(){
    cat /etc/nginx/nginx.conf
}

catenv(){
    cat /opt/sg_deploy/shell/env.sh
}

cathostname(){
    echo $HOSTNAME
}

cathosts(){
    cat /etc/hosts
}

up(){
    ping www.baidu.com
}

cleanlog(){
    source /opt/sg_deploy/shell/cleanlog.sh
}

wpimgs(){
    source /opt/sg_deploy/shell/wpimgs.sh
}

systeminfo(){
    source https://github.com/zgcanfly/some_bashscipt/blob/master/GetSystemInfo.sh
}
deamon(){
    source /opt/sg_deploy/shell/deamon.sh
}
createswap(){
    source /opt/sg_deploy/shell/createswap.sh
}
downenv(){
    source /opt/sg_deploy/shell/env.sh
}