spool a_nb_ibs_ptab_jnl_loan_20130226_000_000.dat
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||
AC_ORGANID||'|+|'||AC_NO||'|+|'||CURRENCY||'|+|'||AMOUNT||'|+|'||PERIOD||'|+|'||LOAN_NUMBER||'|+||+|'||LOAN_RATE||'|+|'
from IBS_PTAB_JNL_LOAN 
where jnl_date > to_date('20120829','yyyymmdd') 
and jnl_date < to_date('20130226','yyyymmdd') ;
--LOAN_NUMBER、LOAN_RATE中间的空字段对应SIGN_DATA(CLOB)
spool off