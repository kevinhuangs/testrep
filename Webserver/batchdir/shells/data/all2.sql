set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 


spool /backup/batchdir/shells/data/all_log/2113IBS_PTAB_CIF_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off
@IBS_PTAB_CIF_all.sql
spool /backup/batchdir/shells/data/all_log/2114IBS_PTAB_CIF_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2115ibs_ptab_payee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off
@ibs_ptab_payee.sql
spool /backup/batchdir/shells/data/all_log/2116ibs_ptab_payee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off




#增加全量 IBS_PTAB_CERTTYPE    20120208               每日全量
spool /backup/batchdir/shells/data/all_log/2157IBS_PTAB_CERTTYPE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_CERTTYPE全量导出) IBS_PTAB_CERTTYPE*****' from dual;
spool off
@IBS_PTAB_CERTTYPE.sql
spool /backup/batchdir/shells/data/all_log/2158IBS_PTAB_CERTTYPE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_CERTTYPE全量导出) IBS_PTAB_CERTTYPE*****' from dual;
spool off
#增加全量 IBS_PTAB_CERTTYPE    20120208               每日全量


#add by dumingping 20120312------start
#增加全量 IBS_DTAB_USER    20120312               每日全量
spool /backup/batchdir/shells/data/all_log/2159IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_DTAB_USER全量导出) IBS_DTAB_USER*****' from dual;
spool off
@IBS_DTAB_USER.sql
spool /backup/batchdir/shells/data/all_log/2160IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_DTAB_USER全量导出) IBS_DTAB_USER*****' from dual;
spool off


#add by dumingping 20120312------end

#add by fangxianwan 20120503------start
#增加全量 IBS_ETAB_AC_FINANCE    20120503               每日全量
spool /backup/batchdir/shells/data/all_log/2161IBS_ETAB_AC_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_AC_FINANCE全量导出) IBS_ETAB_AC_FINANCE*****' from dual;
spool off
@IBS_ETAB_AC_FINANCE.sql
spool /backup/batchdir/shells/data/all_log/2162IBS_ETAB_AC_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_AC_FINANCE全量导出) IBS_ETAB_AC_FINANCE*****' from dual;
spool off
#end by 20120514

#add by dump 20121228------start
#增加全量 IBS_PTAB_MICROENTAC(小微对公账号表)    20121228              每日全量
spool /backup/batchdir/shells/data/all_log/2163IBS_PTAB_MICROENTAC.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_MICROENTAC全量导出) IBS_PTAB_MICROENTAC*****' from dual;
spool off
@IBS_PTAB_MICROENTAC.sql
spool /backup/batchdir/shells/data/all_log/2164IBS_PTAB_MICROENTAC.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_MICROENTAC全量导出) IBS_PTAB_MICROENTAC*****' from dual;
spool off

#增加全量 IBS_PTAB_SMALL_PERWANT(小微网银现在我要设置表)    20121228              每日全量
spool /backup/batchdir/shells/data/all_log/2165IBS_PTAB_SMALL_PERWANT.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_SMALL_PERWANT全量导出) IBS_PTAB_SMALL_PERWANT*****' from dual;
spool off
@IBS_PTAB_SMALL_PERWANT.sql
spool /backup/batchdir/shells/data/all_log/2166IBS_PTAB_SMALL_PERWANT.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_SMALL_PERWANT全量导出) IBS_PTAB_SMALL_PERWANT*****' from dual;
spool off

#增加全量 IBS_PTAB_SMALL_TRANNAME(小微网银交易码表)    20121228              每日全量
spool /backup/batchdir/shells/data/all_log/2167IBS_PTAB_SMALL_TRANNAME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_SMALL_TRANNAME全量导出) IBS_PTAB_SMALL_TRANNAME*****' from dual;
spool off
@IBS_PTAB_SMALL_TRANNAME.sql
spool /backup/batchdir/shells/data/all_log/2168IBS_PTAB_SMALL_TRANNAME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_SMALL_TRANNAME全量导出) IBS_PTAB_SMALL_TRANNAME*****' from dual;
spool off

#增加全量 IBS_PTAB_SMALL_WANTDO(小微网银现在我要表)    20121228              每日全量
spool /backup/batchdir/shells/data/all_log/2169IBS_PTAB_SMALL_WANTDO.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_SMALL_WANTDO全量导出) IBS_PTAB_SMALL_WANTDO*****' from dual;
spool off
@IBS_PTAB_SMALL_WANTDO.sql
spool /backup/batchdir/shells/data/all_log/2170IBS_PTAB_SMALL_WANTDO.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_SMALL_WANTDO全量导出) IBS_PTAB_SMALL_WANTDO*****' from dual;
spool off
#end by 20121228


#add by nixy 20130328------start
#增加全量 IBS_ETAB_CIF_FOREXINFO(对公外汇业务客户信息表)    20130328              每日全量
spool /backup/batchdir/shells/data/all_log/2171IBS_ETAB_CIF_FOREXINFO.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_CIF_FOREXINFO全量导出) IBS_ETAB_CIF_FOREXINFO*****' from dual;
spool off
@IBS_ETAB_CIF_FOREXINFO.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_ETAB_CIF_FOREXINFO.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_CIF_FOREXINFO全量导出) IBS_ETAB_CIF_FOREXINFO*****' from dual;
spool off
#end by 20130328


exit
