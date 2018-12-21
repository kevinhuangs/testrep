spool ibs_btab_perregiser.tmp
set trimspool on
select 
JNL_NO||'|+|'||COMPANY_NAME||'|+|'||COMPANY_MAN||'|+|'||CELL_PHONENO||'|+|'||FILE_NAME||'|+|'||FILE_ROWS||'|+|'||
UP_FILENAME||'|+|'||to_char(JNL_BEGINDATE,'yyyymmdd')||'|+|'||to_char(JNL_ENDDATE,'yyyymmdd')||'|+|'||TRAN_STATUS||'|+|'||
DOWN_FILENAME||'|+|'||TELL_ORGANID||'|+|'||TELL_ID||'|+|'||RETURN_NO||'|+|'||to_char(JNL_DATETIME,'yyyymmdd hh24:mi:ss')||'|+|'
from IBS_BTAB_PERREGISER ;
spool off
