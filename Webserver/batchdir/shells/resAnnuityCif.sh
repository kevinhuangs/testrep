FTPSERVIP=10.1.201.5
FTPUSER=ftpuser
FTPPWD=ftpuser
FTPSERVPATH=/qynj/qynjdatabakup/net_bank/BatchKH
#FTPSERVIP=
#FTPUSER=
#FTPPWD=
#FTPSERVPATH=
echo "��ʼ�����"
#Get the date of compare bill

TODAY=`date +%Y%m%d`
TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
else i=1
fi
echo "==>��������Ϊ��"$YESTODAY
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

echo "==>����tar��"
cd $CIFJOINHOME
tar cvf khqr.tar khqr/*

echo "==>ftp���ļ����ͷ�����"
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

