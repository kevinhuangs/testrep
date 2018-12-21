
spool ibs_ptab_jnl_debt.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||CURRENCY||'|+|'||PUBLISH_YEAR||'|+|'||PUBLISH_TIME||'|+|'||PERIOD||'|+|'||
RATE||'|+|'||AMOUNT||'|+||+|' 
from IBS_PTAB_JNL_DEBT 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off