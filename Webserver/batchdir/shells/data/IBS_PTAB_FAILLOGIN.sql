spool ibs_ptab_faillogin.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||to_char(LOGIN_TIME,'yyyyMMdd hh24:mi:ss')||
'|+|'||LOGIN_IP||'|+|'||STATUS||'|+|'
from ibs_ptab_faillogin where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');

spool off