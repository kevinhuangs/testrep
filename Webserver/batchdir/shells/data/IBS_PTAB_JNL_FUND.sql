spool ibs_ptab_jnl_fund.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||AC_NAME||'|+|'||FUND_CODE||'|+|'||trim(replace(replace(FUND_NAME,chr(13)),chr(10)))||'|+|'||AMOUNT||'|+|'||
to_char(BUY_DATE,'yyyyMMdd')||'|+|'||BUY_MODE||'|+|'||FUND_CODE2||'|+|'||to_char(WT_DATE,'yyyyMMdd')||'|+|'||
BARGAIN||'|+|'||WT_AMOUNT||'|+||+|'||MANAGER_ORGANID||'|+|'||MANAGER_NO||'|+|'||WTCHANNEL_ID||'|+|'
from IBS_PTAB_JNL_FUND 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
--WT_AMOUNT、MANAGER_ORGANID中间的空字段对应SIGN_DATA(CLOB)
spool off