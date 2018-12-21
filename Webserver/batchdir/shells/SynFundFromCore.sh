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
if [ -e "${DATAPATH}/D0310_${finalDate}_plccp.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFUNDFROMCORE.ctl data=${DATAPATH}/D0310_${finalDate}_plccp.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_plccp.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_plccp.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_FINANCECODE_TMP;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

#����ļ�����������ʱ�������������º�����Ʋ�Ʒ�����
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_PTAB_FINANCECODE;
insert into ibs_ptab_financecode
  (fund_code, finance_unioncode, finance_unionname, finance_rollcode, finance_rolltime, fund_name, finance_type, finance_kind, finance_rate, finance_limitdate, finance_currency, cash_flag, finance_profit_currency, first_minamount, add_minamount, first_bookminamount, booked_modeamount, booked_minamount, sales_begindate, sales_enddate, profit_enddate, profit_begindate, finance_mode, finance_pauseflag, finance_risklevel, finance_investdirection, finance_fitciftype, sales_channel, finance_selltarget, finance_longest_enddate, finance_period,amt_mgmtlevel)
  (
select fund_code, finance_unioncode, finance_unionname, finance_rollcode, finance_rolltime, fund_name, finance_type, finance_kind, finance_rate, finance_limitdate, finance_currency, cash_flag, finance_profit_currency, first_minamount, add_minamount, first_bookminamount, booked_modeamount, booked_minamount, sales_begindate, sales_enddate, profit_enddate, profit_begindate, finance_mode, finance_pauseflag, finance_risklevel, finance_investdirection, finance_fitciftype, sales_channel, finance_selltarget, finance_longest_enddate, finance_period,amt_mgmtlevel from ibs_ptab_financecode_tmp
);
commit;
!
echo "IBS_PTAB_FINANCECODE����ɹ�"
else
echo "NTEBANK-ERROR ��IBS_PTAB_FINANCECODE��������ʧ�� " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_plccp.txt��ͬ���ļ�ʧ�ܣ�"
fi