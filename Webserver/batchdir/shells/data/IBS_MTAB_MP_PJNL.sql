spool ibs_mtab_mp_pjnl.tmp
set trimspool on
SELECT 
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
FROM IBS_MTAB_MP_PJNL
where TRANSDATE >= trunc(sysdate-1, 'dd') 
  and TRANSDATE <  trunc(sysdate,   'dd');
spool off
