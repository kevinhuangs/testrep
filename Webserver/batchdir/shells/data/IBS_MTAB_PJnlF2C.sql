set heading off
spool ibs_mtab_pjnlf2c.tmp
set trimspool on
  select JNLNO  || '|+|' ||  ACNO  || '|+|' || PAYEEACNO || '|+|' || ACSEQNO 
                || '|+|' ||CURRENCY || '|+|' ||  AMOUNT || '|+|' || PERIOD || '|+|' ||  CRFLAG  || '|+|' 
                || REMARK  || '|+|' || SAVEKIND || '|+|' ||   to_char(TRANSDATE , 'yyyyMMdd') || '|+|'
          from  IBS_MTAB_PJnlF2C 
          where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
