spool ibs_ptab_jnl_finance.tmp
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||PRODUCT_CODE||'|+|'||PRODUCT_NAME||'|+|'||FIN_PROFIT||'|+|'||SELF_CURRENCY||'|+|'||FIN_LIMIT||'|+|'||
to_char(INIT_DATE,'yyyyMMdd')||'|+|'||to_char(LAST_DATE,'yyyyMMdd')||'|+|'||to_char(COLLECT_DATE,'yyyyMMdd')||'|+|'||to_char(PRE_DATE,'yyyyMMdd')||'|+|'||TRANS_AMOUNT||'|+|'||PRESTART_AMOUNT||'|+|'||PREEND_AMOUNT||'|+|'||
PRE_AMOUNT||'|+|'||FINANCE_ACNO1||'|+|'||FINANCE_ACNO2||'|+|'||KIND_CODE||'|+|'||ISPROMPT||'|+|'||KIND_NAME||'|+||+|'||MANAGER_ORGANID||'|+|'||MANAGER_NO||'|+|'||WTCHANNEL_ID||'|+|'||
MODE_TYPE||'|+|'||TAKEAMT_DATE||'|+|'
from IBS_PTAB_JNL_FINANCE
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
--KIND_NAME、MANAGER_ORGANID中间的空字段对应SIGN_DATA(CLOB)
spool off
