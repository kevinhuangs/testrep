#������Ʋ�Ʒ�����#
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
#��������ļ������������ʱ��
if [ -e "${DATAPATH}/D0310_${finalDate}_plcfb.txt" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFINANCEFORAC.ctl data=${DATAPATH}/D0310_${finalDate}_plcfb.txt silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_plcfb.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_plcfb.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_ETAB_FINANCEFORAC_TMP;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#����ļ�����������ʱ����������������Ʋ�Ʒ����
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
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
echo "IBS_ETAB_FINANCEFORAC����ɹ�"
else
echo "NTEBANK-ERROR ��IBS_ETAB_FINANCEFORAC��������ʧ�� " >>/backup/batchdir/log/tt_run.log
fi
else 
echo "NTEBANK-ERROR ��ȡD0310_${finalDate}_plcfb.txt��ͬ���ļ�ʧ�ܣ�"
fi