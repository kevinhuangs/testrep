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


#add by zhanglei 20140102
spool /backup/batchdir/shells/data/all_log/3115IBS_MTAB_MP_AC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_ACȫ������) IBS_MTAB_MP_AC*****' from dual;
spool off
@IBS_MTAB_MP_AC.sql
spool /backup/batchdir/shells/data/all_log/3116IBS_MTAB_MP_AC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_ACȫ������) IBS_MTAB_MP_AC*****' from dual;
spool off

#add by pengxiaomei 20140624
spool /backup/batchdir/shells/data/all_log/3117IBS_MTAB_MP_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_PJNLASSETPOOLȫ������) IBS_MTAB_MP_PJNLASSETPOOL*****' from dual;
spool off
@IBS_MTAB_MP_PJNLASSETPOOL20140724.sql
spool /backup/batchdir/shells/data/all_log/3118IBS_MTAB_MP_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_PJNLASSETPOOLȫ������) IBS_MTAB_MP_PJNLASSETPOOL*****' from dual;
spool off

exit
