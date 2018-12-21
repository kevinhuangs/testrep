
spool ibs_ptab_jnl_creditpay.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||CARDNO||'|+|'||CURRENCY1||'|+|'||AC_NO||'|+|'||CURRENCY2||'|+|'||AMOUNT||'|+||+|'
from IBS_PTAB_JNL_CREDITPAY
where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd') ; 
spool off