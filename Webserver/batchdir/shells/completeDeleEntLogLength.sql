update ibs_ptab_delegcreditlogo t 
set t.delegent_logo=substr('0000'||t.delegent_logo,-4,4)
where length(t.delegent_logo)<4 or t.delegent_logo is null;
commit;