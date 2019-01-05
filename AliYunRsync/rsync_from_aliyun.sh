#/bin/bash
#本脚本用来同步阿里云服务器数据
#此脚本适用于mac端 linux自行修改



backalipath="/backup/aliyun/opt"
backalizippath="/backup/aliyun/backzip"

rsync -arlptgovPze "ssh" cortana:/opt  ${backalipath} --delete

tar -zcvf ${backalizippath}-`date +%F`.gzip ${backalipath}

rm -rf  ${backalizippath}-`date  -v -5d +%F`.gzip
#rm -rf  ${backalizippath}-`date  -v -6d +%F`.gzip
#rm -rf  ${backalizippath}-`date  -v -7d +%F`.gzip






