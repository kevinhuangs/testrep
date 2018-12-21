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
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCOUNTRY.ctl data=${DATAPATH}/D0310_${finalDate}_pxlgj.txt silent=feedback
if [ -e "${DATAPATH}/D0310_${finalDate}_pxlgj.txt" ]; then
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_pxlgj.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_pxlgj.txt|wc -l`
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/CountCountryTemp.sql
fileline2=`cat ibs_ptab_countryinfo_tmp.txt`
if [ fileline1  -eq fileline2 ]; then
${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SQLPATH}/SynCountryInfo.sql
else
echo "NTEBANK-ERROR ��IBS_PTAB_COUNTRYINFO_TEMP��������ʧ�� SynCountryInfo.sh" >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_pxlgj.txt��ͬ���ļ�ʧ�ܣ�"
fi