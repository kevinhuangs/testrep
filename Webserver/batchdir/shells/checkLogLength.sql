select count(*) from ibs_ptab_creditlogo t 
where length(t.card_logo)<3 or t.card_logo is null;