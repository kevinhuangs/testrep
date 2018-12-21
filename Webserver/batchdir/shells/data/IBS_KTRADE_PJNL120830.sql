spool ibs_ktrade_pjnl.tmp
set trimspool on
SELECT 
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
JNL_REJCODE||'|+|'||
JNL_REJMESG||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
LOGIN_HOST||'|+|'||
JNL_LOGINIP||'|+|'||
HOST_TRANSACTION_CODE||'|+|'||
TRANS_GROUP||'|+|'||
REGI_CODE||'|+|'||
BATCHID||'|+|'||
CLIENTPATCHID||'|+|'||
JNL_NOTES||'|+|'
FROM IBS_KTRADE_PJNL;
spool off