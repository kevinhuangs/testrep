set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool ibs_ptab_bankno_tmp.txt
set trimspool on
select 
Count(FQCYJG)
from ibs_ptab_bankno_tmp;
spool off
exit