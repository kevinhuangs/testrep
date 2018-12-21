spool ibs_ptab_jnl_metal.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd')||'|+|'
||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'
||CARDNO||'|+|'||CURRENCY||'|+|'||AMOUNTACNO||'|+|'||AMOUNT||'|+|'
from IBS_PTAB_JNL_METAL WHERE JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off