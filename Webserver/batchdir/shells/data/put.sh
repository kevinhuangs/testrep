LocalFile=$1
ServerFile=$2
currentpath="/backup/batchdir/shells/data"
FTPSERVERIP="10.1.8.221"
FTPUSER="dwetl"
FTPPASSWORD="dwetl"
echo "==>ftp�ļ������ݲֿ������"
ftp -n ${FTPSERVERIP}<<!
user ${FTPUSER} ${FTPPASSWORD}
prompt
bin
put ${LocalFile} "/dwdata/cebdata/`sh ${currentpath}/addday.sh 0`/nb/"${ServerFile}
close
by
!
