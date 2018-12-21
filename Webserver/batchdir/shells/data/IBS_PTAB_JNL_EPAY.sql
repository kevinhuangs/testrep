
spool ibs_ptab_jnl_epay.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||AC_TYPE||'|+|'||CURRENCY||'|+|'||EPAY_AMOUNT||'|+|'||ORDER_ID||'|+|'||MER_ID||'|+||+|'
from IBS_PTAB_JNL_EPAY 
where (JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd')) ;
spool off
