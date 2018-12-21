delete from ibs_ptab_creditlogo t where t.ac_no not in (select ac_no from ibs_ptab_ac);
commit;