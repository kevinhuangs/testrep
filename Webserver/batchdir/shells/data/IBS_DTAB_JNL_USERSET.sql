
spool ibs_dtab_jnl_userset.tmp

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
from IBS_DTAB_JNL_USERSET 
where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;

spool off