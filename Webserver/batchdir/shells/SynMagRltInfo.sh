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
#�Զ������
SrcPath=dailyfile/send/
SrcFileName=estock_1_magrlt_${YESTODAY}.txt

DATA=${DATAPATH}/${SrcFileName}
echo ${DATA}
CTL=${CTLPATH}/INTOMAGRLTINFO.ctl
COUNTSQL=${SQLPATH}/CountMagRltInfoTemp.sql
TABLEMAME=IBS_ETAB_MAGRLT_TMP
SYNSQL=${SQLPATH}/SynMagRltInfo.sql
SHNAME=SynMagRltInfo.sh

#��ǰ����ȡ${TABLEMAME}��ͬ���ļ�
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
		echo "NTEBANK-ERROR ${DATA}�����ļ�Ϊ��" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
	${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
	fileline2=`cat ${TABLEMAME}.txt`
	echo "fileline2=${fileline2}"
	if [ fileline1  -eq fileline2 ]; then
		${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
		echo "NTEBANK-SUCCESS ��${TABLEMAME}�������ݳɹ� ${SHNAME}" >>/backup/batchdir/log/tt_run.log
		exit 1
	else
		echo "NTEBANK-ERROR ��${TABLEMAME}��������ʧ�� ${SHNAME}" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
else 
	echo "NTEBANK-ERROR ��ȡ${TABLEMAME}��ͬ���ļ�ʧ�ܣ�" >>/backup/batchdir/log/tt_run.log
	exit 1
fi