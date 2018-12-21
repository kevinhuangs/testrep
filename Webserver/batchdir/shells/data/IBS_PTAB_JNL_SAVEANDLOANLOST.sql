
spool ibs_ptab_jnl_saveandloanlost.tmp

set trimspool on

select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
CARDNO||'|+|'||LOST_STYLE||'|+|'||APPLY_NAME||'|+|'
from ibs_ptab_jnl_saveandloanlost where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');

spool off