spool ibs_b2etab_jnl.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||JNL_USER_ID||'|+|'||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||
JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||JNL_AMOUNT||'|+|'||JNL_STATUS||'|+|'||JNL_TRSSTATUS||'|+|'||
JNL_REJCODE||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||JNL_IPADDR||'|+|'||JNL_NOTE||'|+|'||VERSION||'|+|'||SERVICENAME||'|+|'||
FLAG||'|+|'||QUERYSQLID||'|+|'||to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||ENCODEING||'|+|'||SYMACFLAG||'|+|'||
MAC||'|+|'||SYPINFLAG||'|+|'||PINSEED||'|+|'||
LICENSEID||'|+|'||NOTE||'|+|'||to_char(CREATE_TIME,'yyyyMMdd hh24:mi:ss')||'|+|'
from IBS_B2ETAB_JNL
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
