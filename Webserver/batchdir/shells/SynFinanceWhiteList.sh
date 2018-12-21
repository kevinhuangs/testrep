#������ư�������#
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
fi
echo "==>��ȡ�ļ�����Ϊ��"$finalDate
TZ=CST-8
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#��������ļ������������ư������ܱ�
if [ -e "${DATAPATH}/D0310_${finalDate}_blcbm.txt" ]; then
#insert tmp data
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCOREWHITETMP.ctl data=${DATAPATH}/D0310_${finalDate}_blcbm.txt silent=feedback
#ͳ�ư������ļ�������
fileline1=`echo "\n" >>${DATAPATH}/D0310_${finalDate}_blcbm.txt|sed /^[[:space:]]*$/d ${DATAPATH}/D0310_${finalDate}_blcbm.txt|wc -l`
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off numwidth 10
����select count( * ) coun from ibs_btab_corewhite_tmp;
����exit;
����END`
echo " fileline    sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2
#����ļ�����������ʱ�������������º�����ư�������
if [ fileline1  -eq sqlline2 ]; then
echo "�ļ��������ں�����ư�������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_btab_corewhite;
insert into ibs_btab_corewhite
  (fund_code, direct_flag, end_date, cif_no, cif_type, ac_no)
  (select fund_code, direct_flag, end_date, cif_no, cif_type, ac_no from ibs_btab_corewhite_tmp
  );
commit;
!
echo "��IBS_BTAB_COREWHITE�������ݳɹ���"

#ͬ���Թ���ư�����
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} ����ʼ�Թ���ư�������SynEntFinanceWhiteList.sh"
sh /backup/batchdir/shells/SynEntFinanceWhiteList.sh ${finalDate}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} ��������Թ���ư�������SynEntFinanceWhiteList.sh"

#ͬ����˽��ư�����
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} ����ʼ��˽��ư�������SynPerFinanceWhiteList.sh"
sh /backup/batchdir/shells/SynPerFinanceWhiteList.sh ${finalDate}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} ���������˽��ư�������SynPerFinanceWhiteList.sh"

else
#����ļ�������������ʱ�����������ֻ���º�����Ʋ�Ʒ�����IBS_PTAB_FINANCECODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_ptab_financecode
   set direct_flag = '0';

update ibs_ptab_financecode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_corewhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "��IBS_BTAB_COREWHITE��������ʧ�ܣ���������ǰ���� "
fi
else
#����ļ���������ֻ���º�����Ʋ�Ʒ�����IBS_PTAB_FINANCECODE  
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_ptab_financecode
   set direct_flag = '0';

update ibs_ptab_financecode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_corewhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "��ȡD0310_${finalDate}_blcbm.txt�ļ�ʧ�ܣ���������ǰ����!"
fi