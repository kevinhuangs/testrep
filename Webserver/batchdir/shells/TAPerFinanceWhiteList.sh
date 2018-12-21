#对私理财白名单表
#LANG=zh_CN.hp15CN
CTLPATH=/backup/batchdir/ctrls
DATAPATH=/backup/batchdir/syndata
SQLPATH=/backup/batchdir/shells
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank
TODAY=${1}

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
echo "开始处理对私理财白名单" 
#count sqlnum
sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off numwidth 10
　　select count( * ) coun from ibs_btab_fundwhite;
　　exit;
　　END`

#将符合条件的记录插入到对私网银白名单表
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
truncate table ibs_ptab_fund_whitelist;

insert into ibs_ptab_fund_whitelist
  (fund_code, cif_no, ac_no, end_date)
  (select t.fund_code, t.cif_no, t.ac_no, t.end_date
     from ibs_btab_corewhite t
    where t.fund_code > ' '
      and t.cif_type = '1'
      and t.direct_flag = '1');
      
insert into ibs_ptab_fund_whitelist
  (fund_code, cif_no, ac_no, end_date)
  (select t.fund_code, t.cif_no, t.ac_no, t.end_date
     from ibs_btab_fundwhite t
    where t.fund_code > ' '
      and t.cif_type = '1');
commit;
!
#如果网银理财白名单总表中有数据，更新表IBS_ETAB_FUNDCODE标识
if [ sqlline2  -gt 0 ]; then
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
echo "表IBS_PTAB_FUND_WHITELIST导入数据成功,更新表IBS_ETAB_FUNDCODE的定向标志成功"
else
${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD}  >/dev/null <<!
update ibs_etab_fundcode
   set direct_flag = '0';
commit;
!
echo "FUND_WhiteList_${TODAY}.txt记录条数为0，没有设置白名单产品！"
fi
echo "处理对私理财白名单结束"