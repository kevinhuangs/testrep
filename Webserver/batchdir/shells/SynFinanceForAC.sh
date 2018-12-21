#核心理财产品代码表#
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
echo "==>获取文件日期为："$finalDate
TZ=CST-8

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
#如果数据文件存在则插入临时表
if [ -e "${DATAPATH}/D0310_${finalDate}_plcfb.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFINANCEFORAC.ctl data=${DATAPATH}/D0310_${finalDate}_plcfb.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_plcfb.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_plcfb.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from IBS_ETAB_FINANCEFORAC_TMP;
　　exit;
　　END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#如果文件行数等于临时表插入行数则更新理财产品附表
if [ fileline1  -eq sqlline2 ]; then
echo "文件行数等于临时表插入行数"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
delete from IBS_ETAB_FINANCEFORAC;
INSERT INTO IBS_ETAB_FINANCEFORAC
  (YIGYDM, FEIMLB, SHFOBZ, SHFEBZ, SFFSFS, SFKZBZ, BEIY01, ZYJE01, ZYJE02, ZYJE03, ZYJE04, BILIII, LILVLL, SHIJLL, YQBJLX, ZHNGJJ, HUOBDH, HUO1DH, WEIHRQ, YOUXRQ, ZHIDRQ, BEIYRQ, YEWUDH, DFYWDH, SXSYWH, GSCLPH, ZHANGH, KEHUZH, BEIY40, CANSHY, KEHZWM, DAYXX1, SHJNCH, JILUZT)
  (
  SELECT YIGYDM, FEIMLB, SHFOBZ, SHFEBZ, SFFSFS, SFKZBZ, BEIY01, ZYJE01, ZYJE02, ZYJE03, ZYJE04, BILIII, LILVLL, SHIJLL, YQBJLX, ZHNGJJ, HUOBDH, HUO1DH, WEIHRQ, YOUXRQ, ZHIDRQ, BEIYRQ, YEWUDH, DFYWDH, SXSYWH, GSCLPH, ZHANGH, KEHUZH, BEIY40, CANSHY, KEHZWM, DAYXX1, SHJNCH, JILUZT FROM IBS_ETAB_FINANCEFORAC_TMP
    WHERE DAYXX1 IS NOT NULL
  );
commit;
!
echo "IBS_ETAB_FINANCEFORAC导入成功"
else
echo "NTEBANK-ERROR 表IBS_ETAB_FINANCEFORAC导入数据失败 " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR 获取D0310_${finalDate}_plcfb.txt表同步文件失败！"
fi