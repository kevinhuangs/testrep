#���������Ȩ�ޱ�#
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
echo "==>��ȡ�ļ�����Ϊ��"$finalDate
TZ=CST-8

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
#��������ļ������������ʱ�� pbwsj.txt
if [ -e "${DATAPATH}/D0310_${finalDate}_pbwsj.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOORGANAUTH.ctl data=${DATAPATH}/D0310_${finalDate}_pbwsj.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pbwsj.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pbwsj.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_SWIFT_ORGANAUTH_TMP;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

#����ļ�����������ʱ��������������SWIFT�����
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_PTAB_SWIFT_ORGANAUTH;
insert into IBS_PTAB_SWIFT_ORGANAUTH 
(ORAGN_ID, ORGAN_SUPERIOR, CURRENCY, RECEIVE_FLAG, SEND_FLAG, BANKSEND_ENDTIME, BANKAPPLY_ENDTIME, ORGNAPPLY_ENDTIME,
THROUGH_BEGINTIME,HEADBANK_ENDTIME,CURRENCY_FLAG,VALUE_FALG,SETTLEACCOUNT_ENDTIME,DIRECT_SIGNS,BAK_ACCOUNT,BAK_DATE,
MESSAGE_STARTCONTROL,TIME_STAMP,RECORD_STATUS
)
(select ORAGN_ID, ORGAN_SUPERIOR, CURRENCY, RECEIVE_FLAG, SEND_FLAG, BANKSEND_ENDTIME, BANKAPPLY_ENDTIME, ORGNAPPLY_ENDTIME,
THROUGH_BEGINTIME,HEADBANK_ENDTIME,CURRENCY_FLAG,VALUE_FALG,SETTLEACCOUNT_ENDTIME,DIRECT_SIGNS,BAK_ACCOUNT,BAK_DATE,
MESSAGE_STARTCONTROL,TIME_STAMP,RECORD_STATUS from IBS_PTAB_SWIFT_ORGANAUTH_TMP);
commit;
!
echo "IBS_PTAB_SWIFT_ORGANAUTH����ɹ�"
else
echo "NTEBANK-ERROR ��IBS_PTAB_SWIFT_ORGANAUTH��������ʧ�� "
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_pbwsj.txt�ļ�ʧ�ܣ�"
fi