set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool /backup/batchdir/anbmx/SynCbsAcOrgan20130328/NETBANK_DELEG_AC_CREDIT_20130328.txt
set trimspool on
select t.delegcif_no||'|+|'||
       t.intrustuser_id||'|+|'||
       t.delegac_no||'|+|'
from ibs_ptab_delegationac t 
where t.delegac_type='C';
spool off