#!/usr/bin/env bash
gitplace='/opt/docker/jupyter/data/jupyter  /root/jupyter/data/jupyter'

for i in ${gitplace};do
	if [ -d ${i} ];then

		#开始pull
		cd ${i} && git pull --no-edit
		#开始push
		cd ${i} && git add ${i} && git commit -m "automatic commit and push files"&& git push
	fi
done

