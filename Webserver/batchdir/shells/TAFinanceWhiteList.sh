#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/syndata
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
TODAY=`date +%Y%m%d`
FTPSERVIP=10.1.8.122
FTPUSER=netbank
FTPPWD=netbank
FTPSERVPATH=/fund/backup/prdinfo/
if [ "$1" != "" ]; then TODAY=$1
fi
echo "==>��ȡ����Ϊ��"$TODAY

echo "==>ftp���ļ����ڷ�����"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $DATAPATH
cd $FTPSERVPATH
pwd
dir FUND_WhiteList_${TODAY}.txt
get FUND_WhiteList_${TODAY}.txt
close
bye
!
echo "��TAϵͳ��ư������ļ����"

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

echo '��ʼ����TAϵͳ��ư������ļ�'
if [ -e "${DATAPATH}/FUND_WhiteList_${TODAY}.txt" ]; then
#��ʼУ���ļ���ȷ��
num=`head -1 ${DATAPATH}/FUND_WhiteList_${TODAY}.txt`
fileline1=`echo "\n" >>${DATAPATH}/FUND_WhiteList_${TODAY}.txt|sed /^[[:space:]]*$/d ${DATAPATH}/FUND_WhiteList_${TODAY}.txt|wc -l`
#TAϵͳ��ư������ļ���һ��Ϊ��¼��������Ҫ��һ
fileline1=`expr $fileline1 - 1`
echo "    num      fileline"
echo " ---------   --------"
printf " %5s %10s\n" $num $fileline1

#����ļ���¼�����¼����һ��
if [ num  -eq fileline1 ]; then
echo "�ļ��б�ʾ������ʵ������������ļ���������ʼ������"
#insert tmp data
${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOFUNDWHITETMP.ctl data=${DATAPATH}/FUND_WhiteList_${TODAY}.txt  silent=feedback
#�Ƚ��ļ���������������ʱ�����Ѳ�������������Ƿ����
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off 
����select count( * ) coun from ibs_btab_fundwhite_tmp;
����exit;
����END`
echo "   fileline  sqlline"
echo " ----------- -------"
printf " %-11s %s\n" $fileline1 $sqlline2

#���TAϵͳ��ư������ļ�������ʱ��������������TA��ư�������
if [ fileline1  -eq sqlline2 ]; then
echo "TAϵͳ��ư������ļ���������TA��ư�������ʱ���������"
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_btab_fundwhite;
insert into ibs_btab_fundwhite
  (cif_no,cif_type,fund_code,end_date,ac_no)
  (select cif_no,cif_type,fund_code,end_date,ac_no from ibs_btab_fundwhite_tmp
  );
commit;
!
echo "��IBS_BTAB_FUNDWHITE�������ݳɹ���"

#�Թ���ư������ļ�
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} ����ʼTAϵͳ�Թ���ư�������TAEntFinanceWhiteList.sh"
sh /backup/batchdir/shells/TAEntFinanceWhiteList.sh ${TODAY}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} �������TAϵͳ�Թ���ư�������TAEntFinanceWhiteList.sh"

#��˽��ư������ļ�
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "${nowTime} ����ʼTAϵͳ��˽��ư�������TAPerFinanceWhiteList.sh"
sh /backup/batchdir/shells/TAPerFinanceWhiteList.sh ${TODAY}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "${nowTime} �������TAϵͳ��˽��ư�������TAPerFinanceWhiteList.sh"

else
#����ļ�������������ʱ�����������ֻ����TA��Ʋ�Ʒ�����IBS_ETAB_FUNDCODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "��IBS_BTAB_FUNDWHITE��������ʧ�ܣ���������ǰ����!"
fi
else
#�ļ��б�ʾ������ʵ��������������ļ��쳣
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "�ļ��б�ʾ������ʵ��������������ļ��쳣�������������������ǰ����!"
fi
else
#����ļ���������ֻ����TA��Ʋ�Ʒ�����IBS_ETAB_FUNDCODE
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';

update ibs_etab_fundcode m
   set m.direct_flag = '1'
 where exists (select n.fund_code
          from ibs_btab_fundwhite n
         where m.fund_code = n.fund_code);
commit;
!
echo "��ȡFUND_WhiteList_${TODAY}.txtͬ���ļ�ʧ�ܣ���������ǰ����!"
fi
echo '����TAϵͳ��ư������ļ�����'