#/bin/bash
#本脚本用来同步阿里云服务器数据
#此脚本适用于mac端 linux自行修改



backalipath="/backup/aliyun/opt"
backalizippath="/backup/aliyun/backzip"
backvolumes="/Volumes/BackStrong/backups/aliyun"

rsync -arlptgovPze "ssh" cortana:/opt/  ${backalipath} --delete



if [ -d ${backvolumes} ];then #backup on macbook

	if [ -f ${backvolumes}-`date +%F`.gzi ];then
		echo "已经备份"
	else
		tar -zcvf ${backvolumes}/`date +%F`.gzip ${backalipath}
	fi
else #backup on backdisk
		if [ -f ${backalizippath}-`date +%F`.gzi ];then
		echo "已经备份"
	else
		tar -zcvf ${backalizippath}/`date +%F`.gzip ${backalipath}
	fi

fi

rm -rf  ${backalizippath}/`date  -v -5d +%F`.gzip
rm -rf  ${backalizippath}/`date  -v -6d +%F`.gzip
rm -rf  ${backalizippath}/`date  -v -7d +%F`.gzip

rm -rf  ${backvolumes}/`date  -v -7d +%F`.gzip
rm -rf  ${backvolumes}/`date  -v -6d +%F`.gzip
rm -rf  ${backvolumes}/`date  -v -5d +%F`.gzip






