set heading off
spool ibs_mtab_pjnlquery.tmp
select JNLNO || '|+|' ||  
        to_char(TRANSDATE, 'yyyyMMdd') || '|+|' ||  
        to_char(TRANSTIME, 'hh24miss') || '|+|' || 
        TRANSCODE || '|+|'||
        JNLSTATE  || '|+|' ||
        RETURNCODE ||'|+|' ||
        RETURNMSG  ||'|+|' ||
        USERID  ||'|+|' ||
        ACNO  || '|+|' || 
        ACTYPE   ||'|+|' ||  
        CHANNELID   ||'|+|'
     from IBS_MTAB_PJnlQuery
     where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
