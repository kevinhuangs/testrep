spool ibs_ptab_jnl_perforchange.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||BEFORE_TOTALAMOUNT||'|+|'||
AFTER_TOTALAMOUNT||'|+|'||RATE_TRANSFER||'|+|'||AC_NO||'|+|'||AC_CURRENCY||'|+|'||
AC_NO2||'|+|'||CH_FLAG||'|+|'||TRANSFER_CURRENCY||'|+|'||TRANSFER_AMOUNT||'|+|'
||BUY_AMOUNT||'|+|'||RATE_DISCOUNT||'|+|'||TRANSFER_REALAMOUNT||'|+|'
||BUY_TYPE||'|+|'||SELL_TYPE||'|+|'||COUNTRY||'|+|'||substr(PROMOTION_CODE,1,12)||'|+|'||SIGN_DATA||'|+|'
from ibs_ptab_jnl_perforchange where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd') ;

spool off