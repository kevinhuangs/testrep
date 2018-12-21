TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
fi
. /oracle/.profile
#LANG=zh_CN.hp15CN
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank

#自定义变量
DATANAME=qhgs_list_${YESTODAY}.txt
DATA=/backup/batchdir/anbmx/qhgs_list_${YESTODAY}.txt
CTL=/backup/batchdir/ctrls/INTOFUTURESCOMPANYINFO.ctl
TABLEMAME=IBS_PTAB_FUTURESCOMPANY_TMP
SYNSQL=/backup/batchdir/shells/SynFuturesCompanyInfo.sql


#从前置拿取${TABLEMAME}表同步文件
/backup/batchdir/tft/tftclient -ddown -h15 -r${DATANAME} /backup/batchdir/anbmx/${DATANAME} -t2260

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
VALUE=`sqlplus -silent /nolog <<END
　　conn bankdb/bankdb
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　SELECT COUNT( * ) COUN FROM IBS_PTAB_FUTURESCOMPANY_TMP;
　　exit;
　　END`
fileline2=`expr $VALUE`
echo fileline2=${fileline2}

if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
echo "NTEBANK-SUCCESS 表${TABLEMAME}导入数据成功SynFuturesCompanyInfo.sh" 
else
echo "NTEBANK-ERROR 表${TABLEMAME}导入数据失败SynFuturesCompanyInfo.sh" 
fi
else 
echo "NTEBANK-ERROR 获取${DATA}同步文件失败！"
fi