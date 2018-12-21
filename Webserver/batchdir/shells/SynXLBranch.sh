#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TZ=CST+16
YESTODAY=`date +%Y%m%d`
#自定义变量
DATA=${DATAPATH}/D0310_${YESTODAY}_pxlwd.txt
CTL=${CTLPATH}/INTOXLBRANCH.ctl
COUNTSQL=${SQLPATH}/CountXLBranchTemp.sql
TABLEMAME=IBS_PTAB_XLBRANCH_TMP
SYNSQL=${SQLPATH}/SynXLBranch.sql
SHNAME=SynXLBranch.sh



export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
#insert data when inserted all  tmp data 
if [ -e "${DATA}" ]; then
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
echo fileline1=${fileline1}
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
fileline2=`cat ${TABLEMAME}.txt`
echo fileline2=${fileline2}
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
else
echo "NTEBANK-ERROR 表${TABLEMAME}导入数据失败 ${SHNAME}" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取IB01表同步文件失败！"
fi