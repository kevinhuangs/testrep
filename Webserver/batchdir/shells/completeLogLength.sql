update ibs_ptab_creditlogo t 
set t.card_logo=substr('000'||t.card_logo,-3,3)
where length(t.card_logo)<3 or t.card_logo is null;
commit;