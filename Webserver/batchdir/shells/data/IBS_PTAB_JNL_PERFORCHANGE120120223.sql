spool ibs_ptab_jnl_perforchange1.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||RATE_TRANSFER||'|+|'||
AC_NO||'|+|'||CURRENCY||'|+|'||BUY_CURRENCY||'|+|'||CH_FLAG||'|+|'||
BUY_CHFLAG||'|+|'||SALE_AMOUNT||'|+|'||BUY_AMOUNT||'|+|'||REALRATE_TRANSFER||'|+|'||FEE||
'|+|'
from ibs_ptab_jnl_perforchange1;

spool off