set heading off
spool ibs_mtab_pjnlstock.tmp
set trimspool on
select JNLNO || '|+|' || ACNO || '|+|' || STOCKACNO
      || '|+|' || BUSINESSKIND || '|+|' ||MERCHANTNO  || '|+|' ||
    MERCHANTNAME ||'|+|' ||CURRENCY  ||'|+|' ||AMOUNT  ||'|+|' || to_char(TRANSDATE, 'yyyyMMdd')  || '|+|'
     from IBS_MTAB_PJNLSTOCK
     where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off