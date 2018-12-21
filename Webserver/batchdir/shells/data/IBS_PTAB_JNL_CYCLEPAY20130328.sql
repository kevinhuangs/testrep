spool ibs_ptab_jnl_cyclepay.tmp
set trimspool on
select JNL_NO||'|+|'||
			 to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
			 USER_ID||'|+|'||
			 TRANS_CODE||'|+|'||
			 TRANS_STATUS||'|+|'||
			 AC_NO||'|+|'||
			 AC_NO2||'|+|'||
			 AC2_NONAME||'|+|'||
			 AC_ORGANNAME||'|+|'||
			 AMOUNT||'|+|'||
			 CURRENCY||'|+|'||
			 DEAL_TYPE||'|+|'||
			 AGREEMENT_NO||'|+|'||
			 ENDDATE||'|+|'||
			 AC2_ORGANNAME||'|+|'||
			 AC_NONAME||'|+|'||
			 PAYMODLE||'|+|'||
			 REMARK||'|+|'||
			 AC_TYPE||'|+|'||
			 PAYTIME||'|+|'
from IBS_PTAB_JNL_CYCLEPAY;
spool off