set heading off
spool ibs_mtab_pjnlcredit.tmp
set trimspool on
 select JNLNO  || '|+|' ||  CRNO  || '|+|' || PAYEECURRENCY || '|+|' || ACNO 
               || '|+|' ||PAYERCURRENCY || '|+|' ||  AMOUNT || '|+|' || PAYOFFFLAG || '|+|' ||  to_char(TRANSDATE , 'yyyyMMdd') || '|+|'
          from  IBS_MTAB_PJnlCredit 
          where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
