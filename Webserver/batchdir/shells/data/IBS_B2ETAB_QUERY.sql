spool ibs_b2etab_query.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||JNL_USER_ID||'|+|'||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||
JNL_STATUS||'|+|'||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_IPADDR,chr(13)),chr(10)))||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
to_char(CREATE_TIME,'yyyyMMdd hh24:mi:ss')||'|+|'
from IBS_B2ETAB_QUERY 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ; 
spool off
