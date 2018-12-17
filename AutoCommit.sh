#!/usr/bin/env bash
#建议添加进定时任务
#* * * * * source /root/some_bashscript/AutoCommit.sh && echo "last update success:`date`">>/tmp/Autocommit.txt || echo "last update false:`date`">>/tmp/Autocommit.txt
gitplace='/opt/docker/jupyter/data/jupyter/  /root/jupyter/data/jupyter /root/some_bashscript/'
for i in ${gitplace};do
	if [ -d ${i} ];then

		echo "开始pull $i"
		cd ${i} && git pull --no-edit
		echo "开始push $i"
		cd ${i} && git add . && git commit -m "automatic commit and push files" && git push ||git push
	fi
done

