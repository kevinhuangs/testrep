select count(*) from ibs_ptab_creditlogo t 
where length(t.ent_logo)<4 or t.ent_logo is null;