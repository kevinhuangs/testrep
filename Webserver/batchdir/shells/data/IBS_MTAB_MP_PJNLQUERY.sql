spool ibs_mtab_mp_pjnlquery.tmp
set trimspool on
SELECT
JNLNO
||'|+|'||to_char(TRANSDATE,'yyyyMMdd')
||'|+|'||to_char(TRANSTIME,'yyyyMMdd hh24:mi:ss')
||'|+|'||MPID
||'|+|'||USERID
||'|+|'||TRANSCODE
||'|+|'||JNLSTATE
||'|+|'||RETURNCODE
||'|+|'||trim(replace(replace(replace(RETURNMSG,chr(13)),chr(10)),'|+|','#'))
||'|+|'||ACNO
||'|+|'||ACTYPE
||'|+|'||BEGINDATE
||'|+|'||ENDDATE
||'|+|'||trim(replace(replace(LOCALADDR,chr(13)),chr(10)))
||'|+|'||CHANNEL
||'|+|'
FROM IBS_MTAB_MP_PJNLQUERY
where TRANSDATE >= trunc(sysdate-1, 'dd') 
  and TRANSDATE <  trunc(sysdate,   'dd');
spool off
