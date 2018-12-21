
spool ibs_ptab_jnl_f2c.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||AC_NO2||'|+|'||AC_SEQNO||'|+|'||CURRENCY||'|+|'||PERIOD||'|+|'||MONEY_FLAG||'|+|'||
BASIC_AMOUNT||'|+|'||SAVE_KIND||'|+|'||to_char(END_DATE,'yyyyMMdd')||'|+|'||TRANS_AMOUNT||'|+|'||trim(replace(replace(REMARK,chr(13)),chr(10)))||'|+|'||AC_TYPE||'|+|'||
AC2_TYPE||'|+|' 
from IBS_PTAB_JNL_F2C 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off