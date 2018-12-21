#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb

TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
fi
#�Զ������
SrcPath=cyberBank/custrole/
SrcFileName=SCFP_ROLE_${YESTODAY}.txt

DATA=${DATAPATH}/${SrcFileName}
echo ${DATA}
CTL=${CTLPATH}/INTOETABSCFTMP.ctl
COUNTSQL=${SQLPATH}/CountEtabScfpTmp.sql
TABLEMAME=IBS_ETAB_SCFP_TMP
SYNSQL=${SQLPATH}/SupplyChain.sql
SHNAME=SupplyChain.sh

#�ӹ�Ӧ��ƽ̨��ȡ${TABLEMAME}��ͬ���ļ�
/backup/batchdir/tft/tftclient -ddown -h15 -r${SrcPath}${SrcFileName} ${DATA}  -t2820 

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
if [ -e "${DATA}" ]; then
	#insert tmp data
	${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
	echo "NTEBANK-SUCCESS ��${TABLEMAME}�������ݳɹ� ${SHNAME} ${YESTODAY}"
	#insert data when inserted all tmp data 
	fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
	
	if [ fileline1  -ne "0" ]; then
		echo "fileline1=${fileline1}" >>/backup/batchdir/log/tt_run.log
	else
		echo "NTEBANK-ERROR ${DATA}�����ļ�Ϊ��" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
	${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD} @${COUNTSQL}
	fileline2=`cat ${TABLEMAME}.txt`
	echo "fileline2=${fileline2}"
	if [ fileline1  -eq fileline2 ]; then
		${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD} @${SYNSQL}
		echo "NTEBANK-SUCCESS ��IBS_ETAB_CIF�޸����ݳɹ� ${SHNAME} ${YESTODAY}" >>/backup/batchdir/log/tt_run.log
		exit 1
	else
		echo "NTEBANK-ERROR ��${TABLEMAME}��������ʧ�� ${SHNAME} ${YESTODAY}" >>/backup/batchdir/log/tt_run.log
		exit 1
	fi
else 
	echo "NTEBANK-ERROR ��ȡ${TABLEMAME}��ͬ���ļ�ʧ�ܣ�${YESTODAY}" >>/backup/batchdir/log/tt_run.log
	exit 1
fi