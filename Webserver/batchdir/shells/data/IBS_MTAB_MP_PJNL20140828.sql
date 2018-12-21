spool ibs_mtab_mp_pjnl.tmp
set trimspool on
select 
JNLNO||'|+|'||
to_char(TRANSDATE,'yyyyMMdd')||'|+|'||
to_char(TRANSTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
MPID||'|+|'||
USERID||'|+|'||
TRANSCODE||'|+|'||
JNLSTATE||'|+|'||
trim(replace(replace(RETURNCODE,chr(13)),chr(10)))||'|+|'||
trim(replace(replace(RETURNMSG,chr(13)),chr(10)))||'|+|'||
ACNO||'|+|'||
ACTYPE||'|+|'||
AMOUNT||'|+|'||
CURRENCY||'|+|'||
CRFLAG||'|+|'||
trim(replace(replace(LOCALADDR,chr(13)),chr(10)))||'|+|'||
LOGINTYPE||'|+|'||
FEE||'|+|'||
MOBILEPHONE||'|+|'||
REALFEE||'|+|'||
CHANNEL||'|+|'
from IBS_MTAB_MP_PJNL a
where a.transdate>=to_date('20140626','yyyy-MM-dd')
and   a.transdate< to_date('20140829','yyyy-MM-dd');
spool off