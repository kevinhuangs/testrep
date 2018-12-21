spool ibs_ptab_jnl_outbank_sign.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'
||TRANS_STATUS||'|+|'||SIGN_ID||'|+|'||SIGN_ACNO||'|+|'
||SIGN_ACNAME||'|+|'||SIGN_BANK||'|+|'||SIGN_BANKADD||'|+|'
||ACCEPT_FLAG||'|+|'||ACCEPT_ACNO||'|+|'
from IBS_PTAB_JNL_OUTBANK_SIGN;
spool off