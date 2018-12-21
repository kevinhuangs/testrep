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
echo "传入的参数是" $1
YESTERDAY=$1
fi

echo "==>获取日期为："$YESTERDAY

#自定义变量
SrcPath=needBak/sycnchannelspecfile/
SrcFileName=ProdSpecPriceToChannel_${YESTERDAY}.txt

DATA=${DATAPATH}/${SrcFileName}
echo ${DATA}
CTL=${CTLPATH}/INTOREALGOLDPRICE.ctl
TABLEMAME=IBS_PTAB_GOLDSALEPRICE_TMP
SYNSQL=${SQLPATH}/SynRealGoldPrice.sql

echo "开始tft拿同步实物贵金属产品信息文件"
/backup/batchdir/tft/tftclient -ddown -h15 -r${SrcPath}${SrcFileName} ${DATA} -t9885

echo "拿同步实物贵金属产品信息文件完成"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo '开始处理同步实物贵金属产品信息文件'
if [ -e "${DATA}" ]; then
#开始校验文件正确性
echo "文件拿取成功，开始校验文件正确性"
SHOWSUM=`grep SumAmount ${DATA}|awk -F "[|][+][|]" '{print $2}'`
fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
#第一行有SumAmount 10,所以减一
fileline1=`expr $fileline1 - 1`
echo " SumAmount   fileline"
echo " ---------   --------"
printf " %5s %10s\n" $SHOWSUM $fileline1
#文件正确
if [ SHOWSUM  -eq fileline1 ]; then
echo "文件中标示行数和实际行数相符，文件正常，开始导数据"
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback skip=1
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from IBS_PTAB_GOLDSALEPRICE_TMP;
　　exit;
　　END`
echo " fileline   sqlline"
echo " --------   --------"
printf " %5s %9s\n" $fileline1 $sqlline2
if [ fileline1  -eq sqlline2 ]; then
echo "同步实物贵金属产品信息文件行数等于临时表插入行数"
sqlplus bankdb/bankdb @${SYNSQL}
else
echo "同步实物贵金属产品信息文件行数不等于临时表插入行数，不插入正式表！"
fi
else 
echo "文件中标示行数和实际行数不相符，文件异常，程序结束"
fi
else 
echo "NTEBANK-ERROR 获取同步实物贵金属产品信息文件失败！"
fi
echo "处理同步实物贵金属产品信息文件完成\n"