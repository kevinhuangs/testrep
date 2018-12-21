#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TZ=CST+16
YESTODAY=`date +%Y%m%d`
#�Զ������
DATA=${DATAPATH}/estock_1_enterpinfo_${YESTODAY}.txt
echo ${DATA}
CTL=${CTLPATH}/INTOENTERPINFO.ctl
COUNTSQL=${SQLPATH}/CountEnterpInfoTemp.sql
TABLEMAME=IBS_TAB_ESTOCK_ENTERPINFO_TMP
SYNSQL=${SQLPATH}/SynEnterpInfo.sql
SHNAME=SynEnterpInfo.sh

#��ǰ����ȡ${TABLEMAME}��ͬ���ļ�
/backup/batchdir/tft/tftclient -ddown -h15 -rdailyfile/send/estock_1_enterpinfo_${YESTODAY}.txt /backup/batchdir/anbmx/estock_1_enterpinfo_${YESTODAY}.txt  -t8880

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
if [ -e "${DATA}" ]; then
	#insert tmp data
	${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
	#insert data when inserted all tmp data 
	fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
	echo fileline1=${fileline1}
	${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
	fileline2=`cat ${TABLEMAME}.txt`
	echo fileline2=${fileline2}
	if [ fileline1  -eq fileline2 ]; then
		${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
	else
	echo "NTEBANK-ERROR ��${TABLEMAME}��������ʧ�� ${SHNAME}" >>/backup/batchdir/log/tt_run.log
	fi
else 
	echo "NTEBANK-ERROR ��ȡ${TABLEMAME}��ͬ���ļ�ʧ�ܣ�"
fi