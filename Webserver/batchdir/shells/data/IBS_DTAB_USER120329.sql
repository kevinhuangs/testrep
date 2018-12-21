spool ibs_dtab_user.tmp
set trimspool on

 select
CIF_NO||'|+|'||
USER_STYLE||'|+|'||
to_char(USER_LASTLOGIN,'yyyyMMdd')||'|+|'||
to_char(USER_LASTMODDATE,'yyyyMMdd')||'|+|'||
USER_LOGINTIME||'|+|'||
USER_FAILLOGIN||'|+|'||
USER_ID||'|+|'||
USER_ORGANID||'|+|'||
FIRST_LOGIN||'|+|'
from IBS_DTAB_USER  ;

spool off