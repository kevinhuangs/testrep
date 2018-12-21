spool ibs_ptab_jnl_billset.tmp
set trimspool on
SELECT TO_CHAR(JNL_DATE, 'yyyyMMdd')
	||'|+|'||JNL_NO
	||'|+|'||USER_ID
	||'|+|'||TRANS_CODE
	||'|+|'||TRANS_STATUS
	||'|+|'||AC_NO
	||'|+|'||BILL_MOUTH
	||'|+|'||CURRENCY
	||'|+|'||AVAILABLE_AMOUNT
	||'|+|'||APPLY_AMOUNT
	||'|+|'||BILL_NUM
	||'|+|'||FEE_RATE
	||'|+|'||FEE
	||'|+|'||FACT_FEE
	||'|+|'||SQPAY_AMOUNT
	||'|+|'||PAY_AMOUNT
	||'|+|'||NOPAY_AMOUNT
	||'|+|'
FROM IBS_PTAB_JNL_BILLSET
where JNL_DATE >= trunc(sysdate-1, 'dd') 
  and JNL_DATE <  trunc(sysdate,   'dd');
spool off
