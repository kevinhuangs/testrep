FTPSERVIP=10.1.3.1
FTPUSER=ftpwy
FTPPWD=wyftp

#FTPSERVPATH=/home/bea/app/ftpdata/ftpwy/
FTPSERVPATH=/
RESULTPATH=/backup/batchdir/anbmx/points

TZ=CST-8
TODAY=`date +%Y%m%d`

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
export TFTCFG=/backup/batchdir/tft/tft.conf
export TFT_CLIENT_PRINTDIR=
export RUNLOG=/backup/batchdir/tft
DATAPATH=/backup/batchdir/anbmx/points
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank

readySuffix=.ready
useSuffix=.Z
zipSuffix=.zip
okSuffix=.ok
fileName=PresentsFile
imageName=PresentsImages_000

echo "****************积分换礼品--同步数据开始***********************" >>/backup/batchdir/log/PointsGiftSynAction.log
cd ${RESULTPATH}/images
rm ${RESULTPATH}/images/*
cd ${RESULTPATH}
rm ${RESULTPATH}/*
echo "****************删除本地文件完成***********************" >>/backup/batchdir/log/PointsGiftSynAction.log
#Ftp to the remote ftp server and get the file
echo "==>ftp到文件所在服务器"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $RESULTPATH
cd $FTPSERVPATH
pwd
dir ${fileName}*${readySuffix}
mget ${fileName}*${readySuffix}
cd $FTPSERVPATHA
pwd
dir ${fileName}*${useSuffix}
mget ${fileName}*${useSuffix}
pwd
lcd $RESULTPATH/images
dir ${imageName}*${readySuffix}
mget ${imageName}*${readySuffix}
pwd
dir ${imageName}*${zipSuffix}
mget ${imageName}*${zipSuffix}
close
bye
!
echo "******************拿文件完成************************" >>/backup/batchdir/log/PointsGiftSynAction.log

cd ${RESULTPATH}
ls -rt ${fileName}* >${RESULTPATH}/fileName.txt
echo "*****************生成fileName.txt文件完成***********" >>/backup/batchdir/log/PointsGiftSynAction.log

cd ${RESULTPATH}
for file in `ls $fileName*$readySuffix`
do
DATA=`echo ${file} | sed s/${readySuffix}/${useSuffix}/g`
compress -d  ${DATA}
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
prompt
bin
cd $FTPSERVPATH
pwd
rename $file `echo $file | sed s/$readySuffix/${okSuffix}/g`
ls `echo $file | sed s/$readySuffix/${okSuffix}/g`
pwd
rename $DATA `echo $DATA | sed s/$useSuffix/$useSuffix${okSuffix}/g`
ls `echo $DATA | sed s/$useSuffix/$useSuffix${okSuffix}/g`
close
bye
!
done
echo "*********解压和rename远程服务器上$fileName文件完成*********" >>/backup/batchdir/log/PointsGiftSynAction.log

cd $RESULTPATH/images
for file in `ls $imageName*$readySuffix`
do
DATA=`echo $file | sed s/$readySuffix/${zipSuffix}/g`
/oracle/product/10.2.0/bin/unzip -o ${DATA}
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
prompt
bin
cd $FTPSERVPATH
pwd
rename $file `echo $file | sed s/$readySuffix/${okSuffix}/g`
ls `echo $file | sed s/$readySuffix/${okSuffix}/g`
rename $DATA `echo $DATA | sed s/${zipSuffix}/${zipSuffix}${okSuffix}/g`
ls `echo $DATA | sed s/${zipSuffix}/${zipSuffix}${okSuffix}/g`
close
bye
!
done
echo "********解压和rename远程服务器上$imageName文件完成********" >>/backup/batchdir/log/PointsGiftSynAction.log


echo "****************积分换礼品--同步数据开始***********************" >>/backup/batchdir/log/PointsGiftSynAction.log
cd $RESULTPATH/images/
countImages=`ls |wc -l`
if [ countImages  -eq 0 ]; then
echo "本次没有图片"   #>>/backup/batchdir/log/PointsGiftSynAction.log
else
rm /app/ceb/sharestore/per/images/points/*
cp $RESULTPATH/images/* /app/ceb/sharestore/per/images/points/
chmod 777 /app/ceb/sharestore/per/images/points/*.*
fi
echo "****************完成****************" >>/backup/batchdir/log/PointsGiftSynAction.log
