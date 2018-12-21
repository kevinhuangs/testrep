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

#add by lyf 20140509
spool /backup/batchdir/shells/data/all_log/3117IBS_PTAB_JNL_GOLDEXCHANGE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_GOLDEXCHANGE全量导出) IBS_PTAB_JNL_GOLDEXCHANGE*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDEXCHANGE20140529.sql
spool /backup/batchdir/shells/data/all_log/3118IBS_PTAB_JNL_GOLDEXCHANGE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_GOLDEXCHANGE全量导出) IBS_PTAB_JNL_GOLDEXCHANGE*****' from dual;
spool off

#add by lyf 20140509
spool /backup/batchdir/shells/data/all_log/3119IBS_PTAB_JNL_GOLDSTOREE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_GOLDSTORE全量导出) IBS_PTAB_JNL_GOLDSTORE*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDSTORE20140529.sql
spool /backup/batchdir/shells/data/all_log/3120IBS_PTAB_JNL_GOLDSTORE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_GOLDSTORE全量导出) IBS_PTAB_JNL_GOLDSTORE*****' from dual;
spool off


exit
