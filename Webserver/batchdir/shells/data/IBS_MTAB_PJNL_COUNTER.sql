
spool ibs_mtab_pjnl_counter.tmp
set trimspool on
select to_char(TRANSDATE, 'yyyyMMdd') || '|+|' ||  
        to_char(TRANSTIME, 'hh24miss') || '|+|' || 
        TRANSCODE || '|+|'||
        TIMES ||'|+|'
     from IBS_MTAB_PJNL_COUNTER where TRANSDATE >= trunc(sysdate-1, 'dd') 
and TRANSDATE < trunc(sysdate, 'dd');
spool off
