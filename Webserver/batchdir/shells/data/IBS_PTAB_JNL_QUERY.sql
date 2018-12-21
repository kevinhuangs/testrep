
spool ibs_ptab_jnl_query.tmp
set trimspool on
select
USER_ID||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||JNL_LOGINIP||'|+|'||TRANS_CODE||'|+|'||AC_ORGANID||'|+|'
from IBS_PTAB_JNL_QUERY 
where JNL_DATETIME >= trunc(sysdate-1, 'dd') 
and JNL_DATETIME < trunc(sysdate, 'dd') ;
spool off