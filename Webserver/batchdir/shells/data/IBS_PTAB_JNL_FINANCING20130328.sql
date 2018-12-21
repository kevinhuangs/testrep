spool ibs_ptab_jnl_financing.tmp
SELECT 
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
USER_ID||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||
CONTRACTNO||'|+|'||
ACCTNO2||'|+|'||
ZFJINE||'|+|'||
ZFJINE1||'|+|'||
BUSINESSTYPENAME||'|+|'||
CUSTOMERNAME||'|+|'||
BUSINESSRATE||'|+|'||
PUTOUTDATE||'|+|'||
MATURITY||'|+|'||
LOANTERM||'|+|'||
OPERATEORGID||'|+|'||
DRAWINGTYPE||'|+|'||
PURPOSE||'|+|'||
BUSINESSSUM||'|+|'||
PAYMETHOD||'|+|'||
PAYMENTACCTNO||'|+|'||
ACCTNAME2||'|+|'||
ACCTBANK2||'|+|'||
ACCTNUM2||'|+|'||
DQKYSUM||'|+|'||
LOANTERMFLAG||'|+|'
FROM IBS_PTAB_JNL_FINANCING;
spool off