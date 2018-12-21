FTPSERVIP=10.1.201.5
FTPUSER=ftpuser
FTPPWD=ftpuser
FTPSERVPATH=/qynj/qynjdatabakup/net_bank/BatchKH
#FTPSERVIP=
#FTPUSER=
#FTPPWD=
#FTPSERVPATH=
echo "初始化完成"
#Get the date of compare bill

TODAY=`date +%Y%m%d`
TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
else i=1
fi
echo "==>生成日期为："$YESTODAY
TZ=CST-8
#Notax main directory

#CIFJOINHOME=
CIFJOINHOME=/backup/batchdir/annuitydata/$YESTODAY/
AnnuityHOME=/backup/batchdir/annuitydata/
#PATH=.:$PATH$:/app/bea/jdk142_05/bin:
PATH=.:$PATH:/opt/java6/bin

SQLPATH=/backup/batchdir/shells
currentpath="/backup/batchdir/shells"
DBSID=newebank
cd ${AnnuityHOME}
mkdir ${YESTODAY}/
cd   ${YESTODAY}
mkdir khqr/
sqlplus bankdb/bankdb @${SQLPATH}/geneAnnuityResult.sql
mv  ANNUNITY.txt    ${CIFJOINHOME}khqr/0000${YESTODAY}khqr.txt 
print   "0000"${YESTODAY}"khqr.txt" > ${CIFJOINHOME}khqr/${YESTODAY}khqr.txt 

echo "==>生成tar包"
cd $CIFJOINHOME
tar cvf khqr.tar khqr/*

echo "==>ftp到文件所送服务器"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
cd $FTPSERVPATH
mkdir $YESTODAY/
cd $YESTODAY/
pwd
put  khqr.tar
close
bye
!

