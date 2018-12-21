#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TODAY=`date +%Y%m%d`

#从前置拿取IB01同步文件
/backup/batchdir/tft/tftclient -ddown -h15 -rIBPS/protofile/ibps_${TODAY}_TL /backup/batchdir/anbmx/ibps_${TODAY}_TL.txt -t5555

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOIB01.ctl data=${DATAPATH}/ibps_${TODAY}_TL.txt silent=feedback
if [ -e "${DATAPATH}/ibps_${TODAY}_TL.txt" ]; then
fileline1=`echo "\n" >>${DATAPATH}/ibps_${TODAY}_TL.txt|sed /^[[:space:]]*$/d ${DATAPATH}/ibps_${TODAY}_TL.txt|wc -l`
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountIB01Temp.sql
fileline2=`cat ibs_etab_super_ac_temp.txt`
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/SynIB01.sql
else
echo "NTEBANK-ERROR 表IBS_ENT_SUPER_AC_TEMP导入数据失败 EntSynIB01.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取IB01表同步文件失败！"
fi