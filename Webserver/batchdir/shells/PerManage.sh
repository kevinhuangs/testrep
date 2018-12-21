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
echo "==>��ȡ�ļ�����Ϊ��"$finalDate
TZ=CST-8

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}

#������ض������ݣ�������һ���������ݴ�IBS_PTAB_FALLQUEUE���Ƶ�IBS_PTAB_FALLQUEUEJNL����
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/moveFallQueue.sql

