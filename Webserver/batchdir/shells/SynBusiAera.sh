. /oracle/.profile
#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx/feeImages/ParaFile
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TZ=CST-8
TODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then TODAY=$1
fi
#自定义变量
echo TODAY=${TODAY}
DATANAME=T_EB_NPP_BUSIAERA_${TODAY}.txt
DATA=${DATAPATH}/T_EB_NPP_BUSIAERA_${TODAY}.txt
CTL=${CTLPATH}/INTOBUSIAERA.ctl
COUNTSQL=${SQLPATH}/CountBusiAeraTemp.sql
TABLEMAME=IBS_TAB_FEE_BUSIAERA_TMP
SYNSQL=${SQLPATH}/SynBusiAera.sql
SHNAME=SynBusiAera.sh

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
if [ -e "${DATA}" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
#insert data when inserted all  tmp data 
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
echo fileline1=${fileline1}
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
fileline2=`cat ${TABLEMAME}.txt`
echo fileline2=${fileline2}
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
echo "NTEBANK-SUCCESS 表${TABLEMAME}导入数据成功 ${SHNAME}" >>/backup/batchdir/log/fee.log
else
echo "NTEBANK-ERROR 表${TABLEMAME}导入数据异常 ${SHNAME}" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 没有获取到${DATA}同步文件！"
fi