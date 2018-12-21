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


export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCounyAliasCodeDZ.ctl data=${DATAPATH}/D0310_${finalDate}_pgbdz.txt silent=feedback
if [ -e "${DATAPATH}/D0310_${finalDate}_pgbdz.txt" ]; then
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pgbdz.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pgbdz.txt|wc -l`
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountCounyAliasCodeDZTemp.sql
fileline2=`cat ibs_ptab_counyaliascodedz_tmp.txt`
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/SynCounyAliasCodeDZ.sql
else
echo "NTEBANK-ERROR 表IBS_PTAB_COUNYALIASCODEDZ_TMP导入数据失败 SynCounyAliasCodeDZ.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取${DATAPATH}/D0310_${finalDate}_pgbdz.txt表同步文件失败！"
fi