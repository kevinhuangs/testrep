#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls   #换环境时需要修改
DATAPATH=/backup/batchdir/syndata  #换环境时需要修改
SQLPATH=/backup/batchdir/shells  #换环境时需要修改
DBUSER=bankdb  #换环境时需要修改
DBPWD=bankdb  #换环境时需要修改
DBSID=newebank  #换环境时需要修改newebank
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.122  #换环境时需要修改
FTPUSER=netbank  #换环境时需要修改
FTPPWD=netbank  #换环境时需要修改
FTPSERVPATH=/fund/backup/prdinfo/  #换环境时需要修改
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
get PrdWorkDate${TODAY}.txt
close
bye
!

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0  #换环境时需要修改
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
if [ -e "${DATAPATH}/PrdWorkDate${TODAY}.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPrdtWdInfo.ctl data=${DATAPATH}/PrdWorkDate${TODAY}.txt silent=feedback #插入临时表 sql 1 数据文件1 
fileline1=`echo "\n" >>${DATAPATH}/PrdWorkDate${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/PrdWorkDate${TODAY}.txt|wc -l` #文件中的行数
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountPrdtWdInfo.sql #查出临时表中的记录条数，并记在文件中 sql 2
fileline2=`cat ibs_ptab_prdct_workdayinfo_tmp.txt` #临时表中的记录条数
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/PrdtWdInfo.sql #插入或者更新表 sql 3
else
echo "NTEBANK-ERROR 表IBS_PTAB_PRDCT_WORKDAYINFO_TMP导入数据失败 PrdWorkDateInfo.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取工作日信息表同步文件失败！"
fi