
spool ibs_ptab_jnl_fexchanger.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||SELL_AMOUNT||'|+|'||SELL_CURRENCY||'|+|'||CH_FLAG||'|+|'||BUY_CURRENCY||'|+|'||
BARGAIN||'|+|'||TRANS_TYPE||'|+|'||BUY_AMOUNT||'|+|'||RATE_WIN||'|+|'||RATE_LOSE||'|+|'||RATE_CURRENT||'|+|'||
RATE_TRANSFER||'|+||+|'
from IBS_PTAB_JNL_FEXCHANGER 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off