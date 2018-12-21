select count(*) from ibs_ptab_ac t 
where t.ac_type='C' and t.ac_no not in (select c.ac_no from ibs_ptab_creditlogo c);