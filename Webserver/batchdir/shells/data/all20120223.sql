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



#增加12张全量 20120208



spool /Webserver/batchdir/shells/data/all_log/2119ibs_ptab_scheduletrs_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_scheduletrs全量导出) ibs_ptab_scheduletrs*****' from dual;
spool off
@IBS_PTAB_SCHEDULETRS20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2120ibs_ptab_scheduletrs_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_scheduletrs全量导出) ibs_ptab_scheduletrs*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2121ibs_ptab_jnl_userset_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_userset全量导出) ibs_ptab_jnl_userset*****' from dual;
spool off
@IBS_PTAB_JNL_USERSET20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2122ibs_ptab_jnl_userset_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_userset全量导出) ibs_ptab_jnl_userset*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2123ibs_ptab_jnl_saveandloanlost_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_saveandloanlost全量导出) ibs_ptab_jnl_saveandloanlost*****' from dual;
spool off
@IBS_PTAB_JNL_SAVEANDLOANLOST20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2124ibs_ptab_jnl_saveandloanlost_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_saveandloanlost全量导出) ibs_ptab_jnl_saveandloanlost*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2125ibs_ptab_jnl_rent_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_rent全量导出) ibs_ptab_jnl_rent*****' from dual;
spool off
@IBS_PTAB_JNL_RENT20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2126ibs_ptab_jnl_rent_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_rent全量导出) ibs_ptab_jnl_rent*****' from dual;
spool off


spool /Webserver/batchdir/shells/data/all_log/2129ibs_ptab_jnl_points_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_points全量导出) ibs_ptab_jnl_points*****' from dual;
spool off
@IBS_PTAB_JNL_POINTS20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2130ibs_ptab_jnl_points_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_points全量导出) ibs_ptab_jnl_points*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2131ibs_ptab_jnl_perforchange1_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_perforchange1全量导出) ibs_ptab_jnl_perforchange1*****' from dual;
spool off
@IBS_PTAB_JNL_PERFORCHANGE120120223.sql
spool /Webserver/batchdir/shells/data/all_log/2132ibs_ptab_jnl_perforchange1_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_perforchange1全量导出) ibs_ptab_jnl_perforchange1*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2133ibs_ptab_jnl_perforchange_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_perforchange全量导出) ibs_ptab_jnl_perforchange*****' from dual;
spool off
@IBS_PTAB_JNL_PERFORCHANGE20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2134ibs_ptab_jnl_perforchange_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_perforchange全量导出) ibs_ptab_jnl_perforchange*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2137ibs_ptab_jnl_entrusttranser_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_entrusttranser全量导出) ibs_ptab_jnl_entrusttranser*****' from dual;
spool off
@IBS_PTAB_JNL_ENTRUSTTRANSER20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2138ibs_ptab_jnl_entrusttranser_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_entrusttranser全量导出) ibs_ptab_jnl_entrusttranser*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2143ibs_ptab_jnl_changer_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_jnl_changer全量导出) ibs_ptab_jnl_changer*****' from dual;
spool off
@IBS_PTAB_JNL_CHANGER20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2144ibs_ptab_jnl_changer_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_jnl_changer全量导出) ibs_ptab_jnl_changer*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2145ibs_ptab_fallqueue_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_fallqueue全量导出) ibs_ptab_fallqueue*****' from dual;
spool off
@IBS_PTAB_FALLQUEUE20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2146ibs_ptab_fallqueue_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_fallqueue全量导出) ibs_ptab_fallqueue*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2147ibs_ptab_faillogin_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_faillogin全量导出) ibs_ptab_faillogin*****' from dual;
spool off
@IBS_PTAB_FAILLOGIN20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2148ibs_ptab_faillogin_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_faillogin全量导出) ibs_ptab_faillogin*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2149ibs_ptab_certtype_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_certtype全量导出) ibs_ptab_certtype*****' from dual;
spool off
@IBS_PTAB_CERTTYPE20120223.sql
spool /Webserver/batchdir/shells/data/all_log/2150ibs_ptab_certtype_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_certtype全量导出) ibs_ptab_certtype*****' from dual;
spool off

#add by huangshuai 20120208 end

exit
