
spool ibs_ptab_jnl_userset.tmp

set trimspool on

select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||SET_KEY||'|+|'||
replace(replace(replace(OLD_VALUE,chr(13)),chr(10)),'|+|','#')||'|+|'||replace(replace(replace(NEW_VALUE,chr(13)),chr(10)),'|+|','#')||'|+|'||FAIL_REASON||'|+|'
from IBS_PTAB_JNL_USERSET where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');
spool off