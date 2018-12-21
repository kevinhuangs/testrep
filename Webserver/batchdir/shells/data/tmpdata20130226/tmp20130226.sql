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
@IBS_PTAB_JNL20130226.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL全量导出) IBS_PTAB_JNL*****' from dual;
spool off

#增加全量 IBS_PTAB_JNL_LOAN(质押贷款提前还款交易流水表)    20130221              当日全量
spool /backup/batchdir/shells/data/all_log/2173IBS_PTAB_JNL_LOANtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_LOAN全量导出) IBS_PTAB_JNL_LOAN*****' from dual;
spool off
@IBS_PTAB_JNL_LOAN20130226.sql
spool /backup/batchdir/shells/data/all_log/2174IBS_PTAB_JNL_LOANtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_LOAN全量导出) IBS_PTAB_JNL_LOAN*****' from dual;
spool off

#增加全量 IBS_PTAB_JNL_FINANCE(理财交易流水表)    20130221              当日全量
spool /backup/batchdir/shells/data/all_log/2177IBS_PTAB_JNL_FINANCEtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FINANCE全量导出) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off
@IBS_PTAB_JNL_FINANCE20130226.sql
spool /backup/batchdir/shells/data/all_log/2178IBS_PTAB_JNL_FINANCEtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FINANCE全量导出) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off

#增加全量 IBS_PTAB_JNL_FUND(理财交易流水表)    20130221              当日全量
spool /backup/batchdir/shells/data/all_log/2181IBS_PTAB_JNL_FUNDtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FUND全量导出) IBS_PTAB_JNL_FUND*****' from dual;
spool off
@IBS_PTAB_JNL_FUND20130226.sql
spool /backup/batchdir/shells/data/all_log/2182IBS_PTAB_JNL_FUNDtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FUND全量导出) IBS_PTAB_JNL_FUND*****' from dual;
spool off
#end by 20130221

exit
