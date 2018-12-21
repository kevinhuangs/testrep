#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
fi
#自定义变量
SrcPath=dailyfile/send/
SrcFileName=estock_1_magrlt_${YESTODAY}.txt

DATA=${DATAPATH}/${SrcFileName}
echo ${DATA}
CTL=${CTLPATH}/INTOMAGRLTINFO.ctl
COUNTSQL=${SQLPATH}/CountMagRltInfoTemp.sql
TABLEMAME=IBS_ETAB_MAGRLT_TMP
SYNSQL=${SQLPATH}/SynMagRltInfo.sql
SHNAME=SynMagRltInfo.sh

#从前置拿取${TABLEMAME}表同步文件
/backup/batchdir/tft/tftclient -ddown -h15 -r${SrcPath}${SrcFileName} ${DATA}  -t8880

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
if [ -e "${DATA}" ]; then
	#insert tmp data
	${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
	#insert data when inserted all tmp data 
	fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
	
	if [ fileline1  -ne "0" ]; then
		echo "fileline1=${fileline1}" >>/backup/batchdir/log/tt_run.log
	else
		echo "NTEBANK-ERROR ${DATA}数据文件为空" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
	${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
	fileline2=`cat ${TABLEMAME}.txt`
	echo "fileline2=${fileline2}"
	if [ fileline1  -eq fileline2 ]; then
		${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
		echo "NTEBANK-SUCCESS 表${TABLEMAME}导入数据成功 ${SHNAME}" >>/backup/batchdir/log/tt_run.log
		exit 1
	else
		echo "NTEBANK-ERROR 表${TABLEMAME}导入数据失败 ${SHNAME}" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
else 
	echo "NTEBANK-ERROR 获取${TABLEMAME}表同步文件失败！" >>/backup/batchdir/log/tt_run.log
	exit 1
fi