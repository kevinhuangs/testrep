#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/syndata/
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.57
FTPUSER=ebankftp
FTPPWD=ebankftp
FTPSERVPATH=/bta/output/E_bank
if [ "$1" != "" ]; then TODAY=$1
fi
echo "==>获取日期为："$TODAY
echo "初始化完成"

echo "==>ftp到文件所在服务器"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $DATAPATH
cd $FTPSERVPATH
pwd
get FUND_${TODAY}.txt
close
bye
!

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPrdRate.ctl data=${DATAPATH}/FUND_${TODAY}.txt silent=feedback
if [ -e "${DATAPATH}/FUND_${TODAY}.txt" ]; then
fileline1=`echo "\n" >>${DATAPATH}/FUND_${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/FUND_${TODAY}.txt|wc -l`
echo fileline1=${fileline1}
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountPrdRate.sql
fileline2=`cat ibs_ptab_prdrate_tmp.txt`
echo fileline2=${fileline2}
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/PrdRate.sql
else
echo "NTEBANK-ERROR 表ibs_etab_profitrate_tmp导入数据失败 PrdRate.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取收益率表同步文件失败！"
fi