set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

#add by fangxianwan 20110414
spool /backup/batchdir/shells/data/all_log/2111IBS_PTAB_USER_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /backup/batchdir/shells/data/all_log/2112IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_USER_allȫ������) IBS_PTAB_USER_all*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2113IBS_PTAB_CIF_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_CIF_allȫ������) IBS_PTAB_CIF_all*****' from dual;
spool off
@IBS_PTAB_CIF_all.sql
spool /backup/batchdir/shells/data/all_log/2114IBS_PTAB_CIF_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_CIF_allȫ������) IBS_PTAB_CIF_all*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2115ibs_ptab_payee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(ibs_ptab_payeeȫ������) ibs_ptab_payee*****' from dual;
spool off
@ibs_ptab_payee.sql
spool /backup/batchdir/shells/data/all_log/2116ibs_ptab_payee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(ibs_ptab_payeeȫ������) ibs_ptab_payee*****' from dual;
spool off




#����ȫ�� IBS_PTAB_CERTTYPE    20120208               ÿ��ȫ��
spool /backup/batchdir/shells/data/all_log/2157IBS_PTAB_CERTTYPE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_CERTTYPEȫ������) IBS_PTAB_CERTTYPE*****' from dual;
spool off
@IBS_PTAB_CERTTYPE.sql
spool /backup/batchdir/shells/data/all_log/2158IBS_PTAB_CERTTYPE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_CERTTYPEȫ������) IBS_PTAB_CERTTYPE*****' from dual;
spool off
#����ȫ�� IBS_PTAB_CERTTYPE    20120208               ÿ��ȫ��


#add by dumingping 20120312------start
#����ȫ�� IBS_DTAB_USER    20120312               ÿ��ȫ��
spool /backup/batchdir/shells/data/all_log/2159IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_DTAB_USERȫ������) IBS_DTAB_USER*****' from dual;
spool off
@IBS_DTAB_USER.sql
spool /backup/batchdir/shells/data/all_log/2160IBS_DTAB_USER.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_DTAB_USERȫ������) IBS_DTAB_USER*****' from dual;
spool off


#add by dumingping 20120312------end

#add by fangxianwan 20120503------start
#����ȫ�� IBS_ETAB_AC_FINANCE    20120503               ÿ��ȫ��
spool /backup/batchdir/shells/data/all_log/2161IBS_ETAB_AC_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_ETAB_AC_FINANCEȫ������) IBS_ETAB_AC_FINANCE*****' from dual;
spool off
@IBS_ETAB_AC_FINANCE.sql
spool /backup/batchdir/shells/data/all_log/2162IBS_ETAB_AC_FINANCE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_ETAB_AC_FINANCEȫ������) IBS_ETAB_AC_FINANCE*****' from dual;
spool off
#end by 20120514

#add by wangyiming 20120814------end
spool /backup/batchdir/shells/data/all_log/2163IBS_MTAB_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_PJNLASSETPOOLȫ������) IBS_MTAB_PJNLASSETPOOL*****' from dual;
spool off
@IBS_MTAB_PJNLASSETPOOL120830.sql
spool /backup/batchdir/shells/data/all_log/2164IBS_MTAB_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_PJNLASSETPOOLȫ������) IBS_MTAB_PJNLASSETPOOL*****' from dual;
spool off
#end by 20120814

#add by dumingping 20120817------start
#add by dumingping����ȫ���� ������ͻ������ն���Ŀ��һ�ڣ�-������֣�IBS_KTRADE_PJNL ��6�����ȫ��   20120830               20120830��ȫ��
spool /backup/batchdir/shells/data/all_log/2165IBS_KTRADE_PJNL_QUERY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_QUERYȫ������) IBS_KTRADE_PJNL_QUERY*****' from dual;
spool off
@IBS_KTRADE_PJNL_QUERY120830.sql
spool /backup/batchdir/shells/data/all_log/2166IBS_KTRADE_PJNL_QUERY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_DTAB_JNL_USERSETȫ������) IBS_KTRADE_PJNL_QUERY*****' from dual;
spool off


spool /backup/batchdir/shells/data/all_log/2167IBS_KTRADE_PJNL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNLȫ������) IBS_KTRADE_PJNL*****' from dual;
spool off
@IBS_KTRADE_PJNL120830.sql
spool /backup/batchdir/shells/data/all_log/2168IBS_KTRADE_PJNL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNLȫ������) IBS_KTRADE_PJNL*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2169IBS_KTRADE_PJNL_LOGIN.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_LOGINȫ������) IBS_KTRADE_PJNL_LOGIN*****' from dual;
spool off
@IBS_KTRADE_PJNL_LOGIN120830.sql
spool /backup/batchdir/shells/data/all_log/2170IBS_KTRADE_PJNL_LOGIN.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_LOGINȫ������) IBS_KTRADE_PJNL_LOGIN*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2171IBS_KTRADE_PJNL_GOLDCASH.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDCASHȫ������) IBS_KTRADE_PJNL_GOLDCASH*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDCASH120830.sql
spool /backup/batchdir/shells/data/all_log/2172IBS_KTRADE_PJNL_GOLDCASH.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDCASHȫ������) IBS_KTRADE_PJNL_GOLDCASH*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2173IBS_KTRADE_PJNL_GOLDTRADE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDTRADEȫ������) IBS_KTRADE_PJNL_GOLDTRADE*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDTRADE120830.sql
spool /backup/batchdir/shells/data/all_log/2174IBS_KTRADE_PJNL_GOLDTRADE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDTRADEȫ������) IBS_KTRADE_PJNL_GOLDTRADE*****' from dual;
spool off

spool /backup/batchdir/shells/data/all_log/2175IBS_KTRADE_PJNL_GOLDDELIV.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDDELIVȫ������) IBS_KTRADE_PJNL_GOLDDELIV*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDDELIV120830.sql
spool /backup/batchdir/shells/data/all_log/2176IBS_KTRADE_PJNL_GOLDDELIV.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDDELIVȫ������) IBS_KTRADE_PJNL_GOLDDELIV*****' from dual;
spool off
exit
