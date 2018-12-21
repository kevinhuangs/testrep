set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

spool ibs_ptab_user.tmp
set trimspool on
select
USER_ID||'|+|'||USER_LOGINNAME||'|+|'||CIF_NO||'|+|'||USER_TYPE||'|+|'||USER_PASSWORD||'|+|'||USER_CERTNO||'|+|'||
USER_ORGANID||'|+|'||to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||USER_STATUS||'|+|'||to_char(USER_LASTLOGIN,'yyyyMMdd hh24:mi:ss')||'|+|'||
to_char(USER_LASTMODDATE,'yyyyMMdd')||'|+|'||trim(replace(replace(USER_TIPNOTE,chr(13)),chr(10)))||'|+|'||
USER_STYLE||'|+|'||USER_LOGINTIME||'|+|'||USER_FAILLOGIN||'|+|'||USER_SETFLAG||'|+|'||USER_TRANSFERFLAG||'|+|'||USER_SOURCE||'|+|'||
USER_CERTSTORETYPE||'|+|'||USER_PROLOGINTIME||'|+|'||USER_TELNO4DYNAMIC||'|+|'||USER_VERSIONSTATUS||'|+|'
from IBS_PTAB_USER ;

spool off
