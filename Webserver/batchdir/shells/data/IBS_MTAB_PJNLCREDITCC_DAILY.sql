set heading off
spool ibs_mtab_pjnlcreditcc.tmp
select JNLNO || '|+|' ||  
        to_char(TRANSDATE, 'yyyyMMdd') || '|+|' ||  
        to_char(TRANSTIME, 'hh24miss') || '|+|' || 
        TRANSCODE || '|+|' ||
        ACNO  || '|+|' || 
        CURRENCY   ||'|+|' || 
        CHANNELID   ||'|+|'|| 
        ROOTJNLNO ||'|+|'|| 
        LOCALADDR || '|+|' || 
        MOBILEPHONE   ||'|+|'  || 
        MAINFLAG   ||'|+|' || 
        to_char(IMPTTIME, 'yyyyMMddhh24miss')   ||'|+|'  || 
        to_char(TO_DATE(replace(replace(BILLDATE,'undefined',''),' ',''),'yyyy-MM-dd'),'yyyyMMdd')  ||'|+|'   
     from IBS_MTAB_PJNLCREDITCC
     where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
