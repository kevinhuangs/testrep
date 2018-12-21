#������Ʋ�Ʒ�����#
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
if [ -e "${DATAPATH}/D0310_${finalDate}_blced.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFINANCEAMT.ctl data=${DATAPATH}/D0310_${finalDate}_blced.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_blced.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_blced.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_ETAB_FINANCEAMT_TMP;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#����ļ�����������ʱ����������������ƶ����Ϣ��
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_ETAB_FINANCEAMT;
INSERT INTO IBS_ETAB_FINANCEAMT
  (ORGAN, FUND_CODE, COMMIT_AMT, PAYE_AMT, SALES_AMT, NOW_MAYAMT, TIME, STATUS, JNL_NUMBER)
  (SELECT ORGAN, FUND_CODE, COMMIT_AMT, PAYE_AMT, SALES_AMT, NOW_MAYAMT, TIME, STATUS, JNL_NUMBER FROM IBS_ETAB_FINANCEAMT_TMP);
commit;
!
echo "IBS_ETAB_FINANCEAMT����ɹ�"
else
echo "NTEBANK-ERROR ��IBS_ETAB_FINANCEAMT��������ʧ�� " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_blced.txt��ͬ���ļ�ʧ�ܣ�"
fi