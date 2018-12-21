
spool ibs_ptab_jnl_fee.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||CURRENCY||'|+|'||FEE_CITY||'|+|'||FEE_ITEMNO||'|+|'||trim(replace(replace(FEE_ITEMNAME,chr(13)),chr(10)))||'|+|'||trim(replace(replace(FEE_CIFNAME,chr(13)),chr(10)))||'|+|'||trim(replace(replace(FEE_UNIT,chr(13)),chr(10)))||'|+|'||
trim(replace(replace(FEE_INPUT1,chr(13)),chr(10)))||'|+|'||trim(replace(replace(FEE_INPUT2,chr(13)),chr(10)))||'|+|'||trim(replace(replace(FEE_INPUT3,chr(13)),chr(10)))||'|+|'||FEE_AMOUNT||'|+||+|'||FEE_TYPE||'|+|'
from IBS_PTAB_JNL_FEE 
where (JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd')) ;
spool off
