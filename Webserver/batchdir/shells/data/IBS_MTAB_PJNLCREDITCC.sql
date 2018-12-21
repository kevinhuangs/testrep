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
        to_char(TO_DATE(BILLDATE,'yyyy-MM-dd'),'yyyyMMdd')  ||'|+|'   
     from IBS_MTAB_PJNLCREDITCC;
spool off
