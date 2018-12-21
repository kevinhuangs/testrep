LocalFile=$1
RemoteFile=$2
currentpath="/backup/batchdir/shells"
FTPSERVERIP="10.1.41.40"
FTPUSER="ftpuser"
FTPPASSWORD="ftpuser"
ftp -n ${FTPSERVERIP}<<!
user ${FTPUSER} ${FTPPASSWORD}
prompt
bin
put ${LocalFile} "/app/epay/data/batch/ppmgmt/"${RemoteFile}
close
by
!
