
spool ibs_ptab_tellerjnl.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
JNL_TELLERID||'|+|'||JNL_ORGANID||'|+|'||JNL_LOGINIP||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
JNL_REJCODE||'|+|'||trim(replace(replace(JNL_REJMESG,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_NOTES,chr(13)),chr(10)))||'|+||+|'
from IBS_PTAB_TELLERJNL 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off