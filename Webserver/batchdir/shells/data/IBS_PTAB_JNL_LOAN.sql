spool ibs_ptab_jnl_loan.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||CURRENCY||'|+|'||AMOUNT||'|+|'||PERIOD||'|+|'||LOAN_NUMBER||'|+||+|'||LOAN_RATE||'|+|'
from IBS_PTAB_JNL_LOAN 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
--LOAN_NUMBER、LOAN_RATE中间的空字段对应SIGN_DATA(CLOB)
spool off