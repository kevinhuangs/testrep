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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /Webserver/batchdir/shells/data/all_log/2112IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2113IBS_PTAB_CIF_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_CIF_allȫ������) IBS_PTAB_CIF_all*****' from dual;
spool off
@IBS_PTAB_CIF_all.sql
spool /Webserver/batchdir/shells/data/all_log/2114IBS_PTAB_CIF_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_CIF_allȫ������) IBS_PTAB_CIF_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2115ibs_ptab_payee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(ibs_ptab_payeeȫ������) ibs_ptab_payee*****' from dual;
spool off
@ibs_ptab_payee.sql
spool /Webserver/batchdir/shells/data/all_log/2116ibs_ptab_payee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(ibs_ptab_payeeȫ������) ibs_ptab_payee*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/2117ibs_mtab_pjnl_counter_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_PJNL_COUNTERȫ������) IBS_MTAB_PJNL_COUNTER*****' from dual;
spool off
@IBS_MTAB_PJNL_COUNTER20111124.sql
spool /Webserver/batchdir/shells/data/all_log/2118ibs_mtab_pjnl_counter_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_PJNL_COUNTERȫ������) IBS_MTAB_PJNL_COUNTER*****' from dual;
spool off

exit
