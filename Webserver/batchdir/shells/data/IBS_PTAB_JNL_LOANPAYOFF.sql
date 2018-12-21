spool ibs_ptab_jnl_loanpayoff.tmp
set trimspool on
select JNL_NO||'|+|'||
		   to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
		   USER_ID||'|+|'||
		   TRANS_CODE||'|+|'||
		   TRANS_STATUS||'|+|'||
		   AC_ORGANID||'|+|'||
		   AC_NO||'|+|'||
		   DUEBILL_NO||'|+|'||
		   CONTRACT_NO||'|+|'||
		   PERIOD||'|+|'||
		   BEGIN_DATE||'|+|'||
		   END_DATE||'|+|'||
		   LOAN_AMOUNT||'|+|'||
		   INTEREST||'|+|'||
		   TOTAL_AMOUNT||'|+|'||
		   INTEREST_RATE||'|+|'||
		   ''||'|+|'||
		   VARIETY_LOANS||'|+|'||
		   LENDER_NAME||'|+|'||
		   REMAIN_PRINCIPAL_AMOUNT||'|+|'||
		   OVERDUE_PRINCIPAL_INTEREST||'|+|'||
		   CURRENCY||'|+|'||
		   REPAYMENT_TYPE||'|+|'||
		   REPAYMENT_PRINCIPAL||'|+|'||
		   OVERDUE_PRINCIPALINTEREST||'|+|'||
		   LOAN_STATUS||'|+|'||
		   PAY_DATE||'|+|'||
		   PAYER_ACNO||'|+|'||
		   PAY_REALDATE||'|+|'||
		   PROTO_NO||'|+|'
from IBS_PTAB_JNL_LOANPAYOFF
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off