#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
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

#�Զ������
SrcPath=needBak/sycnchannelspecfile/
SrcFileName=ProdSpecPriceToChannel_${YESTERDAY}.txt

DATA=${DATAPATH}/${SrcFileName}
echo ${DATA}
CTL=${CTLPATH}/INTOREALGOLDPRICE.ctl
TABLEMAME=IBS_PTAB_GOLDSALEPRICE_TMP
SYNSQL=${SQLPATH}/SynRealGoldPrice.sql

echo "��ʼtft��ͬ��ʵ��������Ʒ��Ϣ�ļ�"
/backup/batchdir/tft/tftclient -ddown -h15 -r${SrcPath}${SrcFileName} ${DATA} -t9885

echo "��ͬ��ʵ��������Ʒ��Ϣ�ļ����"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo '��ʼ����ͬ��ʵ��������Ʒ��Ϣ�ļ�'
if [ -e "${DATA}" ]; then
#��ʼУ���ļ���ȷ��
echo "�ļ���ȡ�ɹ�����ʼУ���ļ���ȷ��"
SHOWSUM=`grep SumAmount ${DATA}|awk -F "[|][+][|]" '{print $2}'`
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
#��һ����SumAmount 10,���Լ�һ
fileline1=`expr $fileline1 - 1`
echo " SumAmount   fileline"
echo " ---------   --------"
printf " %5s %10s\n" $SHOWSUM $fileline1
#�ļ���ȷ
if [ SHOWSUM  -eq fileline1 ]; then
echo "�ļ��б�ʾ������ʵ������������ļ���������ʼ������"
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback skip=1
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_GOLDSALEPRICE_TMP;
����exit;
����END`
echo " fileline   sqlline"
echo " --------   --------"
printf " %5s %9s\n" $fileline1 $sqlline2
if [ fileline1  -eq sqlline2 ]; then
echo "ͬ��ʵ��������Ʒ��Ϣ�ļ�����������ʱ���������"
sqlplus bankdb/bankdb @${SYNSQL}
else
echo "ͬ��ʵ��������Ʒ��Ϣ�ļ�������������ʱ�������������������ʽ��"
fi
else 
echo "�ļ��б�ʾ������ʵ��������������ļ��쳣���������"
fi
else 
echo "NTEBANK-ERROR ��ȡͬ��ʵ��������Ʒ��Ϣ�ļ�ʧ�ܣ�"
fi
echo "����ͬ��ʵ��������Ʒ��Ϣ�ļ����\n"