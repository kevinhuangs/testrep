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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /backup/batchdir/shells/data/all_log/3112IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off


#add by zhanglei 20131106
spool /backup/batchdir/shells/data/all_log/3113IBS_MTAB_MP_USER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_USERȫ������) IBS_MTAB_MP_USER*****' from dual;
spool off
@IBS_MTAB_MP_USER.sql
spool /backup/batchdir/shells/data/all_log/3114IBS_MTAB_MP_USER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_USERȫ������) IBS_MTAB_MP_USER*****' from dual;
spool off

#add by zhanglei 20131106
spool /backup/batchdir/shells/data/all_log/3115IBS_MTAB_PJnlAccess20131128_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_PJnlAccessȫ������) IBS_MTAB_PJnlAccess*****' from dual;
spool off
@IBS_MTAB_PJnlAccess20131128.sql
spool /backup/batchdir/shells/data/all_log/3116IBS_MTAB_PJnlAccess20131128_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_PJnlAccessȫ������) IBS_MTAB_PJnlAccess*****' from dual;
spool off

#add by pengxiaomei 20131030
spool /backup/batchdir/shells/data/all_log/3117IBS_MTAB_MP_PJNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_PJNLȫ������)IBS_MTAB_MP_PJNL*****' from dual;
spool off
@IBS_MTAB_MP_PJNL20131128.sql
spool /backup/batchdir/shells/data/all_log/3118IBS_MTAB_MP_PJNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_PJNLȫ������)IBS_MTAB_MP_PJNL*****' from dual;
spool off

#add by chenyanan 20131030
spool /backup/batchdir/shells/data/all_log/3119IBS_MTAB_MP_PJNLQUERY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_PJNLQUERYȫ������) IBS_MTAB_MP_PJNLQUERY*****' from dual;
spool off
@IBS_MTAB_MP_PJNLQUERY20131128.sql
spool /backup/batchdir/shells/data/all_log/3120IBS_MTAB_MP_PJNLQUERY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_PJNLQUERYȫ������) IBS_MTAB_MP_PJNLQUERY*****' from dual;
spool off


exit
