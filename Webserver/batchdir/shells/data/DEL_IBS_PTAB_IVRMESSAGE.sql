
delete
from ibs_ptab_ivrmessage
where create_time <= sysdate-1 ;
commit;
