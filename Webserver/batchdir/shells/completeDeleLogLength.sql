update ibs_ptab_delegcreditlogo t 
set t.delegcard_logo=substr('000'||t.delegcard_logo,-3,3)
where length(t.delegcard_logo)<3 or t.delegcard_logo is null;
commit;