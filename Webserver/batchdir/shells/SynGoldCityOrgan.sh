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

echo "��ʼtft��ʵ����Ʒ��������ϵ�ļ�ͬ��"
${TFTCLIENT}/tftclient -ddown -h15 -rneedBak/sycnchannelspecfile/ProdSpecOrganRelToChannel_${YESTERDAY}.txt ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt -t9885
echo "��ʵ����Ʒ��������ϵ�ļ�ͬ�����"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo ${ORACLE_HOME}
echo ${HOME}
cd $DATAPATH
pwd
echo '��ʼ����ʵ����Ʒ��������ϵ�ļ�'
if [ -e "${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt" ]; then
#��ʼУ���ļ���ȷ��
echo "�ļ���ȡ�ɹ�����ʼУ���ļ���ȷ��"
SHOWSUM=`grep SumAmount ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|awk -F "[|][+][|]" '{print $2}'`
fileline1=`echo "\n" >>${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|wc -l`
#��һ����SumAmount 10,���Լ�һ
fileline1=`expr $fileline1 - 1`
echo " SumAmount   fileline"
echo " ---------   --------"
printf " %5s %10s\n" $SHOWSUM $fileline1
#�ļ���ȷ
if [ SHOWSUM  -eq fileline1 ]; then
echo "�ļ��б�ʾ������ʵ������������ļ���������ʼ������"
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOREALGOLDCityOrgan.ctl data=${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt silent=feedback
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_GOLDTAKECITYORG_TMP;
����exit;
����END`
echo " fileline   sqlline"
echo " --------   --------"
printf " %5s %9s\n" $fileline1 $sqlline2
if [ fileline1  -eq sqlline2 ]; then
echo "�ƽ���������ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb >/dev/null <<!
delete from IBS_PTAB_GOLDTAKE_CITYORGAN;
insert into IBS_PTAB_GOLDTAKE_CITYORGAN (GSP_PRONO,PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME) 
(select GSP_PRONO,PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME from IBS_PTAB_GOLDTAKECITYORG_TMP);
commit;
!
else
echo "ʵ����Ʒ��������ϵ�ļ�������������ʱ�������������������ʽ��"
fi
else 
echo "�ļ��б�ʾ������ʵ��������������ļ��쳣���������"
fi
else 
echo "NTEBANK-ERROR ��ȡʵ����Ʒ��������ϵ�ļ�ʧ�ܣ�"
fi
echo "����ʵ����Ʒ��������ϵ�ļ����\n"