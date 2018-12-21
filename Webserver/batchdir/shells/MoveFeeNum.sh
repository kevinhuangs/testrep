#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank

#自定义变量
DATANAME=ibs_ptab_feenum.tmp
DATA=${SQLPATH}/ibs_ptab_feenum.tmp
SYNSQL=${SQLPATH}/feenum.sql

#环境变量
export TFTCFG=/backup/batchdir/tft/tft.conf
export TFT_CLIENT_PRINTDIR=
export RUNLOG=/backup/batchdir/tft
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#插入临时表
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
#insert data when inserted all  tmp data 
if [ -e "${DATA}" ]; then
#通过前置透转上传文件成功
/backup/batchdir/tft/tftclient -dup -h15 -r733/snd/ParaFile/${DATANAME} /backup/batchdir/anbmx/${DATANAME} -t5555
echo "NTEBANK-ERROR 数据迁移成功"
else 
echo "NTEBANK-ERROR 数据迁移失败"
fi



echo "...points..."
FTPSERVIP=10.1.3.1
FTPUSER=ftpwy
FTPPWD=wyftp
FTPSERVPATH=/home/bea/app/ftpdata/ftpwy/
lcd /backup/batchdir/anbmx/points
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
cd $FTPSERVPATH
pwd
mget *.ok
close
bye
!

for file in `ls *.Z.ok`
do
rm $file
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
cd $FTPSERVPATH
pwd
rename $file `echo $file | sed s/.Z.ok/.Z/g`
close
bye
!
done

for file in `ls *.zip.ok`
do
rm $file
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
cd $FTPSERVPATH
pwd
rename $file `echo $file | sed s/.zip.ok/.zip/g`
close
bye
!
done

for file in `ls *.ok`
do
rm $file
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
cd $FTPSERVPATH
pwd
rename $file `echo $file | sed s/.ok/.ready/g`
close
bye
!
done
