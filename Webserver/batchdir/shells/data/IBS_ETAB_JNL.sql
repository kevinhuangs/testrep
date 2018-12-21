
spool ibs_etab_jnl.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||CIF_NO||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||JNL_REJCODE||'|+|'||
JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_USERID||'|+|'||JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||
JNL_CURRENCY||'|+|'||JNL_CURTYPE||'|+|'||JNL_AMOUNT||'|+|'||JNL_IPADDR||'|+|'||ROLE_ID||'|+|'||
JNL_BRANCHID||'|+|'||JNL_ORGAN||'|+|'||JNL_STATUS||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+||+|'
from IBS_ETAB_JNL 
where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd')  
union 
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||CIF_NO||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||JNL_REJCODE||'|+|'||
JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_USERID||'|+|'||JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||
JNL_CURRENCY||'|+|'||JNL_CURTYPE||'|+|'||JNL_AMOUNT||'|+|'||JNL_IPADDR||'|+|'||ROLE_ID||'|+|'||
JNL_BRANCHID||'|+|'||JNL_ORGAN||'|+|'||JNL_STATUS||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+||+|'
from IBS_ETAB_REBUILD_JNL 
where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd')  ;
spool off
