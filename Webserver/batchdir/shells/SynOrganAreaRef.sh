#机构区域对照表同步#
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
if [ -e "${DATAPATH}/D0310_${finalDate}_pdqdz.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOORGANAREAREF.ctl data=${DATAPATH}/D0310_${finalDate}_pdqdz.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pdqdz.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pdqdz.txt|wc -l`
echo "fileline1is:${fileline1}"
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　select count( * ) coun from IBS_TAB_ORGANAREAREF_TMP;
　　exit;
　　END`
echo "sqlline2is:${sqlline2}"
#如果文件行数等于临时表插入行数则更新机构区域对照表
if [ fileline1  -eq sqlline2 ]; then
echo "文件行数等于临时表插入行数"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_TAB_ORGANAREAREF;
commit;
!
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
insert into IBS_TAB_ORGANAREAREF select * from IBS_TAB_ORGANAREAREF_TMP;
commit;
!
else
echo "NTEBANK-ERROR 表IBS_TAB_ORGANAREAREF导入数据失败 " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取D0310_${finalDate}_pdqdz.txt表同步文件失败！"
fi