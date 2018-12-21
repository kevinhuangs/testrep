set heading off
spool ibs_mtab_creditverjnl.tmp
set trimspool on
 select  JNLNO  || '|+|' ||  
         to_char(TRANSDATE , 'yyyyMMdd') || '|+|' || 
         to_char(TRANSTIME , 'hh24miss')  || '|+|' || 
         TRANSCODE || '|+|' ||
         JNLSTATE || '|+|' ||
         RETURNCODE || '|+|' ||
         RETURNMSG || '|+|' ||
         MOBILENO || '|+|' ||
         CARDNO || '|+|'
        from  IBS_MTAB_CreditVerJnl 
        where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
