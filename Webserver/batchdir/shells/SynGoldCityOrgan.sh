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
echo "传入的参数是" $1
YESTERDAY=$1
fi

echo "==>获取日期为："$YESTERDAY

echo "开始tft拿实物金产品规格机构关系文件同步"
${TFTCLIENT}/tftclient -ddown -h15 -rneedBak/sycnchannelspecfile/ProdSpecOrganRelToChannel_${YESTERDAY}.txt ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt -t9885
echo "拿实物金产品规格机构关系文件同步完成"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo ${ORACLE_HOME}
echo ${HOME}
cd $DATAPATH
pwd
echo '开始处理实物金产品规格机构关系文件'
if [ -e "${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt" ]; then
#开始校验文件正确性
echo "文件拿取成功，开始校验文件正确性"
SHOWSUM=`grep SumAmount ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|awk -F "[|][+][|]" '{print $2}'`
fileline1=`echo "\n" >>${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt|wc -l`
#第一行有SumAmount 10,所以减一
fileline1=`expr $fileline1 - 1`
echo " SumAmount   fileline"
echo " ---------   --------"
printf " %5s %10s\n" $SHOWSUM $fileline1
#文件正确
if [ SHOWSUM  -eq fileline1 ]; then
echo "文件中标示行数和实际行数相符，文件正常，开始导数据"
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOREALGOLDCityOrgan.ctl data=${DATAPATH}/ProdSpecOrganRelToChannel_${YESTERDAY}.txt silent=feedback
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from IBS_PTAB_GOLDTAKECITYORG_TMP;
　　exit;
　　END`
echo " fileline   sqlline"
echo " --------   --------"
printf " %5s %9s\n" $fileline1 $sqlline2
if [ fileline1  -eq sqlline2 ]; then
echo "黄金提货网点文件行数等于临时表插入行数"
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb >/dev/null <<!
delete from IBS_PTAB_GOLDTAKE_CITYORGAN;
insert into IBS_PTAB_GOLDTAKE_CITYORGAN (GSP_PRONO,PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME) 
(select GSP_PRONO,PARAENT_ORGAN_ID,PARAENT_ORGAN_NAME from IBS_PTAB_GOLDTAKECITYORG_TMP);
commit;
!
else
echo "实物金产品规格机构关系文件行数不等于临时表插入行数，不插入正式表！"
fi
else 
echo "文件中标示行数和实际行数不相符，文件异常，程序结束"
fi
else 
echo "NTEBANK-ERROR 获取实物金产品规格机构关系文件失败！"
fi
echo "处理实物金产品规格机构关系文件完成\n"