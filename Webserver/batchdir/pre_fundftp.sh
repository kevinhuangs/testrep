#LANG=zh_CN.hp15CN  
DATAPATH=/backup/batchdir/syndata/  
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.122
FTPUSER=netbank 
FTPPWD=netbank  
FTPSERVPATH=/fund/backup/prdinfo/  
echo "==>获取日期为："$TODAY >> /backup/batchdir/log/fund.log
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $DATAPATH
cd $FTPSERVPATH
pwd
get 1_${TODAY}NewI.TXT
close
bye
!
cd $DATAPATH
if [ -s 1_${TODAY}NewI.TXT ] ; then
echo 0
else
echo 1
fi