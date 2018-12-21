update ibs_ptab_creditlogo t 
set t.ent_logo=substr('0000'||t.ent_logo,-4,4)
where length(t.ent_logo)<4 or t.ent_logo is null;
commit;