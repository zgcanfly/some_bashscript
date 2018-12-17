#!/usr/bin/env bash
gitplace='/opt/docker/jupyter/data/jupyter'


#开始pull
cd ${gitplace} && git pull --no-edit
#开始push
cd ${gitplace} && git add ${gitplace} && git commit -m "automatic commit and push files"&& git push
