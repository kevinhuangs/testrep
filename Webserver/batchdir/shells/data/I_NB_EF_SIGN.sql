
spool ef_sign.tmp
set trimspool on
 select
 CIF_NO||'|+|'||'91'||'|+|'||decode(USER_STATUS,'2','关闭',decode(substr(USER_VERSIONSTATUS,1,1)||substr(USER_VERSIONSTATUS,2,1)||substr(USER_VERSIONSTATUS,3,1)||substr(USER_VERSIONSTATUS,7,1),'0000','关闭','开通'))
 ||'|+|'||decode(USER_STATUS,'2','0',decode(substr(USER_VERSIONSTATUS,1,1)||substr(USER_VERSIONSTATUS,2,1)||substr(USER_VERSIONSTATUS,3,1)||substr(USER_VERSIONSTATUS,7,1),'0000','0','1'))||'|+|'||
to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||decode((select a.ac_no||'|+|'||a.ac_type from IBS_PTAB_AC a where a.user_id = b.user_id and rownum<2),'','|+|',(select a.ac_no||'|+|'||a.ac_type from IBS_PTAB_AC a where a.user_id = b.user_id and rownum<2))||'|+|'||
''||'|+|'||'870'||'|+|'||''||'|+|'
from IBS_PTAB_USER b 
where USER_TYPE<>'2' and substr(CIF_NO,1,1) = '1' and 
USER_LASTMODDATE < trunc(sysdate, 'dd') and USER_LASTMODDATE >= trunc(sysdate-1, 'dd')
union
 select
 CIF_NO||'|+|'||'90'||'|+|'||decode(USER_STATUS,'2','关闭',decode(substr(USER_VERSIONSTATUS,8,1),'0','关闭','开通'))
 ||'|+|'||decode(USER_STATUS,'2','0',decode(substr(USER_VERSIONSTATUS,8,1),'0','0','1'))||'|+|'||
to_char(USER_OPENDATE,'yyyyMMdd')||'|+|'||decode((select a.ac_no||'|+|'||a.ac_type from IBS_PTAB_AC a where a.user_id = b.user_id and rownum<2),'','|+|',(select a.ac_no||'|+|'||a.ac_type from IBS_PTAB_AC a where a.user_id = b.user_id and rownum<2))||'|+|'||
''||'|+|'||'870'||'|+|'||''||'|+|'
from IBS_PTAB_USER b 
where USER_TYPE<>'2' and substr(CIF_NO,1,1) = '1' and 
USER_LASTMODDATE < trunc(sysdate, 'dd') and USER_LASTMODDATE >= trunc(sysdate-1, 'dd')
;
spool off
