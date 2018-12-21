set heading off
spool ibs_mtab_pjnlfee.tmp
set trimspool on
 select JNLNO  || '|+|' ||  ACNO  || '|+|' || CURRENCY || '|+|' || FEECITY 
               || '|+|' ||FEEITEMNO || '|+|' ||  FEEITEMNAME || '|+|' || FEEUSERNAME  || '|+|' 
               || FEEUNIT  || '|+|' || FEEINPUT1 || '|+|' ||  FEEINPUT2 || '|+|' || FEEINPUT3  || '|+|' 
               || AMOUNT || '|+|' || to_char(TRANSDATE, 'yyyyMMdd')  || '|+|'
          from  IBS_MTAB_PJnlFee 
          where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
