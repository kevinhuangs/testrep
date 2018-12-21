set heading off
spool ibs_mtab_pjnl_nologin.tmp
select JNLNO || '|+|' ||  
        to_char(TRANSDATE, 'yyyyMMdd') || '|+|' ||  
        to_char(TRANSTIME, 'hh24miss') || '|+|' || 
        TRANSCODE || '|+|' ||
        ACNO  ||'|+|' ||
        ACTYPE  || '|+|' || 
        AMOUNT || '|+|' || 
        CURRENCY   ||'|+|' || 
        CHANNELID   ||'|+|' || 
        LOCALADDR ||'|+|'
     from ibs_mtab_pjnl_nologin
     where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
