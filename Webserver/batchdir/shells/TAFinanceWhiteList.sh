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
echo "==>获取日期为："$TODAY

echo "==>ftp到文件所在服务器"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $DATAPATH
cd $FTPSERVPATH
pwd
dir FUND_WhiteList_${TODAY}.txt
get FUND_WhiteList_${TODAY}.txt
close
bye
!
echo "拿TA系统理财白名单文件完成"

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

echo '开始处理TA系统理财白名单文件'
if [ -e "${DATAPATH}/FUND_WhiteList_${TODAY}.txt" ]; then
#开始校验文件正确性
num=`head -1 ${DATAPATH}/FUND_WhiteList_${TODAY}.txt`
fileline1=`echo "\n" >>${DATAPATH}/FUND_WhiteList_${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/FUND_WhiteList_${TODAY}.txt|wc -l`
#TA系统理财白名单文件第一行为记录数，所以要减一
fileline1=`expr $fileline1 - 1`
echo "    num      fileline"
echo " ---------   --------"
printf " %5s %10s\n" $num $fileline1

#如果文件记录数与记录条数一致
if [ num  -eq fileline1 ]; then
echo "文件中标示行数和实际行数相符，文件正常，开始导数据"
#insert tmp data
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFUNDWHITETMP.ctl data=${DATAPATH}/FUND_WhiteList_${TODAY}.txt  silent=feedback
#比较文件中数据行数与临时表中已插入的数据行数是否相等
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from ibs_btab_fundwhite_tmp;
　　exit;
　　END`
echo "   fileline  sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

#如果TA系统理财白名单文件等于临时表插入行数则更新TA理财白名单表
if [ fileline1  -eq sqlline2 ]; then
echo "TA系统理财白名单文件行数等于TA理财白名单临时表插入行数"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_btab_fundwhite;
insert into ibs_btab_fundwhite
  (cif_no,cif_type,fund_code,end_date,ac_no)
  (select cif_no,cif_type,fund_code,end_date,ac_no from ibs_btab_fundwhite_tmp
  );
commit;
!
echo "表IBS_BTAB_FUNDWHITE导入数据成功！"

#对公理财白名单文件
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} 处理开始TA系统对公理财白名单：TAEntFinanceWhiteList.sh"
sh /backup/batchdir/shells/TAEntFinanceWhiteList.sh ${TODAY}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} 处理结束TA系统对公理财白名单：TAEntFinanceWhiteList.sh"

#对私理财白名单文件
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} 处理开始TA系统对私理财白名单：TAPerFinanceWhiteList.sh"
sh /backup/batchdir/shells/TAPerFinanceWhiteList.sh ${TODAY}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} 处理结束TA系统对私理财白名单：TAPerFinanceWhiteList.sh"

else
#如果文件行数不等于临时表插入行数则只更新TA理财产品代码表IBS_ETAB_FUNDCODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "表IBS_BTAB_FUNDWHITE导入数据失败，保留导入前数据!"
fi
else
#文件中标示行数和实际行数不相符，文件异常
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "文件中标示行数和实际行数不相符，文件异常，程序结束，保留导入前数据!"
fi
else
#如果文件不存在则只更新TA理财产品代码表IBS_ETAB_FUNDCODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "获取FUND_WhiteList_${TODAY}.txt同步文件失败，保留导入前数据!"
fi
echo '处理TA系统理财白名单文件结束'