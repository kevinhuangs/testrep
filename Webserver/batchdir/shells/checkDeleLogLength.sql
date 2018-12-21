select count(*) from ibs_ptab_delegcreditlogo t 
where length(t.delegcard_logo)<3 or t.delegcard_logo is null;