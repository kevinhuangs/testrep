#����������ձ�ͬ��#
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
#��������ļ������������ʱ��
if [ -e "${DATAPATH}/D0310_${finalDate}_pdqdz.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOORGANAREAREF.ctl data=${DATAPATH}/D0310_${finalDate}_pdqdz.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pdqdz.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pdqdz.txt|wc -l`
echo "fileline1is:${fileline1}"
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off numwidth 10
����select count( * ) coun from IBS_TAB_ORGANAREAREF_TMP;
����exit;
����END`
echo "sqlline2is:${sqlline2}"
#����ļ�����������ʱ�������������»���������ձ�
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_TAB_ORGANAREAREF;
commit;
!
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
insert into IBS_TAB_ORGANAREAREF select * from IBS_TAB_ORGANAREAREF_TMP;
commit;
!
else
echo "NTEBANK-ERROR ��IBS_TAB_ORGANAREAREF��������ʧ�� " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_pdqdz.txt��ͬ���ļ�ʧ�ܣ�"
fi