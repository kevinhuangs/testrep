
spool ibs_ptab_jnl_creditset.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||USER_LOGINNAME||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||CARDNO||'|+|'||
CURRENCY1||'|+|'||AC_NO||'|+|'||CURRENCY2||'|+|'||PAY_STYLE||'|+|'
from IBS_PTAB_JNL_CREDITSET 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off