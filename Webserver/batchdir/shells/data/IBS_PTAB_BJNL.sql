
spool ibs_ptab_bjnl.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
JNL_ORGANID||'|+|'||JNL_REJCODE||'|+|'||TRANS_STATUS||'|+|'||TRANS_CODE||'|+|'||JNL_TELLERID||'|+|'||
JNL_AUTHTELLERID||'|+|'||JNL_IPADDR||'|+|'||AC_NO||'|+|'||CIF_NAME||'|+||+|'
from IBS_PTAB_BJNL 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off