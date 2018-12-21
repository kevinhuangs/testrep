set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

spool /Webserver/batchdir/shells/data/add_log/2111IBS_ETAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_JNL增量导出) IBS_ETAB_JNL*****' from dual;
spool off
@IBS_ETAB_JNL.sql
spool /Webserver/batchdir/shells/data/add_log/2112IBS_ETAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_JNL增量导出) IBS_ETAB_JNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/2113IBS_ETAB_JNL2_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_JNL2增量导出) IBS_ETAB_JNL2*****' from dual;
spool off
@IBS_ETAB_JNL2.sql
spool /Webserver/batchdir/shells/data/add_log/2114IBS_ETAB_JNL2_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_JNL2增量导出) IBS_ETAB_JNL2*****' from dual;
spool off

exit;