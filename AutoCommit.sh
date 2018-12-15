#!/usr/bin/env bash
gitplace='/opt/docker/jupyter/data/jupyter'
cd ${gitplace} && git add ${gitplace} && git commit -m "automatic commit and push files"&& git push
