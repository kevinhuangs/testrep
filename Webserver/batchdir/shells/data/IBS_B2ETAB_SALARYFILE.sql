
spool ibs_b2etab_salaryfile.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||JNL_DETAILNO||'|+|'||CIF_NO||'|+|'||USER_ID||'|+|'||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||
BATCHID||'|+|'||CLIENTPATCHID||'|+|'||ACNO||'|+|'||AMOUNT||'|+|'||FILENAME||'|+|'
from IBS_B2ETAB_SALARYFILE 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off
