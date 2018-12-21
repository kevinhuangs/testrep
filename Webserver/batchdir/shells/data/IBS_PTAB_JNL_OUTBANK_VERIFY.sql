spool ibs_ptab_jnl_outbank_verify.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'
||TRANS_STATUS||'|+|'||SIGN_ID||'|+|'||AC_NO||'|+|'
||AC_NAME||'|+|'||AC_ORG||'|+|'||to_char(VALID_DATE,'yyyyMMdd')||'|+|'
||DAY_AMOUNT||'|+|'||SERVE_TYPE||'|+|'||AC_NO2||'|+|'
||AC_NAME2||'|+|'||AC_ORGNAME2||'|+|'||TELEPHONE||'|+|'
||CIF_NO||'|+|'||AC_TYPE||'|+|'||SINGLE_AMOUNT||'|+|'
from IBS_PTAB_JNL_OUTBANK_VERIFY WHERE JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off