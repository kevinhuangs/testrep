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

if [ -e "${DATAPATH}/D0310_${finalDate}_pzfhh.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPTABPZFHH.ctl data=${DATAPATH}/D0310_${finalDate}_pzfhh.txt silent=feedback
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pzfhh.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pzfhh.txt|wc -l`
sqlplus bankdb/bankdb @${SQLPATH}/CountIbsPtabPzfhh.sql
fileline2=`cat ibs_ptab_pzfhh_temp.txt`
if [ fileline1  -eq fileline2 ]; then
sqlplus bankdb/bankdb @${SQLPATH}/SynPzfhh.sql
sqlplus bankdb/bankdb @${SQLPATH}/UpdateBankNoSuperfqhhao.sql
else
echo "NTEBANK-ERROR 表IBS_PTAB_PZFHH导入数据失败InPtabPzfhh.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取跨行互联清算行号表同步文件失败！"
fi
