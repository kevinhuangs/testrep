delete from ibs_ptab_ac a 
where exists (select t.ac_no from ibs_ptab_acdelete t where a.ac_no=t.ac_no)
  and (a.ac_nbtype is null or (a.ac_nbtype<>'CDC' and  a.ac_nbtype<>'CD1')) and  a.ac_type<>'C' 
  and not exists(
      select 1 from ibs_mtab_puserrule m 
        where a.ac_no=m.ruledef 
          and m.ruleid='CurrentAcNo' 
          and m.ruletype='TrsDef' 
          and m.usertype='2' );
--add by dimingping 20131102 73896需求 核心销卡删除微信账户表  start
delete from IBS_MTAB_MP_AC a 
where exists (select t.ac_no from ibs_ptab_acdelete t where a.ac_no=t.ac_no)
  and (a.ac_nbtype is null or (a.ac_nbtype<>'CDC' and  a.ac_nbtype<>'CD1')) and  a.ac_type<>'C' 
  and not exists(
      select 1 from ibs_mtab_puserrule m 
        where a.ac_no=m.ruledef 
          and m.ruleid='CurrentAcNo' 
          and m.ruletype='TrsDef' 
          and m.usertype='2' );
--add by dimingping 20131102 73896需求 核心销卡删除微信账户表  end
commit;
exit