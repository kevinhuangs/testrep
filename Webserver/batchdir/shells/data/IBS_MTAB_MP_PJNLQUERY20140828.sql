spool ibs_mtab_mp_pjnlquery.tmp
set trimspool on
select 
JNLNO||'|+|'||
to_char(TRANSDATE,'yyyyMMdd')||'|+|'||
to_char(TRANSTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
MPID||'|+|'||
USERID||'|+|'||
TRANSCODE||'|+|'||
JNLSTATE||'|+|'||
RETURNCODE||'|+|'||
trim(replace(replace(replace(RETURNMSG,chr(13)),chr(10)),'|+|','#'))||'|+|'||
ACNO||'|+|'||
ACTYPE||'|+|'||
BEGINDATE||'|+|'||
ENDDATE||'|+|'||
trim(replace(replace(LOCALADDR,chr(13)),chr(10)))||'|+|'||
CHANNEL||'|+|'
from IBS_MTAB_MP_PJNLQUERY a
where a.TRANSDATE>=to_date('20140626','yyyy-MM-dd')
and   a.TRANSDATE< to_date('20140829','yyyy-MM-dd');
spool off