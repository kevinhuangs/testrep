
spool ibs_ptab_jnl_supervise.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||CARDNO||'|+|'||
BUSINESS_KIND||'|+|'||MERCHANT_NO||'|+|'||CURRENCY||'|+|'||MERCHANT_ACNO||'|+|'||
AMOUNT||'|+||+|'||trim(replace(replace(MERCHANT_NAME,chr(13)),chr(10)))||'|+|'
from IBS_PTAB_JNL_SUPERVISE 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
