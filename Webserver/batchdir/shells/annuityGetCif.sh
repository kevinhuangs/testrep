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
echo "==>��ȡ����Ϊ��"$YESTODAY
TZ=CST-8
#Notax main directory

#CIFJOINHOME=
CIFJOINHOME=/backup/batchdir/annuitydata/
#PATH=.:$PATH$:/app/bea/jdk142_05/bin:
PATH=.:$PATH:/opt/java6/bin

echo "==>ftp���ļ����ڷ�����"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $CIFJOINHOME
cd $FTPSERVPATH
cd $YESTODAY/
pwd
get  khsq.tar
close
bye
!

#Uncompress and untar to local direct
cd $CIFJOINHOME
echo "==>ѹ���ļ�����Ŀ¼"
pwd
tar xvf khsq.tar

ls khsq

echo "==>�����ʱ�ļ�"
pwd
rm -r khsq.tar
cd ..
