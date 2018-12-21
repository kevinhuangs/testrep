set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool ibs_btab_teller.txt
set trimspool on
select 
teller_id||'|'||teller_branchid||'|'||teller_deptid||'|'||
teller_name||'|'||teller_password||'|'||teller_status||'|'||to_char(teller_opendate,'yyyyMMdd')||'|'||to_char(teller_closedate,'yyyyMMdd')||'|'||
teller_rootflag||'|'||to_char(teller_lastlogin,'yyyyMMdd')||'|'||teller_loginip||'|'||teller_telephone||'|'||teller_cellphone||'|'||
teller_email||'|'
from ibs_btab_teller;
spool off
exit
