spool ibs_dtab_jnl_userset.tmp
set trimspool on

 select
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
USER_ID||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
SET_KEY||'|+|'||
OLD_VALUE||'|+|'||
NEW_VALUE||'|+|'||
FAIL_REASON||'|+|'
from IBS_DTAB_JNL_USERSET;

spool off