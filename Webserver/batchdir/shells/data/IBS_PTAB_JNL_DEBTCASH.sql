
spool ibs_ptab_jnl_debtcash.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||DEBT_NO||'|+|'||PUBLISH_YEAR||'|+|'||PUBLISH_TIME||'|+|'||PERIOD||'|+|'||
AMOUNT||'|+|'||RATE||'|+|'||BEGIN_DATE||'|+|'||END_DATE||'|+|'||CERT_NO||'|+||+|'
from IBS_PTAB_JNL_DEBTCASH 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off