set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

#add by dumingping 20130221------start
#����ȫ�� IBS_PTAB_JNL(��˽��־��¼��)    20130221              ����ȫ��
spool /backup/batchdir/shells/data/all_log/2171IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNLȫ������) IBS_PTAB_JNL*****' from dual;
spool off
@IBS_PTAB_JNL20130302.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNLȫ������) IBS_PTAB_JNL*****' from dual;
spool off
#end by 20130221

exit
