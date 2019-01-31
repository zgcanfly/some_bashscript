#/bin/bash
#本脚本用来同步阿里云服务器数据
#此脚本适用于mac端 linux自行修改



backalipath="/backup/aliyun/opt"
backalizippath="/backup/aliyun/backzip"
backvolumes="/Volumes/BackStrong/backups/aliyun"

rsync -arlptgovPze "ssh" cortana:/opt/  ${backalipath} --delete

																		#检测如果连上存储磁盘将文件移动至存储磁盘上，
if [ -d ${backvolumes} ];then
	mv ${backalizippath}/*.gzip ${backvolumes}/

fi


if [ -d ${backvolumes} ];then                                           #备份在本地macbook上

	if [ -f ${backvolumes}-`date +%F`.gzip ];then
		echo "已经备份"
	else
		tar -zcvf ${backvolumes}/`date +%F`.gzip ${backalipath}
	fi
else                                                                   #备份在存储磁盘上
		if [ -f ${backalizippath}-`date +%F`.gzip ];then
		echo "已经备份"
	else
		tar -zcvf ${backalizippath}/`date +%F`.gzip ${backalipath}
	fi

fi

																		#删除5天后的备份文件
#for i in "/backup/aliyun/backzip Volumes/BackStrong/backups/aliyun";do
##rm -rf  ${i}/`date  -v -5d +%F`.gzip
##rm -rf  ${i}/`date  -v -6d +%F`.gzip
##rm -rf  ${i}/`date  -v -7d +%F`.gzip
#
#done


rm -rf  ${backalizippath}/`date  -v -7d +%F`.gzip
rm -rf  ${backalizippath}/`date  -v -6d +%F`.gzip
rm -rf  ${backalizippath}/`date  -v -5d +%F`.gzip

rm -rf  ${backvolumes}/`date  -v -7d +%F`.gzip
rm -rf  ${backvolumes}/`date  -v -6d +%F`.gzip
rm -rf  ${backvolumes}/`date  -v -5d +%F`.gzip






