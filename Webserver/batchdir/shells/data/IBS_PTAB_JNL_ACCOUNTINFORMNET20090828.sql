
spool ibs_ptab_jnl_accountinformnet.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||EPAY_ACNO||'|+|'||AC_ORGANID||'|+|'||
ACCOUNT_TYPE||'|+|'||MOBILE_NUM||'|+|'||LIMIT_BALANCE||'|+|'||FLAG||'|+|'
from ibs_ptab_jnl_accountinformnet ;
spool off
