#������־
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
mv /backup/batchdir/log/tt_run.log /backup/batchdir/log/tt_run.log.${logDay}

#echo "`date` Start batch tt  !!!!!!!!!!!!!" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB����ʼ(����������) pre_tt*****" >>/backup/batchdir/log/tt_run.log

#Set the FTP server IP address ,user,password
FTPSERVIP=10.1.8.52
FTPUSER=u0310
FTPPWD=u0310
FTPSERVPATH=/home/ww/0310
FTPSERVPATHA=/home/gg
RESULTPATH=/backup/batchdir/anbmx

#Get the date of compare bill
TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
else i=1
fi
echo "==>��ȡ��������Ϊ��"$YESTODAY >>/backup/batchdir/log/tt_run.log
TZ=CST-8
#Notax main directory

NOTAXHOME=/backup/batchdir

#Ftp to the remote ftp server and get the file
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(ͬ���ļ�pre_tt.sh)*****" >>/backup/batchdir/log/tt_run.log

COUNT=0
while [ ${COUNT} -lt 6 ]
do
COUNT=$((COUNT+1))
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $NOTAXHOME/tmpzip
cd $FTPSERVPATH
pwd
dir w${YESTODAY}_0002.tar.Z
get w${YESTODAY}_0002.tar.Z
cd $FTPSERVPATHA
pwd
dir g${YESTODAY}_0001.tar.Z
get g${YESTODAY}_0001.tar.Z
close
bye
!
cd $NOTAXHOME/tmpzip
#if test -s w${YESTODAY}_0002.tar.Z -a -s g${YESTODAY}_0001.tar.Z  ; then
if [ -s w${YESTODAY}_0002.tar.Z ] && [ -s g${YESTODAY}_0001.tar.Z ] ; then
echo 0
exit
fi
sleep 300
done
echo 1