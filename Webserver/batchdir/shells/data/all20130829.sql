set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

#add by fangxianwan 20110414
spool /backup/batchdir/shells/data/all_log/3111IBS_PTAB_USER_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /backup/batchdir/shells/data/all_log/3112IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off

#add by dumingping 20130731
spool /backup/batchdir/shells/data/all_log/3113IBS_PTAB_JNL_BILLSET_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_BILLSET全量导出) IBS_PTAB_JNL_BILLSET*****' from dual;
spool off
@IBS_PTAB_JNL_BILLSET20130829.sql
spool /backup/batchdir/shells/data/all_log/3114IBS_PTAB_JNL_BILLSET_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_BILLSET全量导出) IBS_PTAB_JNL_BILLSET*****' from dual;
spool off

exit
