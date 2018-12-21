spool ibs_ktrade_pjnl_goldtrade.tmp
SELECT 
JNL_NO||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
USER_ID||'|+|'||
to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
AC_NO||'|+|'||
AC_ORGANID||'|+|'||
HYDAMA||'|+|'||
JYFAXI||'|+|'||
to_char(WEITSJ,'yyyyMMdd')||'|+|'||
ENTRUSTPRICE||'|+|'||
ENTRUSTAMOUNT||'|+|'||
WTLISH||'|+|'||
WEITZT||'|+|'||
CJSHUL||'|+|'||
WEITLX||'|+|'||
KAIPBZ||'|+|'
 FROM IBS_KTRADE_PJNL_GOLDTRADE
where JNL_DATE >= trunc(sysdate-1, 'dd')
and JNL_DATE < trunc(sysdate, 'dd') ;
spool off