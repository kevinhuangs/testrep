
spool ibs_etab_user.tmp
set trimspool on
select
USER_ID||'|+|'||CIF_NO||'|+|'||USER_NAME||'|+|'||trim(replace(replace(USER_DEPT,chr(13)),chr(10)))||'|+|'||USER_TYPE||'|+|'||USER_PASSWORD||'|+|'||
USER_GROUPID||'|+|'||USER_LEVEL||'|+|'||USER_STATUS||'|+|'||to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||
to_char(USER_CLOSEDATE,'yyyyMMdd')||'|+|'||
USER_CERT_NO||'|+|'||USER_IDTYPE||'|+|'||USER_IDNO||'|+|'||to_char(USER_LASTLOGIN,'yyyyMMdd hh24:mi:ss')||'|+|'||USER_LOGINIP||'|+|'||
USER_REMAIN||'|+|'||trim(replace(replace(USER_TELNO,chr(13)),chr(10)))||'|+|'||trim(replace(replace(USER_EMAIL,chr(13)),chr(10)))||'|+|'||trim(replace(replace(USER_NOTE,chr(13)),chr(10)))||'|+|'||USER_FAILLOGIN||'|+|'||
USER_SUCCESSLOGIN||'|+|'||USER_MOBILEPHONE||'|+|'||USER_SEX||'|+|'||trim(replace(replace(USER_ALIAS,chr(13)),chr(10)))||'|+|'||USER_APPLYNAME||'|+|'||
USER_APPLYUNIT||'|+|'||USER_APPLYIDTYPE||'|+|'||USER_APPLYIDNO||'|+|'||to_char(USER_APPLYDATE,'yyyyMMdd')
||'|+|'||USER_APPLYREMARK||'|+|'||USER_WITHDRAWFLAG||'|+|'||USER_SIGNCHECK||'|+|'||to_char(USER_SIGNDATE,'yyyyMMdd')||'|+|'||USER_TOKENID||'|+|'||
USER_TOKENENT||'|+|'||USER_ACTIVECODE||'|+|'||USER_ACTIVEFLAG||'|+|'||to_char(USER_DROPDATE,'yyyyMMdd')||'|+|'
from IBS_ETAB_USER ;
spool off
