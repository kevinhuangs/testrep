set heading off
spool ibs_mtab_pjnlfund.tmp
set trimspool on
select JNLNO  || '|+|' ||  ACNO  || '|+|' || FUNDCODE || '|+|' || AMOUNT || '|+|'
              || FUNDCODE2  || '|+|' || BUYFLAG || '|+|' ||  PROFITFLAG || '|+|' || REDEEMFLAG  || '|+|' 
              || to_char(CONSIGNDATE, 'yyyyMMdd') || '|+|' || CONSIGNAMOUNT  || '|+|' || BARGAINNO    || '|+|' ||  to_char(TRANSDATE, 'yyyyMMdd') || '|+|'
            from  IBS_MTAB_PJNLFUND 
            where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off
