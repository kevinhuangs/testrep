#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/syndata
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.122
FTPUSER=netbank
FTPPWD=netbank
FTPSERVPATH=/fund/backup/prdinfo/
if [ "$1" != "" ]; then TODAY=$1
fi
echo "==>��ȡ����Ϊ��"$TODAY

echo "==>ftp���ļ����ڷ�����"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $DATAPATH
cd $FTPSERVPATH
pwd
dir 2_PrdWorkDate${TODAY}.txt
dir 4_PrdWorkDate${TODAY}.txt
get 2_PrdWorkDate${TODAY}.txt
get 4_PrdWorkDate${TODAY}.txt
close
bye
!
echo "��ATM��VTM�������ļ����"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
echo '��ʼ����ATM�������ļ�'
if [ -e "${DATAPATH}/2_PrdWorkDate${TODAY}.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPrdtWdInfo_2.ctl data=${DATAPATH}/2_PrdWorkDate${TODAY}.txt silent=feedback
fileline1=`echo "\n" >>${DATAPATH}/2_PrdWorkDate${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/2_PrdWorkDate${TODAY}.txt|wc -l`
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_PRDCT_WORKDAY_TMP_CH2;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

if [ fileline1  -eq sqlline2 ]; then
echo "ATM�������ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb >/dev/null <<!
delete from IBS_PTAB_PRDCT_WORKDAY_CH2;
insert into IBS_PTAB_PRDCT_WORKDAY_CH2
(PRODUCT_CODE,PRODUCT_WORKDAY) 
(select PRODUCT_CODE,PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAY_TMP_CH2 a where 
not exists (select b.PRODUCT_CODE,b.PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAY_CH2 b where a.PRODUCT_CODE=b.PRODUCT_CODE));
commit;
!
echo "ATM���������ݵ���ɹ�"
else
echo "ATM�������ļ�������������ʱ�����������"
fi
else 
echo "NTEBANK-ERROR ��ȡATM�������ļ�ʧ�ܣ�"
fi
echo "����ATM�������ļ����\n"
#######################################################################3
echo '��ʼ����VTM�������ļ�'
if [ -e "${DATAPATH}/4_PrdWorkDate${TODAY}.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPrdtWdInfo_4.ctl data=${DATAPATH}/4_PrdWorkDate${TODAY}.txt silent=feedback
fileline1=`echo "\n" >>${DATAPATH}/4_PrdWorkDate${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/4_PrdWorkDate${TODAY}.txt|wc -l`
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_PRDCT_WORKDAY_TMP_CH4;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

if [ fileline1  -eq sqlline2 ]; then
echo "VTM�������ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb >/dev/null <<!
delete from IBS_PTAB_PRDCT_WORKDAY_CH4;
insert into IBS_PTAB_PRDCT_WORKDAY_CH4
(PRODUCT_CODE,PRODUCT_WORKDAY) 
(select PRODUCT_CODE,PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAY_TMP_CH4 a where 
not exists (select b.PRODUCT_CODE,b.PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAY_CH4 b where a.PRODUCT_CODE=b.PRODUCT_CODE));
commit;
!
echo "VTM���������ݵ���ɹ�"
else
echo "VTM�������ļ�������������ʱ�����������"
fi
else 
echo "NTEBANK-ERROR ��ȡVTM�������ļ�ʧ�ܣ�"
fi
echo "����VTM�������ļ����\n"