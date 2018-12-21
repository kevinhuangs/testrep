 update 
 (
 select b.xinkah b1,a.ac_no a1 from IBS_PTAB_AC a, IBS_TAB_AC_CHANGE b where a.ac_no=b.laokah and not exists 
 (
 select '' from IBS_PTAB_AC n where b.xinkah=n.ac_no
 ))
 set a1=b1;
 update 
 (
 select b.xinkah b1,a.ac_no a1 from IBS_PTAB_CREDITLOGO a, IBS_TAB_AC_CHANGE b where a.ac_no=b.laokah and not exists 
 (
 select '' from IBS_PTAB_CREDITLOGO n where b.xinkah=n.ac_no
 ))
 set a1=b1;
 update ibs_mtab_puserrule a
   set (a.ruledef)
       = (select b.XINKAH from IBS_TAB_AC_CHANGE b where a.ruledef = b.LAOKAH)
 where a.ruleid='CurrentAcNo' and a.ruletype='TrsDef' and a.usertype='2' 
 and exists (select '' from IBS_TAB_AC_CHANGE c where a.ruledef = c.LAOKAH);
 --add by dimingping 20131102 73896需求 核心换卡更新微信账户表 start
 update 
 (
 select b.xinkah b1,a.ac_no a1 from IBS_MTAB_MP_AC a, IBS_TAB_AC_CHANGE b where a.ac_no=b.laokah and not exists 
 (
 select '' from IBS_MTAB_MP_AC n where b.xinkah=n.ac_no
 ))
 set a1=b1;
 --add by dimingping 20131102 73896需求 核心换卡更新微信账户表 end
commit;
exit;