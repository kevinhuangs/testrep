#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls   #������ʱ��Ҫ�޸�
DATAPATH=/backup/batchdir/syndata  #������ʱ��Ҫ�޸�
SQLPATH=/backup/batchdir/shells  #������ʱ��Ҫ�޸�
DBUSER=bankdb  #������ʱ��Ҫ�޸�
DBPWD=bankdb  #������ʱ��Ҫ�޸�
DBSID=newebank  #������ʱ��Ҫ�޸�newebank
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.122  #������ʱ��Ҫ�޸�
FTPUSER=netbank  #������ʱ��Ҫ�޸�
FTPPWD=netbank  #������ʱ��Ҫ�޸�
FTPSERVPATH=/fund/backup/prdinfo/  #������ʱ��Ҫ�޸�
if [ "$1" != "" ]; then TODAY=$1
fi
echo "==>��ȡ����Ϊ��"$TODAY
echo "��ʼ�����"

echo "==>ftp���ļ����ڷ�����"
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
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0  #������ʱ��Ҫ�޸�
#insert tmp data
echo ${ORACLE_HOME}
echo ${HOME}
if [ -e "${DATAPATH}/PrdWorkDate${TODAY}.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INPrdtWdInfo.ctl data=${DATAPATH}/PrdWorkDate${TODAY}.txt silent=feedback #������ʱ�� sql 1 �����ļ�1 
fileline1=`echo "\n" >>${DATAPATH}/PrdWorkDate${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/PrdWorkDate${TODAY}.txt|wc -l` #�ļ��е�����
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountPrdtWdInfo.sql #�����ʱ���еļ�¼�������������ļ��� sql 2
fileline2=`cat ibs_ptab_prdct_workdayinfo_tmp.txt` #��ʱ���еļ�¼����
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/PrdtWdInfo.sql #������߸��±� sql 3
else
echo "NTEBANK-ERROR ��IBS_PTAB_PRDCT_WORKDAYINFO_TMP��������ʧ�� PrdWorkDateInfo.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡ��������Ϣ��ͬ���ļ�ʧ�ܣ�"
fi