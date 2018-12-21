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

#add by songlei 20130627
#����ȫ�� IBS_PTAB_JNL_TRANSFER(��˽����ת����ˮ��)    20130627              ����ȫ��
spool /backup/batchdir/shells/data/all_log/3113IBS_PTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_TRANSFERȫ������) IBS_PTAB_JNL_TRANSFER*****' from dual;
spool off
@IBS_PTAB_JNL_TRANSFER20130627.sql
spool /backup/batchdir/shells/data/all_log/3114IBS_PTAB_JNL_TRANSFER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_TRANSFERȫ������) IBS_PTAB_JNL_TRANSFER*****' from dual;
spool off

#����ȫ�� IBS_MTAB_PJNLPAY(֧����־��)    20130627              ����ȫ��
spool /backup/batchdir/shells/data/all_log/3115IBS_MTAB_PJNLPAY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_PJNLPAYȫ������) IBS_MTAB_PJNLPAY*****' from dual;
spool off
@IBS_MTAB_PJNLPAY20130627.sql
spool /backup/batchdir/shells/data/all_log/3116IBS_MTAB_PJNLPAY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_PJNLPAYȫ������) IBS_MTAB_PJNLPAY*****' from dual;
spool off
#end by 20130627


#add by wangyiming 20130709
spool /backup/batchdir/shells/data/all_log/3117IBS_PTAB_JNL_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_FINANCEȫ������) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off
@IBS_PTAB_JNL_FINANCE20130725.sql
spool /backup/batchdir/shells/data/all_log/3118IBS_PTAB_JNL_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_FINANCEȫ������) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off
exit