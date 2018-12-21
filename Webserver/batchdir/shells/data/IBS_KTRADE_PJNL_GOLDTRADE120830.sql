spool ibs_ktrade_pjnl_goldtrade.tmp
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
 FROM IBS_KTRADE_PJNL_GOLDTRADE;
spool off






