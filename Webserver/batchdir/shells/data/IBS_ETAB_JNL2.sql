
spool ibs_etab_jnl2.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||
JNL_REJCODE||'|+|'||JNL_STATUS||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_USERID||'|+|'||
JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||JNL_CURRENCY||'|+|'||JNL_CURTYPE||'|+|'||JNL_AMOUNT||'|+|'||
JNL_IPADDR||'|+|'||ROLE_ID||'|+|'||JNL_BRANCHID||'|+|'||JNL_ORGAN||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+||+|'||
AUTHQUEUE_SEQNO||'|+|'||to_char(AUTHQUEUE_DATE,'yyyyMMdd')||'|+|'||trim(replace(replace(JNL_REJMESSAGE,chr(13)),chr(10)))||'|+|'||TRANSFER_TYPE||'|+|'
from IBS_ETAB_JNL2 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') 
union 
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||
JNL_REJCODE||'|+|'||JNL_STATUS||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_USERID||'|+|'||
JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||JNL_CURRENCY||'|+|'||JNL_CURTYPE||'|+|'||JNL_AMOUNT||'|+|'||
JNL_IPADDR||'|+|'||ROLE_ID||'|+|'||JNL_BRANCHID||'|+|'||JNL_ORGAN||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+||+|'||
AUTHQUEUE_SEQNO||'|+|'||to_char(AUTHQUEUE_DATE,'yyyyMMdd')||'|+|'||trim(replace(replace(JNL_REJMESSAGE,chr(13)),chr(10)))||'|+|'||TRANSFER_TYPE||'|+|'
from IBS_ETAB_REBUILD_JNL2 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off
