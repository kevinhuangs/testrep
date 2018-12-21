#设置相关变量：时间参数TranDate、文件名称FileName、文件路径等
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

######################银联卡bin同步开始##############################
#判断系统时间是否为银联生成文件的时间
TranDateDay=`echo ${TranDate} | cut -c7-8`
if [ $TranDateDay -ne 10 ];then
 echo "只有每个月11号的时候有文件${FileName}! " >>/backup/batchdir/log/tt_run.log
 exit 1
fi

#获取卡bin文件
/backup/batchdir/tft/tftclient -ddown -h15 -rcups/b0303000/${TranDate}/IN${TranDate}01YWBIN ${DATA} -t6633

#银联卡bin文件存在与否
if ! test -f "${DATA}" 
	 then
    echo "NTEBANK-ERROR 获取${FileName}同步文件失败!" >>/backup/batchdir/log/tt_run.log
   exit 1
fi

#插入数据库临时表
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback


#比较文件中数据行数与临时表中已插入的数据行数，相等则将临时表数据导入正式表
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
fileline1=`expr $fileline1 - 1`  #因银联卡bin文件中最后多了一行total行，所以要减一
echo "fileline1:${fileline1}"  >>/backup/batchdir/log/tt_run.log 
VALUE=`sqlplus -silent /nolog <<END
　　conn bankdb/bankdb
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　SELECT COUNT( * ) COUN FROM IBS_PTAB_UNIONPAY_BIN_TMP;
　　exit;
　　END`
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
echo "${TableName}  导入成功!!"  >>/backup/batchdir/log/tt_run.log
else
echo "NTEBANK-ERROR 表${TableName}导入数据失败 " >>/backup/batchdir/log/tt_run.log
fi  