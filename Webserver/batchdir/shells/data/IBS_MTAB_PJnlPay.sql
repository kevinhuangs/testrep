set heading off
spool ibs_mtab_pjnlpay.tmp
set trimspool on
select JNLNO  || '|+|' ||  
			 ACNO  || '|+|' || 
			 CURRENCY || '|+|' || 
			 AMOUNT || '|+|' || 
			 ORDERID  || '|+|' || 
			 MERCHANTID  || '|+|' || 
			 to_char(TRANSDATE, 'yyyyMMdd') || '|+|' || 
			 RANDOMSEQ || '|+|' || '' || '|+|' || 
			 OTHERPAY || '|+|' || 
			 CHANNEL || '|+|' 
			  from  IBS_MTAB_PJNLPAY 
			  where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
			  spool off
