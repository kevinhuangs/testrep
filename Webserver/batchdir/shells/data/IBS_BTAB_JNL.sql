
spool ibs_btab_jnl.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||JNL_STATUS||'|+|'||
JNL_REJCODE||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_TELLERID||'|+|'||
JNL_IPADDR||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+||+|'||AUTHQUEUE_SEQNO||'|+|'||
to_char(AUTHQUEUE_DATE,'yyyyMMdd')||'|+|'||JNL_CIFNO||'|+|'||JNL_ENTRYTELLERID||'|+|'||JNL_ORGANID||'|+|'||JNL_AUTHTELLERID||'|+|' 
from IBS_BTAB_JNL 
where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
