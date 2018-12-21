spool ibs_btab_perregiserdetail.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_BEGINDATE,'yyyyMMdd')||'|+|'||CIF_NO||'|+|'||CIF_NAME||'|+|'||CIF_CERTTYPE||'|+|'||CIF_CERTNO||'|+|'||
CIF_SEX||'|+|'||to_char(CIF_BIRTHDATE,'yyyyMMdd')||'|+|'||CIF_HOMEADDR||'|+|'||CIF_HOMEZIPCODE||'|+|'||CIF_HOMETELNO||'|+|'||
CIF_CELLPHONENO||'|+|'||CIF_EMAIL||'|+|'||AC_NO||'|+|'||AC_NAME||'|+|'||AC_TYPE||'|+|'||AC_ORGANID||'|+|'||CORE_STATUS||'|+|'||
trim(replace(replace(CORE_MESSAGE,chr(13)),chr(10)))||'|+|'||NET_STATUS||'|+|'||trim(replace(replace(NET_MESSAGE,chr(13)),chr(10)))||'|+|'||to_char(JNL_ENDDATE,'yyyyMMdd hh24:mi:ss')||'|+|'||OPEN_TYPE||'|+|'||
VERSION_TYPE||'|+|'||SEND_MESSAGE||'|+|'||USER_ID||'|+|'||FILE_JNLNO||'|+|'||SEND_MSGFORMAT||'|+|'||CIF_FLAG||'|+|'
from IBS_BTAB_PERREGISERDETAIL ;
spool off
