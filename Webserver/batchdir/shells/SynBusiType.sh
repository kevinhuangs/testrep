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
#�Զ������
DATANAME=T_EB_NPP_COMMON_PARAMETER_${TODAY}.txt
DATA=${DATAPATH}/T_EB_NPP_COMMON_PARAMETER_${TODAY}.txt
CTL=${CTLPATH}/INTOBUSITYPE.ctl
COUNTSQL=${SQLPATH}/CountBusiTypeTemp.sql
TABLEMAME=IBS_TAB_FEE_PARAMETER_TMP
SYNSQL=${SQLPATH}/SynBusiType.sql
SHNAME=SynBusiType.sh

#��ǰ����ȡ${TABLEMAME}��ͬ���ļ�
#/backup/batchdir/tft/tftclient -ddown -h36 -r733/snd/ParaFile/${DATANAME} /backup/batchdir/anbmx/${DATANAME}

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
echo "NTEBANK-SUCCESS ��${TABLEMAME}�������ݳɹ� ${SHNAME}" >>/backup/batchdir/log/fee.log
else
echo "NTEBANK-ERROR ��${TABLEMAME}���������쳣 ${SHNAME}" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR û�л�ȡ��${DATA}ͬ���ļ���"
fi