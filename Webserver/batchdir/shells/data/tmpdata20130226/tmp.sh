yesterday=$1
currentpath="/backup/batchdir/shells/data"
FTPSERVERIP="10.1.8.221"
FTPUSER="dwetl"
FTPPASSWORD="dwetl"
echo "==>ftp文件到数据仓库服务器"
cd /backup/batchdir/shells/data/tmpdata20130226/
rm *.tar
rm *.dat
if [ ${yesterday}  -eq '20130226' ]; then
sqlplus bankdb/bankdb @tmp20130226.sql
tar -cvf edw_data_nb_20130226_000_tmp.tar *.dat
fi
if [ ${yesterday}  -eq '20130227' ]; then
sqlplus bankdb/bankdb @tmp20130227.sql
tar -cvf edw_data_nb_20130227_000_tmp.tar *.dat
fi
if [ ${yesterday}  -eq '20130228' ]; then
sqlplus bankdb/bankdb @tmp20130228.sql
tar -cvf edw_data_nb_20130228_000_tmp.tar *.dat
fi
if [ ${yesterday}  -eq '20130301' ]; then
sqlplus bankdb/bankdb @tmp20130301.sql
tar -cvf edw_data_nb_20130301_000_tmp.tar *.dat
fi
if [ ${yesterday}  -eq '20130302' ]; then
sqlplus bankdb/bankdb @tmp20130302.sql
tar -cvf edw_data_nb_20130302_000_tmp.tar *.dat
fi
if [ ${yesterday}  -eq '20130303' ]; then
sqlplus bankdb/bankdb @tmp20130303.sql
tar -cvf edw_data_nb_20130303_000_tmp.tar *.dat
fi

ftp -n ${FTPSERVERIP}<<!
user ${FTPUSER} ${FTPPASSWORD}
prompt
bin
cd /dwdata/backup/tmp
lcd  /backup/batchdir/shells/data/tmpdata20130226
mput *.tar 
close
by
!
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} 生成个人网银日志临时文件edw_data_nb_${yesterday}_000_tmp.tar开始 *****" >>/backup/batchdir/shells/data/day.log
ls *.dat >>/backup/batchdir/shells/data/day.log
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} 生成个人网银日志临时文件edw_data_nb_${yesterday}_000_tmp.tar完成 *****" >>/backup/batchdir/shells/data/day.log
