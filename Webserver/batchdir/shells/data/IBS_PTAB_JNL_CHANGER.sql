
spool ibs_ptab_jnl_changer.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||TRANS_CODE||
'|+|'||TRANS_STATUS||'|+|'||AC_NO||'|+|'||AC_ORGANID||'|+|'||CARDNO||'|+|'||CURRENCYTYPE||'|+|'
||CASHORREM||'|+|'||TRANSFERAMOUNT||'|+|'||INOROUT||'|+|'
from ibs_ptab_jnl_changer where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');

spool off