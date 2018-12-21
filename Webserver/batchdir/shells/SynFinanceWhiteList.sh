#核心理财白名单表#
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
fi
echo "==>获取文件日期为："$finalDate
TZ=CST-8
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#如果数据文件存在则插入理财白名单总表
if [ -e "${DATAPATH}/D0310_${finalDate}_blcbm.txt" ]; then
#insert tmp data
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCOREWHITETMP.ctl data=${DATAPATH}/D0310_${finalDate}_blcbm.txt silent=feedback
#统计白名单文件的行数
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_blcbm.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_blcbm.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　select count( * ) coun from ibs_btab_corewhite_tmp;
　　exit;
　　END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#如果文件行数等于临时表插入行数则更新核心理财白名单表
if [ fileline1  -eq sqlline2 ]; then
echo "文件行数等于核心理财白名单临时表插入行数"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_btab_corewhite;
insert into ibs_btab_corewhite
  (fund_code, direct_flag, end_date, cif_no, cif_type, ac_no)
  (select fund_code, direct_flag, end_date, cif_no, cif_type, ac_no from ibs_btab_corewhite_tmp
  );
commit;
!
echo "表IBS_BTAB_COREWHITE导入数据成功！"

#同步对公理财白名单
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} 处理开始对公理财白名单：SynEntFinanceWhiteList.sh"
sh /backup/batchdir/shells/SynEntFinanceWhiteList.sh ${finalDate}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} 处理结束对公理财白名单：SynEntFinanceWhiteList.sh"

#同步对私理财白名单
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} 处理开始对私理财白名单：SynPerFinanceWhiteList.sh"
sh /backup/batchdir/shells/SynPerFinanceWhiteList.sh ${finalDate}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} 处理结束对私理财白名单：SynPerFinanceWhiteList.sh"

else
#如果文件行数不等于临时表插入行数则只更新核心理财产品代码表IBS_PTAB_FINANCECODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_ptab_financecode
   set direct_flag = '0';

update ibs_ptab_financecode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_corewhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "表IBS_BTAB_COREWHITE导入数据失败，保留导入前数据 "
fi
else
#如果文件不存在则只更新核心理财产品代码表IBS_PTAB_FINANCECODE  
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_ptab_financecode
   set direct_flag = '0';

update ibs_ptab_financecode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_corewhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "获取D0310_${finalDate}_blcbm.txt文件失败，保留导入前数据!"
fi