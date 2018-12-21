#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank

TZ=CST+16
finalDate=`date +%Y%m%d`
if [ "$1" != "" ]; then finalDate=$1
else i=1
fi
echo "==>获取文件日期为："$finalDate
TZ=CST-8


FTPSERVERIP="10.1.8.52"
FTPUSER="u0115"
FTPPASSWORD="u0115"
SERVERPATH="/dwetl/cebdata/"
TODAY=`sh /backup/batchdir/shells/data/addday.sh 0`

echo "==>ftp拿客户等级信息文件"
ftp -n ${FTPSERVERIP}<<!
user ${FTPUSER} ${FTPPASSWORD}
prompt
bin
lcd ${DATAPATH}
get i_ef_t04_cust_level_nb_${finalDate}_000_000.dat.ok i_ef_t04_cust_level_nb_${finalDate}_000_000.dat.ok
close
by
!

cd ${DATAPATH}
if [ -e i_ef_t04_cust_level_nb_${finalDate}_000_000.dat.ok ]; then
ftp -n ${FTPSERVERIP}<<!
user ${FTPUSER} ${FTPPASSWORD}
prompt
bin
lcd ${DATAPATH}
get i_ef_t04_cust_level_nb_${finalDate}_000_000.dat i_ef_t04_cust_level_nb_${finalDate}_000_000.dat
close
by
!


export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOPTABCIFLEVEL.ctl data=${DATAPATH}/i_ef_t04_cust_level_nb_${finalDate}_000_000.dat silent=feedback
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/UpdatePtabCifLevel.sql
else
echo "今日不存在文件"
fi