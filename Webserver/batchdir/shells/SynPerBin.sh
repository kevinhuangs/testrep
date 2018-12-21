#������ر�����ʱ�����TranDate���ļ�����FileName���ļ�·����
TZ=CST+16
TranDate=`date +%Y%m%d`
d1ate=`date`
if [ -n "$1" ];then
   TranDate=$1
fi

FileName=IN${TranDate}01YWBIN.txt  
TableName=IBS_PTAB_UNIONPAY_BIN
DBUSER=bankdb
DBPWD=bankdb
CTL=/backup/batchdir/ctrls/INTOPERBIN.ctl
DATA=/backup/batchdir/anbmx/${FileName}

######################������binͬ����ʼ##############################
#�ж�ϵͳʱ���Ƿ�Ϊ���������ļ���ʱ��
TranDateDay=`echo ${TranDate} | cut -c7-8`
if [ $TranDateDay -ne 10 ];then
 echo "ֻ��ÿ����11�ŵ�ʱ�����ļ�${FileName}! " >>/backup/batchdir/log/tt_run.log
 exit 1
fi

#��ȡ��bin�ļ�
/backup/batchdir/tft/tftclient -ddown -h15 -rcups/b0303000/${TranDate}/IN${TranDate}01YWBIN ${DATA} -t6633

#������bin�ļ��������
if ! test -f "${DATA}" 
	 then
    echo "NTEBANK-ERROR ��ȡ${FileName}ͬ���ļ�ʧ��!" >>/backup/batchdir/log/tt_run.log
   exit 1
fi

#�������ݿ���ʱ��
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback


#�Ƚ��ļ���������������ʱ�����Ѳ���������������������ʱ�����ݵ�����ʽ��
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
fileline1=`expr $fileline1 - 1`  #��������bin�ļ���������һ��total�У�����Ҫ��һ
echo "fileline1:${fileline1}"  >>/backup/batchdir/log/tt_run.log 
VALUE=`sqlplus -silent /nolog <<END
����conn bankdb/bankdb
����set pagesize 0 feedback off verify off heading off echo off numwidth 10
����SELECT COUNT( * ) COUN FROM IBS_PTAB_UNIONPAY_BIN_TMP;
����exit;
����END`
sqlline2=`expr $VALUE`
echo "sqlline2:${sqlline2}" >>/backup/batchdir/log/tt_run.log
if [ fileline1  -eq sqlline2 ]; then
sqlplus bankdb/bankdb  >>/backup/batchdir/log/tt_run.log <<!
DELETE FROM IBS_PTAB_UNIONPAY_BIN;
INSERT INTO IBS_PTAB_UNIONPAY_BIN
       (ISSUER_CODE, ISSUER_NAME, CARDNO_LEN, BIN_NUM, CUPLOGO_FLAG, DEBITCREDIT_FLAG, ADDDELETE_STAT, ADDITIONAL_DATA)
(SELECT ISSUER_CODE, ISSUER_NAME, CARDNO_LEN, BIN_NUM, CUPLOGO_FLAG, DEBITCREDIT_FLAG, ADDDELETE_STAT, ADDITIONAL_DATA FROM IBS_PTAB_UNIONPAY_BIN_TMP);
COMMIT;
!
echo "${TableName}  ����ɹ�!!"  >>/backup/batchdir/log/tt_run.log
else
echo "NTEBANK-ERROR ��${TableName}��������ʧ�� " >>/backup/batchdir/log/tt_run.log
fi  