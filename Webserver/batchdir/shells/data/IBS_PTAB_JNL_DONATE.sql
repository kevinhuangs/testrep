
spool ibs_ptab_jnl_donate.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||CREDIT_VALIDATE||'|+|'||CURRENCY||'|+|'||DON_NO||'|+|'||trim(replace(replace(DON_DEPTNAME,chr(13)),chr(10)))||'|+|'||
trim(replace(replace(DON_NAME,chr(13)),chr(10)))||'|+|'||trim(replace(replace(DON_PERSON,chr(13)),chr(10)))||'|+|'||
DON_CERTNO||'|+|'||DON_CERTTYPE||'|+|'||DON_AMOUNT||'|+|'||DON_RECEIPT_FLAG||'|+|'||DON_TITLE_FLAG||'|+|'||trim(replace(replace(DON_ADDRESS,chr(13)),chr(10)))||'|+|'||
DON_ZIPCODE||'|+|'||DON_TELNO||'|+||+|'
from IBS_PTAB_JNL_DONATE 
where (JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd')) ;
spool off
