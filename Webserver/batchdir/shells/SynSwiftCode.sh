#������SWIFT�����#
#LANG=zh_CN.hp15CN
#������ַ u0000/u0000 10.1.8.52 /home/gg/SWM_BICCODE_20130915.TXT
#��ȷ������ 1.ȡ�ļ������� 2 ȡ�ļ����ļ���
FTPSERVIP=10.1.8.52
FTPSERVPATH=/home/gg
FTPUSER=u0000
FTPPWD=u0000
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
echo "ftp���ļ���ʼ"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
as
lcd $DATAPATH
cd $FTPSERVPATH
pwd
get SWM_BICCODE_${finalDate}.TXT
close
bye
!
echo "ftp���ļ�����"
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
#insert tmp data
#��������ļ������������ʱ�� SWM_BICCODE_YYYYMMDD.TXT
if [ -e "${DATAPATH}/SWM_BICCODE_${finalDate}.TXT" ]; then
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOSWIFTCODE.ctl data=${DATAPATH}/SWM_BICCODE_${finalDate}.TXT silent=feedback

#count filenum
fileline1=`echo "\n" >>${DATAPATH}/SWM_BICCODE_${finalDate}.TXT|sed /^[[:space:]]*$/d ${DATAPATH}/SWM_BICCODE_${finalDate}.TXT|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from IBS_PTAB_SWIFTCODE_TMP;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

#����ļ�����������ʱ��������������SWIFT�����
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ�����������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
insert into IBS_PTAB_SWIFTCODE a (SWIFCODE,SUBSWIFCODE,BANKNAME,COUNTRY,ADDRESS1,ADDRESS2,ADDRESS3,ADDRESS4,CITY)
(select SWIFCODE,substr(SWIFCODE,5,2), BANKNAME, COUNTRY, ADDRESS1,ADDRESS2, ADDRESS3, ADDRESS4, CITY from IBS_PTAB_SWIFTCODE_tmp b 
	where not exists (select '' from IBS_PTAB_SWIFTCODE c where b.swifcode=c.swifcode)
);
update (select a.SWIFCODE a1,a.BANKNAME a2,a.COUNTRY a3,a.ADDRESS1 a4,a.ADDRESS2 a5,a.ADDRESS3 a6,a.ADDRESS4 a7,a.CITY a8,
               b.SWIFCODE b1,b.BANKNAME b2,b.COUNTRY b3,b.ADDRESS1 b4,b.ADDRESS2 b5,b.ADDRESS3 b6,b.ADDRESS4 b7,b.CITY b8
               from IBS_PTAB_SWIFTCODE a,IBS_PTAB_SWIFTCODE_TMP b
               WHERE a.swifcode=b.swifcode
        ) set a1=b1,a2=b2,a3=b3,a4=b4,a5=b5,a6=b6,a7=b7,a8=b8;
delete from IBS_PTAB_SWIFTCODE a where not exists (select '' from IBS_PTAB_SWIFTCODE_TMP b where a.swifcode=b.swifcode);
#77069 added by pengxiaomei 
update IBS_PTAB_SWIFTCODE  set SORT_NO='1'  where SWIFCODE like '%XXX';
commit;
!
echo "IBS_PTAB_SWIFTCODE����ɹ�"
else
echo "NTEBANK-ERROR ��IBS_PTAB_SWIFTCODE��������ʧ�� "
fi
else 
echo "NTEBANK-ERROR ��ȡSWM_BICCODE_${finalDate}.TXT�ļ�ʧ�ܣ�"
fi