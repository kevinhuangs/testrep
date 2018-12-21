#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
TFTCLIENT=/backup/batchdir/tft
DBUSER=bankdb
DBPWD=bankdb
TZ=CST+16
YESTERDAY=`date +%Y%m%d`
TZ=CST-8

if [ "$1" != "" ]; then
echo "����Ĳ�����" $1
YESTERDAY=$1
fi

echo "==>��ȡ����Ϊ��"$YESTERDAY

echo "��ʼtft�ûƽ�ϵͳ����ļ�"
${TFTCLIENT}/tftclient -ddown -h15 -rneedBak/TakeOrganFile/TakeOrganToNBank_${YESTERDAY}.txt ${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt -t9885
echo "�ûƽ�ϵͳ��������ļ����"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo ${ORACLE_HOME}
echo ${HOME}
cd $DATAPATH
pwd
echo '��ʼ����ƽ���������ļ�'
if [ -e "${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt" ]; then
#��ʼУ���ļ���ȷ��
echo "�ļ���ȡ�ɹ�����ʼУ���ļ���ȷ��"
SHOWSUM=`grep SumAmount ${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt|awk -F "[|]" '{print $2}'`
fileline1=`echo "\n" >>${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt|wc -l`
#��һ����SumAmount 10,���Լ�һ
fileline1=`expr $fileline1 - 1`
echo " SumAmount   fileline"
echo " ---------   --------"
printf " %5s %10s\n" $SHOWSUM $fileline1
#�ļ���ȷ
if [ SHOWSUM  -eq fileline1 ]; then
echo "�ļ��б�ʾ������ʵ������������ļ���������ʼ������"
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOGOLDTAKEORGAN.ctl data=${DATAPATH}/TakeOrganToNBank_${YESTERDAY}.txt silent=feedback
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_GOLDTAKE_ORGAN_TMP;
����exit;
����END`
echo " fileline   sqlline"
echo " --------   --------"
printf " %5s %9s\n" $fileline1 $sqlline2
if [ fileline1  -eq sqlline2 ]; then
echo "�ƽ���������ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb >/dev/null <<!
delete from IBS_PTAB_GOLDTAKE_ORGAN;
insert into IBS_PTAB_GOLDTAKE_ORGAN (PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME,ORGAN_ID,ORGAN_NAME,ORGAN_ADDR,ORGAN_POSTCDOE,ORGAN_CON_NAME,ORGAN_CON_TEL,ORGAN_CON_PHONE,ORGAN_CON_EMAIL) 
(select PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME,ORGAN_ID,ORGAN_NAME,ORGAN_ADDR,ORGAN_POSTCDOE,ORGAN_CON_NAME,ORGAN_CON_TEL,ORGAN_CON_PHONE,ORGAN_CON_EMAIL from IBS_PTAB_GOLDTAKE_ORGAN_TMP);
commit;
!
else
echo "�ƽ���������ļ�������������ʱ�������������������ʽ��"
fi
else 
echo "�ļ��б�ʾ������ʵ��������������ļ��쳣���������"
fi
else 
echo "NTEBANK-ERROR ��ȡ�ƽ���������ļ�ʧ�ܣ�"
fi
echo "����ƽ���������ļ����\n"