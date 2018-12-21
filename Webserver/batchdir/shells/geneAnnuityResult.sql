set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool ANNUNITY.txt
set trimspool on
select 
CIF_NO||'|+|'||STATUS||'|+|'
from IBS_BTAB_ANNUITYTEMP;
spool off
exit