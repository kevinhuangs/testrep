spool ibs_ptab_jnl_delegationac.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'
||TRANS_STATUS||'|+|'||DELEGAC_TYPE||'|+|'||DELEGAC_NO||'|+|'
||INTRUSTAC_NO||'|+|'||INTRUSTAC_NAME||'|+|'||DELEGAC_ALIAS||'|+|'
from IBS_PTAB_JNL_DELEGATIONAC;
spool off