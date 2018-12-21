
spool ibs_b2etab_jnl_b2e007.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||JNL_DETAILNO||'|+|'||to_char(JNL_DETAILDATE,'yyyyMMdd')||'|+|'
||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||USER_ID||'|+|'
||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_STATUS||'|+|'
||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||BATCH_ID||'|+|'||CLIENTPATCHID||'|+|'||JXS_CC_NO||'|+|'||SC_ID||'|+|'||BF_NO||'|+|'
||to_char(MATURE_DATE,'yyyyMMdd')||'|+|'||PI_NO||'|+|'||CAR_MODEL||'|+|'||ENGINE_MODEL||'|+|'||DJ_NO||'|+|'||PI_AMOUT||'|+|'||PI_ID||'|+|'
from IBS_B2ETAB_JNL_B2E007 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off
