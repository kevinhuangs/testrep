
spool ibs_ptab_scheduletrs.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||AC_NO||'|+|'||AC_NAME||'|+|'||
AC_ORGANID||'|+|'||AC_TYPE||'|+|'||CURRENCY||'|+|'||AC_NO2||'|+|'||
AC_TYPE2||'|+|'||AC_NAME2||'|+|'||
AC_BANK2||'|+|'||BANK_NO||'|+|'||AMOUNT||'|+|'||SUMMARY||'|+|'||TRSSTATUS||'|+|'||TRANS_TYPE||'|+|'||
STATUS||'|+|'||TRANS_FREQUENCY||'|+|'||TIMES||'|+|'||to_char(RUNTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||REALFEE||'|+|'
||MOBILE||'|+|'||FEE||'|+|'||INFORM||'|+|'||DE_AMOUNT||'|+|'||OUT_FLAG||'|+|'
from IBS_PTAB_SCHEDULETRS where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');
spool off
