set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

#add by dumingping 20130221------start
#增加全量 IBS_PTAB_JNL(对私日志记录表)    20130221              当日全量
spool /backup/batchdir/shells/data/all_log/2171IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL全量导出) IBS_PTAB_JNL*****' from dual;
spool off
@IBS_PTAB_JNL20130302.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL全量导出) IBS_PTAB_JNL*****' from dual;
spool off
#end by 20130221

exit
