
spool ibs_ptab_user.tmp
set trimspool on
select
USER_ID||'|+|'||USER_LOGINNAME||'|+|'||CIF_NO||'|+|'||USER_TYPE||'|+|'||USER_PASSWORD||'|+|'||USER_CERTNO||'|+|'||
USER_ORGANID||'|+|'||to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||USER_STATUS||'|+|'||to_char(USER_LASTLOGIN,'yyyyMMdd hh24:mi:ss')||'|+|'||
to_char(USER_LASTMODDATE,'yyyyMMdd')||'|+|'||trim(replace(replace(USER_TIPNOTE,chr(13)),chr(10)))||'|+|'||
USER_STYLE||'|+|'||USER_LOGINTIME||'|+|'||USER_FAILLOGIN||'|+|'||USER_SETFLAG||'|+|'||USER_TRANSFERFLAG||'|+|'||USER_SOURCE||'|+|'||
USER_CERTSTORETYPE||'|+|'||USER_PROLOGINTIME||'|+|'||USER_TELNO4DYNAMIC||'|+|'||USER_VERSIONSTATUS||'|+|'||USER_MTRANSFERFLAG||'|+|'
from IBS_PTAB_USER where (USER_LASTMODDATE >= trunc(sysdate-1, 'dd') 
and USER_LASTMODDATE < trunc(sysdate, 'dd')) or (USER_LASTLOGIN >= trunc(sysdate-1, 'dd') 
and USER_LASTLOGIN < trunc(sysdate, 'dd'))
union
select
USER_ID||'|+|'||USER_LOGINNAME||'|+|'||CIF_NO||'|+|'||USER_TYPE||'|+|'||USER_PASSWORD||'|+|'||USER_CERTNO||'|+|'||
USER_ORGANID||'|+|'||to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||USER_STATUS||'|+|'||to_char(USER_LASTLOGIN,'yyyyMMdd hh24:mi:ss')||'|+|'||
to_char(USER_LASTMODDATE,'yyyyMMdd')||'|+|'||trim(replace(replace(USER_TIPNOTE,chr(13)),chr(10)))||'|+|'||
USER_STYLE||'|+|'||USER_LOGINTIME||'|+|'||USER_FAILLOGIN||'|+|'||USER_SETFLAG||'|+|'||USER_TRANSFERFLAG||'|+|'||USER_SOURCE||'|+|'||
USER_CERTSTORETYPE||'|+|'||USER_PROLOGINTIME||'|+|'||USER_TELNO4DYNAMIC||'|+|'||USER_VERSIONSTATUS||'|+|'||USER_MTRANSFERFLAG||'|+|'
from IBS_PTAB_USER where USER_ID in
(select USER_ID from IBS_PTAB_USER_JNL
 where (RECORD_TIME >= trunc(sysdate-1, 'dd') 
   and RECORD_TIME < trunc(sysdate, 'dd'))
   and user_id not in 
    (select user_id from ibs_ptab_user where 
     USER_LASTMODDATE >= trunc(sysdate-1, 'dd') 
      and USER_LASTMODDATE < trunc(sysdate, 'dd')
    )
  group by USER_ID
);
spool off
