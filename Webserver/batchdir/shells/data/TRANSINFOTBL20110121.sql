
spool transinfotbl.tmp
set trimspool on
select
REC_ID||'|+|'||LRA_ID||'|+|'||SERIAL_NO||'|+|'||TRANS_TYPE||'|+|'
||CERT_TYPE||'|+|'||USER_ID||'|+|'||USER_ID_TYPE||'|+|'
||USER_ID_NO||'|+|'||USER_NAME||'|+|'
||STATUS_FLAG||'|+|'||ERROR_CODE||'|+|'||trim(replace(replace(ERROR_MSG,chr(13)),chr(10)))||'|+|'||trim(replace(replace(USER_DN,chr(13)),chr(10)))||'|+|'||to_char(LOG_TIME,'yyyyMMdd hh24:mi:ss')||'|+|'
from gd.TRANSINFOTBL;
spool off
