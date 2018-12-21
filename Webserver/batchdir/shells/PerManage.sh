#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb

TZ=CST+16
finalDate=`date +%Y%m%d`
if [ "$1" != "" ]; then finalDate=$1
else i=1
fi
echo "==>获取文件日期为："$finalDate
TZ=CST-8

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}

#处理落地队列数据，将超过一天的落地数据从IBS_PTAB_FALLQUEUE表移到IBS_PTAB_FALLQUEUEJNL表中
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/moveFallQueue.sql

