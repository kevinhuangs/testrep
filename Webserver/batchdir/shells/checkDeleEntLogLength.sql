select count(*) from ibs_ptab_delegcreditlogo t 
where length(t.delegent_logo)<4 or t.delegent_logo is null;