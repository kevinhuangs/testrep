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
@IBS_PTAB_JNL20130226.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_PTAB_JNLtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNLȫ������) IBS_PTAB_JNL*****' from dual;
spool off

#����ȫ�� IBS_PTAB_JNL_LOAN(��Ѻ������ǰ�������ˮ��)    20130221              ����ȫ��
spool /backup/batchdir/shells/data/all_log/2173IBS_PTAB_JNL_LOANtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_LOANȫ������) IBS_PTAB_JNL_LOAN*****' from dual;
spool off
@IBS_PTAB_JNL_LOAN20130226.sql
spool /backup/batchdir/shells/data/all_log/2174IBS_PTAB_JNL_LOANtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_LOANȫ������) IBS_PTAB_JNL_LOAN*****' from dual;
spool off

#����ȫ�� IBS_PTAB_JNL_FINANCE(��ƽ�����ˮ��)    20130221              ����ȫ��
spool /backup/batchdir/shells/data/all_log/2177IBS_PTAB_JNL_FINANCEtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_FINANCEȫ������) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off
@IBS_PTAB_JNL_FINANCE20130226.sql
spool /backup/batchdir/shells/data/all_log/2178IBS_PTAB_JNL_FINANCEtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_FINANCEȫ������) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off

#����ȫ�� IBS_PTAB_JNL_FUND(��ƽ�����ˮ��)    20130221              ����ȫ��
spool /backup/batchdir/shells/data/all_log/2181IBS_PTAB_JNL_FUNDtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_FUNDȫ������) IBS_PTAB_JNL_FUND*****' from dual;
spool off
@IBS_PTAB_JNL_FUND20130226.sql
spool /backup/batchdir/shells/data/all_log/2182IBS_PTAB_JNL_FUNDtmp.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_FUNDȫ������) IBS_PTAB_JNL_FUND*****' from dual;
spool off
#end by 20130221

exit
