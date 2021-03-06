#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
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
echo ${ORACLE_HOME}
echo ${HOME}
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTABCIF.ctl data=${DATAPATH}/D0310_${finalDate}_bdskh.txt silent=feedback

#move ibs_ptab_cif_tmp to ibs_etab_cif
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD} << @EOF@
execute CEBPKG.initcifdata
@EOF@