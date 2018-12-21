. /oracle/.profile
#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
TZ=CST+16
YESTODAY=`date +%Y%m%d`
TZ=CST-8
if [ $# -gt 0 ]; then YESTODAY=$1
fi
echo $YESTODAY
#自定义变量
DATA1=${DATAPATH}/D0310_${YESTODAY}_vyktd.txt
DATA2=${DATAPATH}/D0310_${YESTODAY}_vggpz.txt
DATA3=${DATAPATH}/D0310_${YESTODAY}_vhybt.txt
DATA4=${DATAPATH}/D0310_${YESTODAY}_vdybt.txt

CTL1=${CTLPATH}/INTOACDELETECARD.ctl
CTL2=${CTLPATH}/INTOACDELETECERT.ctl
CTL3=${CTLPATH}/INTOACDELETECURRENT.ctl
CTL4=${CTLPATH}/INTOACDELETEFIX.ctl
TABLEMAME=IBS_PTAB_ACDELETE
SYNSQL=${SQLPATH}/INTOACDELETE.sql
DELSQL=${SQLPATH}/DELETEPTABAC.sql
COUNTSQL=${SQLPATH}/COUNTACDELETE.sql
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#insert tmp data
if [ -e "${DATA1}" -a -e "${DATA2}" -a -e "${DATA3}" -a -e "${DATA4}" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL1} data=${DATA1} silent=feedback
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL2} data=${DATA2} silent=feedback
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL3} data=${DATA3} silent=feedback
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL4} data=${DATA4} silent=feedback

#insert data when inserted all  tmp data 
fileline1=`echo "\n" >>${DATA1}|sed /^[[:space:]]*$/d ${DATA1}|wc -l`
fileline2=`echo "\n" >>${DATA2}|sed /^[[:space:]]*$/d ${DATA2}|wc -l`
fileline3=`echo "\n" >>${DATA3}|sed /^[[:space:]]*$/d ${DATA3}|wc -l`
fileline4=`echo "\n" >>${DATA4}|sed /^[[:space:]]*$/d ${DATA4}|wc -l`

echo fileline1=${fileline1}
echo fileline2=${fileline2}
echo fileline3=${fileline3}
echo fileline4=${fileline4}
fileline=`expr ${fileline1} + ${fileline2} + ${fileline3} + ${fileline4}`
cd ${SQLPATH}
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL} 
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
sqlline=`cat ${SQLPATH}/${TABLEMAME}.txt`
echo sqlline=${sqlline}
if [ fileline -eq sqlline ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${DELSQL} 
echo "NTEBANK-SUCCEE ac表删除数据成功 "
else
echo "NTEBANK-ERROR 数据文件导入中间表失败 " 
fi
else 
echo "NTEBANK-ERROR 获取${TABLEMAME}同步文件失败！"
fi