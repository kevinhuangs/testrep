set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999
spool ibs_ptab_jnl_outopenmobilebank.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
CERT_TYPE||'|+|'||CERT_NO||'|+|'||ACCOUNT_TYPE||'|+|'||EPAY_ACNO||'|+|'||MOBILE_NUM||'|+|'
from IBS_PTAB_JNL_OUTOPENMOBILEBANK ;
spool off
