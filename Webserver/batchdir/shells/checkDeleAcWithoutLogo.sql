select count(*) from ibs_ptab_delegationac t 
where t.delegac_type='C' 
and t.delegac_no not in(select d.delegac_no from ibs_ptab_delegcreditlogo d);