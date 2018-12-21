spool ibs_ptab_jnl_rent.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||to_char(BEGIN_DATE,'yyyyMMdd')||'|+|'||to_char(END_DATE,'yyyyMMdd')||'|+|'||
SYS_FLAG||'|+|'||FQHHAO||'|+|'||FORBANKNAME||'|+|'||QISHHH||'|+|'||
BANK_NAME||'|+|'||AC_NO||'|+|'||AMOUNT||'|+|'||AC_NO2||'|+|'||HOUSE_DETAIL||
'|+|'||LANDLORD||'|+|'||ACNO2_NAME||'|+|'||AC_TYPE||'|+|'||
AC2_TYPE||'|+|'||REMARK||'|+|'||CURRENCY||'|+|'||FEE||'|+|'||REALFEE||
'|+|'||INFORM||'|+|'||DE_AMOUNT||'|+|'||OUT_FLAG||'|+|'||FALL_FLAG||'|+|'||
MOBILE||'|+|'||MONEY_FLAG||'|+|'||AC_ORGANNAME||'|+|'||DEAL_TYPE||'|+|'
from IBS_PTAB_JNL_RENT;

spool off