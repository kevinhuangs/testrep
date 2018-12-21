#核心理财产品代码表#
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
echo "==>获取文件日期为："$finalDate
TZ=CST-8

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
#如果数据文件存在则插入临时表
if [ -e "${DATAPATH}/D0310_${finalDate}_plcgd.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOROLLFROMCORE.ctl data=${DATAPATH}/D0310_${finalDate}_plcgd.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_plcgd.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_plcgd.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　select count( * ) coun from IBS_PTAB_ROLLFUND_TMP;
　　exit;
　　END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#如果文件行数等于临时表插入行数则更新核心理财产品代码表
if [ fileline1  -eq sqlline2 ]; then
echo "文件行数等于临时表插入行数"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_PTAB_ROLLFUND;
insert into ibs_ptab_rollfund
        (roll_name, roll_code, roll_time, fund_code, fund_name, min_amount, profit_begindate, profit_enddate, book_begindate, book_enddate, reserve_flag1, reserve_flag2, reserve_flag3, reserve_field1, reserve_field2, reserve_field3, reserve_field4, datetime, status)
  (
  select roll_name, roll_code, roll_time, fund_code, fund_name, min_amount, profit_begindate, profit_enddate, book_begindate, book_enddate, reserve_flag1, reserve_flag2, reserve_flag3, reserve_field1, reserve_field2, reserve_field3, reserve_field4, datetime, status from ibs_ptab_rollfund_tmp
  );
commit;
!
echo "IBS_PTAB_ROLLFUND导入成功"
else
echo "NTEBANK-ERROR 表IBS_PTAB_ROLLFUND导入数据失败 " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取D0310_${finalDate}_plcgd.txt表同步文件失败！"
fi