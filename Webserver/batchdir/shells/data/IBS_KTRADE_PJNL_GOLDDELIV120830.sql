spool ibs_ktrade_pjnl_golddeliv.tmp
set trimspool on
SELECT 
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
TRANS_FLAG||'|+|'||
DELIV_SEQNO||'|+|'||
CONTRACT_CODE||'|+|'||
DELIV_AMT||'|+|'||
DELIVER_NAME||'|+|'||
DELIVER_CERTTYPE||'|+|'||
DELIVER_CERTNO||'|+|'||
DELIV_CITY||'|+|'||
to_char(APPLY_DATE,'yyyyMMdd')||'|+|'
 FROM IBS_KTRADE_PJNL_GOLDDELIV;
spool off