set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    TO_CHAR(JNL_DATE, 'yyyyMMdd')
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
                                FROM IBS_PTAB_JNL_BILLSET a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_billset',
                                   '.tmp'));
