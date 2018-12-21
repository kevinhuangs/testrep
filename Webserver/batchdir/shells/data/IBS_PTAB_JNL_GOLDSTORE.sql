spool ibs_ptab_jnl_goldstore.tmp
set trimspool on
select JNL_NO||'|+|'||
       to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
       USER_ID||'|+|'||
       to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
       TRANS_CODE||'|+|'||
       TRANS_STATUS||'|+|'||
       AC_NO||'|+|'||
       AC_ORGANID||'|+|'||
       TRANS_PRICE||'|+|'||
       TRANS_SHARE||'|+|'||
       TRANS_AMOUNT||'|+|'||
       HANDLINGFEE||'|+|'||
       TRANS_SUM||'|+|'||
       JPDPROFITRATE||'|+|'||
       TRANS_TYPE||'|+|'||
       STARTMONTH||'|+|'||
       ENDMONTH||'|+|'||
       HOLDSHARE||'|+|'
  from IBS_PTAB_JNL_GOLDSTORE
 where JNL_DATE >= trunc(sysdate-1, 'dd')
   and JNL_DATE < trunc(sysdate, 'dd');
spool off