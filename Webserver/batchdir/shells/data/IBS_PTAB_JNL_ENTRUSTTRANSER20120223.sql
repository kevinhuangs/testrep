
spool ibs_ptab_jnl_entrusttranser.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||TRANS_CODE||
'|+|'||TRANS_STATUS||'|+|'||AC_NO||'|+|'||AC_ORGANID||'|+|'||TRANSJNL_NO||'|+|'||to_char(TRANSJNL_DATE,'yyyyMMdd')||'|+|'
||PENDORIGJNL_NO||'|+|'||to_char(PENDORIGJNL_DATE,'yyyyMMdd')||'|+|'||PENDJNL_NO||'|+|'||AMOUNT_NO||'|+|'
||TRANSAMOUNT_USD||'|+|'||PEND_TYPE||'|+|'||PEND_RATE||'|+|'||PROFIT_RATE||'|+|'||LOSSLESS_RATE||'|+|'||
to_char(PENDMOD_TIME,'yyyyMMdd')||'|+|'||to_char(PENDDUE_DATE,'yyyyMMdd')||'|+|'
from ibs_ptab_jnl_entrusttranser;

spool off