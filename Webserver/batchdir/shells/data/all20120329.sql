set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

#add by fangxianwan 20110414
spool /Webserver/batchdir/shells/data/all_log/2111IBS_PTAB_USER_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /Webserver/batchdir/shells/data/all_log/2112IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2113IBS_PTAB_CIF_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off
@IBS_PTAB_CIF_all.sql
spool /Webserver/batchdir/shells/data/all_log/2114IBS_PTAB_CIF_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2115ibs_ptab_payee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off
@ibs_ptab_payee.sql
spool /Webserver/batchdir/shells/data/all_log/2116ibs_ptab_payee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off

#增加全量 IBS_PTAB_CERTTYPE    20120208               每日全量
spool /Webserver/batchdir/shells/data/all_log/2157IBS_PTAB_CERTTYPE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_CERTTYPE全量导出) IBS_PTAB_CERTTYPE*****' from dual;
spool off
@IBS_PTAB_CERTTYPE.sql
spool /Webserver/batchdir/shells/data/all_log/2158IBS_PTAB_CERTTYPE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_CERTTYPE全量导出) IBS_PTAB_CERTTYPE*****' from dual;
spool off
#增加全量 IBS_PTAB_CERTTYPE    20120208               每日全量

#add by dumingping增加全量 IBS_DTAB_USER    20120312               每日全量
spool /Webserver/batchdir/shells/data/all_log/2159IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_DTAB_USER全量导出) IBS_DTAB_USER*****' from dual;
spool off
@IBS_DTAB_USER120329.sql
spool /Webserver/batchdir/shells/data/all_log/2160IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_DTAB_USER全量导出) IBS_DTAB_USER*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2161IBS_DTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_DTAB_JNL_TRANSFER全量导出) IBS_DTAB_JNL_TRANSFER*****' from dual;
spool off
@IBS_DTAB_JNL_TRANSFER120329.sql
spool /Webserver/batchdir/shells/data/all_log/2162IBS_DTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_DTAB_JNL_TRANSFER全量导出) IBS_DTAB_JNL_TRANSFER*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2163IBS_DTAB_JNL_USERSET.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_DTAB_JNL_USERSET全量导出) IBS_DTAB_JNL_USERSET*****' from dual;
spool off
@IBS_DTAB_JNL_USERSET120329.sql
spool /Webserver/batchdir/shells/data/all_log/2164IBS_DTAB_JNL_USERSET.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_DTAB_JNL_USERSET全量导出) IBS_DTAB_JNL_USERSET*****' from dual;
spool off

exit
