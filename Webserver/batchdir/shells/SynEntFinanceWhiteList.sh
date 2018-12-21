#������ư�������#
#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
finalDate=${1}
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

echo "��ʼ����Թ���ư�����"
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
����conn ${DBUSER}/${DBPWD}
����set pagesize 0 feedback off verify off heading off echo off numwidth 10
����select count( * ) coun from ibs_btab_corewhite;
����exit;
����END`

#�����������ļ�¼���뵽�Թ�����������
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_etab_sunfundacctctrl;

insert into ibs_etab_sunfundacctctrl
  (fund_code, cif_no, ac_no, end_date)
  (select t.fund_code, t.cif_no, t.ac_no, t.end_date
     from ibs_btab_corewhite t
    where t.fund_code > ' '
      and t.cif_type = '0'
      and t.direct_flag = '1');

insert into ibs_etab_sunfundacctctrl
  (fund_code, cif_no, ac_no, end_date)
  (select t.fund_code, t.cif_no, t.ac_no, t.end_date
     from ibs_btab_fundwhite t
    where t.fund_code > ' '
      and t.cif_type = '0');
commit;
!
#���������ư������ܱ��������ݣ����±�IBS_PTAB_FINANCECODE��ʶ
if [ sqlline2  -gt 0 ]; then
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
echo "��IBS_ETAB_SUNFUNDACCTCTRL�������ݳɹ������±�IBS_PTAB_FINANCECODE�Ķ����־�ɹ�"
else
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_ptab_financecode
   set direct_flag = '0';
commit;
!
echo "D0310_${finalDate}_blcbm.txt��¼����Ϊ0��û�����ð�������Ʒ��"
fi
echo "����Թ���ư���������"