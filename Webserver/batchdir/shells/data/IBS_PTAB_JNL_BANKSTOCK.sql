
spool ibs_ptab_jnl_bankstock.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||PLACE_CODE||'|+|'||MERCHANT||'|+|'||AREA_CODE||'|+|'||STOCK_CODE||'|+|'||AMOUNT||'|+|'||
COUNT||'|+|'||AC_NO||'|+|'||AC_TYPE||'|+|'||BARGAIN||'|+|'||INST_CODE||'|+|'||CHARGE||'|+|'||CHANNEL||'|+|'||
NOTES||'|+||+|'
from IBS_PTAB_JNL_BANKSTOCK 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
