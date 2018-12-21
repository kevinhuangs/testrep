
spool ibs_b2etab_jnl_b2e004.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||JNL_DETAILNO||'|+|'||to_char(JNL_DETAILDATE,'yyyyMMdd')||'|+|'
||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||USER_ID||'|+|'
||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_STATUS||'|+|'
||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||BATCH_ID||'|+|'||CLIENTPATCHID||'|+|'||ACNO||'|+|'||ACNO_NAME||'|+|'||ACNO2||'|+|'
||ACNO2_NAME||'|+|'||AMOUNT||'|+|'||TRANSFERTYPE||'|+|'||TOBANK||'|+|'||TOLOCATION||'|+|'||CLIENTSIGNATURE||'|+|'
||CHECKNO||'|+|'||CHECKPASSWORD||'|+|'||BANKNO||'|+|'||ISURGENT||'|+|'||CELLPHONE||'|+|'||replace(replace(replace(NOTE,chr(13)),chr(10)),'|+|','#')||'|+|'
||PERORENT||'|+|'||to_char(CREATE_TIME,'yyyyMMdd hh24:mi:ss')||'|+|'
from IBS_B2ETAB_JNL_B2E004 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off
