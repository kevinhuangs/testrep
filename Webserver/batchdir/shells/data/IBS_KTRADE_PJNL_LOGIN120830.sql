spool ibs_ktrade_pjnl_login.tmp
set trimspool on
select
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
JNL_LOGINIP||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
LOGIN_TYPE||'|+|'||
JNL_REJCODE||'|+|'||
JNL_REJMESG||'|+|'||
LOGIN_HOST||'|+|'||
BATCHID||'|+|'||
CLIENTPATCHID||'|+|'||
JNL_NOTES||'|+|' 
FROM IBS_KTRADE_PJNL_LOGIN ;
spool off