spool ibs_ktrade_pjnl_goldcash.tmp
select
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
TRANS_TYPE||'|+|'||
TRANS_AMOUNT||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
GOLD_JNLNO||'|+|' 
FROM IBS_KTRADE_PJNL_GOLDCASH 
where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off



