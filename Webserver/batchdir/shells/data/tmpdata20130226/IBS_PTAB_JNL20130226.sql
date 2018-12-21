spool a_nb_ibs_ptab_jnl_20130226_000_000.dat
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||AC_NO||'|+|'||AC_ORGANID||'|+|'||JNL_LOGINIP||'|+|'||TRANS_CODE||'|+|'||
REGI_CODE||'|+|'||TRANS_STATUS||'|+|'||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||
trim(replace(replace(JNL_REJMESG,chr(13)),chr(10)))||'|+|'||replace(JNL_NOTES,'|+|','#')||'|+|'
||trim(replace(replace(LOGIN_HOST,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_ENTER,chr(13)),chr(10)))||'|+|'
||trim(replace(replace(HOST_TRANSACTION_CODE,chr(13)),chr(10)))||'|+|'
||trim(replace(replace(TRANS_GROUP,chr(13)),chr(10)))||'|+|'||TRANS_CHANNEL||'|+|'||TPU_RETMSG||'|+|'
from IBS_PTAB_JNL 
where jnl_date > to_date('20120926','yyyymmdd') 
and jnl_date < to_date('20121001','yyyymmdd') ;
spool off
