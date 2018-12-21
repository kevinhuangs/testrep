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


#add by zhanglei 20131106
spool /backup/batchdir/shells/data/all_log/3113IBS_MTAB_MP_USER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_MP_USER全量导出) IBS_MTAB_MP_USER*****' from dual;
spool off
@IBS_MTAB_MP_USER.sql
spool /backup/batchdir/shells/data/all_log/3114IBS_MTAB_MP_USER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_MP_USER全量导出) IBS_MTAB_MP_USER*****' from dual;
spool off


#add by zhanglei 20140102
spool /backup/batchdir/shells/data/all_log/3115IBS_MTAB_MP_AC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_MP_AC全量导出) IBS_MTAB_MP_AC*****' from dual;
spool off
@IBS_MTAB_MP_AC.sql
spool /backup/batchdir/shells/data/all_log/3116IBS_MTAB_MP_AC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_MP_AC全量导出) IBS_MTAB_MP_AC*****' from dual;
spool off

#add by zhanglei 20140804 begin
spool /backup/batchdir/shells/data/all_log/3117IBS_MTAB_PJNLTRANSFER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNLTRANSFER全量导出) IBS_MTAB_PJNLTRANSFER*****' from dual;
spool off
@IBS_MTAB_PJnlTransfer20140828.sql
spool /backup/batchdir/shells/data/all_log/3118IBS_MTAB_PJNLTRANSFER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNLTRANSFER全量导出) IBS_MTAB_PJNLTRANSFER*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/3119IBS_MTAB_MP_PJNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_MP_PJNL全量导出) IBS_MTAB_MP_PJNL*****' from dual;
spool off
@IBS_MTAB_MP_PJNL20140828.sql
spool /backup/batchdir/shells/data/all_log/3120IBS_MTAB_MP_PJNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_MP_PJNL全量导出) IBS_MTAB_MP_PJNL*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/3121IBS_MTAB_MP_PJNLQUERY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_MP_PJNLQUERY全量导出) IBS_MTAB_MP_PJNLQUERY*****' from dual;
spool off
@IBS_MTAB_MP_PJNLQUERY20140828.sql
spool /backup/batchdir/shells/data/all_log/3122IBS_MTAB_MP_PJNLQUERY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_MP_PJNLQUERY全量导出) IBS_MTAB_MP_PJNLQUERY*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/3123IBS_MTAB_PJNLASSETPOOL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNLASSETPOOL全量导出) IBS_MTAB_PJNLASSETPOOL*****' from dual;
spool off
@IBS_MTAB_PJNLASSETPOOL20140828.sql
spool /backup/batchdir/shells/data/all_log/3124IBS_MTAB_PJNLASSETPOOL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNLASSETPOOL全量导出) IBS_MTAB_PJNLASSETPOOL*****' from dual;
spool off 
#add by zhanglei 20140804 end

exit
