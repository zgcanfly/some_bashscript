#!/usr/bin/env bash
gitplace='/opt/docker/jupyter/data/jupyter  /root/jupyter/data/jupyter /root/some_bashscript'

for i in ${gitplace};do
	if [ -d ${i} ];then

		echo "开始pull $i"
		cd ${i} && git pull --no-edit
		echo "开始push $i"
		cd ${i} && git add ${i} && git commit -m "automatic commit and push files"&& git push
	fi
done

