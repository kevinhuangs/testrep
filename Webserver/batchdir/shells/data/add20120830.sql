set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

spool /backup/batchdir/shells/data/add_log/2111IBS_ETAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_ETAB_JNL��������) IBS_ETAB_JNL*****' from dual;
spool off
@IBS_ETAB_JNL.sql
spool /backup/batchdir/shells/data/add_log/2112IBS_ETAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_ETAB_JNL��������) IBS_ETAB_JNL*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2113IBS_ETAB_JNL2_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_ETAB_JNL2��������) IBS_ETAB_JNL2*****' from dual;
spool off
@IBS_ETAB_JNL2.sql
spool /backup/batchdir/shells/data/add_log/2114IBS_ETAB_JNL2_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_ETAB_JNL2��������) IBS_ETAB_JNL2*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2115IBS_MTAB_PJNL_COUNTER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_PJNL_COUNTER��������) IBS_MTAB_PJNL_COUNTER*****' from dual;
spool off
@IBS_MTAB_PJNL_COUNTER.sql
spool /backup/batchdir/shells/data/add_log/2116IBS_MTAB_PJNL_COUNTER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_PJNL_COUNTER��������) IBS_MTAB_PJNL_COUNTER*****' from dual;
spool off

#11�ű�����
spool /backup/batchdir/shells/data/add_log/2117IBS_PTAB_FAILLOGIN_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_FAILLOGIN��������) IBS_PTAB_FAILLOGIN*****' from dual;
spool off
@IBS_PTAB_FAILLOGIN.sql
spool /backup/batchdir/shells/data/add_log/2118IBS_PTAB_FAILLOGIN_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_FAILLOGIN��������) IBS_PTAB_FAILLOGIN*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2119IBS_PTAB_FALLQUEUE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_FALLQUEUE��������) IBS_PTAB_FALLQUEUE*****' from dual;
spool off
@IBS_PTAB_FALLQUEUE.sql
spool /backup/batchdir/shells/data/add_log/2120IBS_PTAB_FALLQUEUE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_FALLQUEUE��������) IBS_PTAB_FALLQUEUE*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2121IBS_PTAB_JNL_CHANGER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_CHANGER��������) IBS_PTAB_JNL_CHANGER*****' from dual;
spool off
@IBS_PTAB_JNL_CHANGER.sql
spool /backup/batchdir/shells/data/add_log/2122IBS_PTAB_JNL_CHANGER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_CHANGER��������) IBS_PTAB_JNL_CHANGER*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2123IBS_PTAB_JNL_ENTRUSTTRANSER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_ENTRUSTTRANSER��������) IBS_PTAB_JNL_ENTRUSTTRANSER*****' from dual;
spool off
@IBS_PTAB_JNL_ENTRUSTTRANSER.sql
spool /backup/batchdir/shells/data/add_log/2124IBS_PTAB_JNL_ENTRUSTTRANSER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_ENTRUSTTRANSER��������) IBS_PTAB_JNL_ENTRUSTTRANSER*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2125IBS_PTAB_JNL_PERFORCHANGE1_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_PERFORCHANGE1��������) IBS_PTAB_JNL_PERFORCHANGE1*****' from dual;
spool off
@IBS_PTAB_JNL_PERFORCHANGE1.sql
spool /backup/batchdir/shells/data/add_log/2126IBS_PTAB_JNL_PERFORCHANGE1_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_PERFORCHANGE1��������) IBS_PTAB_JNL_PERFORCHANGE1*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2127IBS_PTAB_JNL_PERFORCHANGE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_PERFORCHANGE��������) IBS_PTAB_JNL_PERFORCHANGE*****' from dual;
spool off
@IBS_PTAB_JNL_PERFORCHANGE.sql
spool /backup/batchdir/shells/data/add_log/2128IBS_PTAB_JNL_PERFORCHANGE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_PERFORCHANGE��������) IBS_PTAB_JNL_PERFORCHANGE*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2129IBS_PTAB_JNL_POINTS_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_POINTS��������) IBS_PTAB_JNL_POINTS*****' from dual;
spool off
@IBS_PTAB_JNL_POINTS.sql
spool /backup/batchdir/shells/data/add_log/2130IBS_PTAB_JNL_POINTS_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_POINTS��������) IBS_PTAB_JNL_POINTS*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2131IBS_PTAB_JNL_RENT_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_RENT��������) IBS_PTAB_JNL_RENT*****' from dual;
spool off
@IBS_PTAB_JNL_RENT.sql
spool /backup/batchdir/shells/data/add_log/2132IBS_PTAB_JNL_RENT_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_RENT��������) IBS_PTAB_JNL_RENT*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2133IBS_PTAB_JNL_SAVEANDLOANLOST_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_SAVEANDLOANLOST��������) IBS_PTAB_JNL_SAVEANDLOANLOST*****' from dual;
spool off
@IBS_PTAB_JNL_SAVEANDLOANLOST.sql
spool /backup/batchdir/shells/data/add_log/2134IBS_PTAB_JNL_SAVEANDLOANLOST_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_SAVEANDLOANLOST��������) IBS_PTAB_JNL_SAVEANDLOANLOST*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2135IBS_PTAB_JNL_USERSET_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_USERSET��������) IBS_PTAB_JNL_USERSET*****' from dual;
spool off
@IBS_PTAB_JNL_USERSET.sql
spool /backup/batchdir/shells/data/add_log/2136IBS_PTAB_JNL_USERSET_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_USERSET��������) IBS_PTAB_JNL_USERSET*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2137IBS_PTAB_SCHEDULETRS_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_SCHEDULETRS��������) IBS_PTAB_SCHEDULETRS*****' from dual;
spool off
@IBS_PTAB_SCHEDULETRS.sql
spool /backup/batchdir/shells/data/add_log/2138IBS_PTAB_SCHEDULETRS_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_SCHEDULETRS��������) IBS_PTAB_SCHEDULETRS*****' from dual;
spool off





#add by dumingping 20120312------start
spool /backup/batchdir/shells/data/add_log/2139IBS_DTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_DTAB_JNL_TRANSFER��������) IBS_DTAB_JNL_TRANSFER*****' from dual;
spool off
@IBS_DTAB_JNL_TRANSFER.sql
spool /backup/batchdir/shells/data/add_log/2140IBS_DTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_DTAB_JNL_TRANSFER��������) IBS_DTAB_JNL_TRANSFER*****' from dual;
spool off



spool /backup/batchdir/shells/data/add_log/2141IBS_DTAB_JNL_USERSET.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_DTAB_JNL_USERSET��������) IBS_DTAB_JNL_USERSET*****' from dual;
spool off
@IBS_DTAB_JNL_USERSET.sql
spool /backup/batchdir/shells/data/add_log/2142IBS_DTAB_JNL_USERSET.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_DTAB_JNL_USERSET��������) IBS_DTAB_JNL_USERSET*****' from dual;
spool off

#add by dumingping 20120312------end



exit;