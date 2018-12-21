
spool ibs_dtab_jnl_transfer.tmp
set trimspool on
 select
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||
AC_TYPE||'|+|'||
AC_NO2||'|+|'||
AC2_TYPE||'|+|'||
AC_NAME||'|+|'||
AC_ORGANNAME||'|+|'||
AMOUNT||'|+|'||
REMARK||'|+|'||
MONEY_FLAG||'|+|'||
CURRENCY||'|+|'||
SIGN_DATA||'|+|'||
FEE||'|+|'||
REALFEE||'|+|'||
INFORM||'|+|'||
DEAL_TYPE||'|+|'||
DE_AMOUNT||'|+|'||
OUT_FLAG||'|+|'||
OPERATE_NO||'|+|'||
OUT_FLAG1||'|+|'||
OPERATE_NO1||'|+|'||
FALL_FLAG||'|+|'||
MOBILE||'|+|'||
BANK_PROV||'|+|'
from IBS_DTAB_JNL_TRANSFER
 where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;

spool off