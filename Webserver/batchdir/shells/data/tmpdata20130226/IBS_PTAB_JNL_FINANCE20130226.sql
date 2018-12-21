spool a_nb_ibs_ptab_jnl_finance_20130226_000_000.dat
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||PRODUCT_CODE||'|+|'||PRODUCT_NAME||'|+|'||FIN_PROFIT||'|+|'||SELF_CURRENCY||'|+|'||FIN_LIMIT||'|+|'||
INIT_DATE||'|+|'||LAST_DATE||'|+|'||COLLECT_DATE||'|+|'||PRE_DATE||'|+|'||TRANS_AMOUNT||'|+|'||PRESTART_AMOUNT||'|+|'||PREEND_AMOUNT||'|+|'||
PRE_AMOUNT||'|+|'||FINANCE_ACNO1||'|+|'||FINANCE_ACNO2||'|+|'||KIND_CODE||'|+|'||ISPROMPT||'|+|'||KIND_NAME||'|+||+|'||MANAGER_ORGANID||'|+|'||MANAGER_NO||'|+|'||WTCHANNEL_ID||'|+|'
from IBS_PTAB_JNL_FINANCE 
where jnl_date > to_date('20121128','yyyymmdd') 
and jnl_date < to_date('20130226','yyyymmdd') ;
--KIND_NAME、MANAGER_ORGANID中间的空字段对应SIGN_DATA(CLOB)
spool off
