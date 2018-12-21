set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool /backup/batchdir/anbmx/SynCbsAcOrgan20130328/NETBANK_AC_ORGAN_20130328.txt
set trimspool on
select t.user_id||'|+|'||
       t.ac_no||'|+|'||
       t.ac_type||'|+|'
from ibs_ptab_ac t
where t.ac_type in ('1','2');
spool off