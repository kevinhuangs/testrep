
spool ibs_ptab_jnl_outopenmobilebank.tmp

set trimspool on

select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
CERT_TYPE||'|+|'||CERT_NO||'|+|'||ACCOUNT_TYPE||'|+|'||EPAY_ACNO||'|+|'||MOBILE_NUM||'|+|'
from IBS_PTAB_JNL_OUTOPENMOBILEBANK 
where JNL_DATE < trunc(sysdate, 'dd') 
and JNL_DATE >= trunc(sysdate-1, 'dd') ;
spool off
