
spool ibs_ptab_jnl_finance.tmp

select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||PRODUCT_CODE||'|+|'||PRODUCT_NAME||'|+|'||FIN_PROFIT||'|+|'||SELF_CURRENCY||'|+|'||FIN_LIMIT||'|+|'||
INIT_DATE||'|+|'||LAST_DATE||'|+|'||COLLECT_DATE||'|+|'||PRE_DATE||'|+|'||TRANS_AMOUNT||'|+|'||PRESTART_AMOUNT||'|+|'||PREEND_AMOUNT||'|+|'||
PRE_AMOUNT||'|+|'||FINANCE_ACNO1||'|+|'||FINANCE_ACNO2||'|+|'||KIND_CODE||'|+|'||ISPROMPT||'|+|'||KIND_NAME||'|+|'||SIGN_DATA||'|+|'
from IBS_PTAB_JNL_FINANCE
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
