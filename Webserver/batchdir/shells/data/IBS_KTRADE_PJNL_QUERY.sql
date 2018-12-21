spool ibs_ktrade_pjnl_query.tmp
SELECT 
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
USER_ID||'|+|'||
TRANS_CODE||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
LOGIN_HOST||'|+|'||
JNL_LOGINIP||'|+|'||
BATCHID||'|+|'||
CLIENTPATCHID||'|+|'||
JNL_NOTES||'|+|'
 FROM IBS_KTRADE_PJNL_QUERY
where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off