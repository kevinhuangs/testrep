
spool ibs_ptab_jnl_c2f.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||AC_NO2||'|+|'||AC_SEQNO||'|+|'||CURRENCY||'|+|'||PERIOD||'|+|'||MONEY_FLAG||'|+|'||
AC_PROMISE||'|+|'||AMOUNT||'|+|'||REMARK||'|+|'||AC_TYPE||'|+|'||AC2_TYPE||'|+|'||SAVE_KIND||'|+|' 
from IBS_PTAB_JNL_C2F 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
