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

#add by dumingping 20120817------start
#����������ÿ�������ļ�20120830�� ������ͻ������ն���Ŀ��һ�ڣ�-������֣�
spool /backup/batchdir/shells/data/add_log/2145IBS_KTRADE_PJNL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL��������) IBS_KTRADE_PJNL*****' from dual;
spool off
@IBS_KTRADE_PJNL.sql
spool /backup/batchdir/shells/data/add_log/2146IBS_KTRADE_PJNL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL��������) IBS_KTRADE_PJNL*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2147IBS_KTRADE_PJNL_LOGIN.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_LOGIN��������) IBS_KTRADE_PJNL_LOGIN*****' from dual;
spool off
@IBS_KTRADE_PJNL_LOGIN.sql
spool /backup/batchdir/shells/data/add_log/2148IBS_KTRADE_PJNL_LOGIN.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_LOGIN��������) IBS_KTRADE_PJNL_LOGIN*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2149IBS_KTRADE_PJNL_GOLDCASH.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDCASH��������) IBS_KTRADE_PJNL_GOLDCASH*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDCASH.sql
spool /backup/batchdir/shells/data/add_log/2150IBS_KTRADE_PJNL_GOLDCASH.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDCASH��������) IBS_KTRADE_PJNL_GOLDCASH*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2151IBS_KTRADE_PJNL_GOLDTRADE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDTRADE��������) IBS_KTRADE_PJNL_GOLDTRADE*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDTRADE.sql
spool /backup/batchdir/shells/data/add_log/2152IBS_KTRADE_PJNL_GOLDTRADE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDTRADE��������) IBS_KTRADE_PJNL_GOLDTRADE*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2153IBS_KTRADE_PJNL_GOLDDELIV.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_GOLDDELIV��������) IBS_KTRADE_PJNL_GOLDDELIV*****' from dual;
spool off
@IBS_KTRADE_PJNL_GOLDDELIV.sql
spool /backup/batchdir/shells/data/add_log/2154IBS_KTRADE_PJNL_GOLDDELIV.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_GOLDDELIV��������) IBS_KTRADE_PJNL_GOLDDELIV*****' from dual;
spool off

spool /backup/batchdir/shells/data/add_log/2155IBS_KTRADE_PJNL_QUERY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_KTRADE_PJNL_QUERY��������) IBS_KTRADE_PJNL_QUERY*****' from dual;
spool off
@IBS_KTRADE_PJNL_QUERY.sql
spool /backup/batchdir/shells/data/add_log/2156IBS_KTRADE_PJNL_QUERY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_KTRADE_PJNL_QUERY��������) IBS_KTRADE_PJNL_QUERY*****' from dual;
spool off
#add by dumingping 20120817------end

#add by nixy 20130328------start
#�������� IBS_PTAB_JNL_CYCLEPAY(�ʽ�鼯��־��)    20130328              ÿ������
spool /backup/batchdir/shells/data/add_log/2157IBS_PTAB_JNL_CYCLEPAY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_CYCLEPAY��������) IBS_PTAB_JNL_CYCLEPAY*****' from dual;
spool off
@IBS_PTAB_JNL_CYCLEPAY.sql
spool /backup/batchdir/shells/data/add_log/2158IBS_PTAB_JNL_CYCLEPAY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_CYCLEPAY��������) IBS_PTAB_JNL_CYCLEPAY*****' from dual;
spool off


#�������� IBS_PTAB_JNL_FINANCING(����ͨ��־��)    20130328              ÿ������
spool /backup/batchdir/shells/data/add_log/2159IBS_PTAB_JNL_FINANCING.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_FINANCING��������) IBS_PTAB_JNL_FINANCING*****' from dual;
spool off
@IBS_PTAB_JNL_FINANCING.sql
spool /backup/batchdir/shells/data/add_log/2160IBS_PTAB_JNL_FINANCING.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_FINANCING��������) IBS_PTAB_JNL_FINANCING*****' from dual;
spool off
#add by nixy 20130328------end

#add by dumingping 20130506------start
#�������� IBS_PTAB_JNL_CREDITCARDAPPLY(���ÿ�������ˮ)    20130506              ÿ������
spool /backup/batchdir/shells/data/add_log/2161IBS_PTAB_JNL_CREDITCARDAPPLY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_CREDITCARDAPPLY��������) IBS_PTAB_JNL_CREDITCARDAPPLY*****' from dual;
spool off
@IBS_PTAB_JNL_CREDITCARDAPPLY.sql
spool /backup/batchdir/shells/data/add_log/2162IBS_PTAB_JNL_CREDITCARDAPPLY.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_CREDITCARDAPPLY��������) IBS_PTAB_JNL_CREDITCARDAPPLY*****' from dual;
spool off
#add by dumingping 20130506------end


#add by dumingping 20130731-----start
#�������� IBS_PTAB_JNL_BILLSET(�˵�������־��)    20130731              ÿ������
spool /backup/batchdir/shells/data/add_log/2163IBS_PTAB_JNL_BILLSET_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_BILLSET��������) IBS_PTAB_JNL_BILLSET*****' from dual;
spool off
@IBS_PTAB_JNL_BILLSET.sql
spool /backup/batchdir/shells/data/add_log/2164IBS_PTAB_JNL_BILLSET_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_BILLSET��������) IBS_PTAB_JNL_BILLSET*****' from dual;
spool off
#add by dumingping 20130731------end

#add by pengxiaomei 20131217-----start
#�������� IBS_PTAB_JNL_OUTBOUND(�������ջ���־��)    20131217            ÿ������
spool /backup/batchdir/shells/data/add_log/2169IBS_PTAB_JNL_OUTBOUND_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_OUTBOUND��������) IBS_PTAB_JNL_OUTBOUND*****' from dual;
spool off
@IBS_PTAB_JNL_OUTBOUND.sql
spool /backup/batchdir/shells/data/add_log/2170IBS_PTAB_JNL_OUTBOUND_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_OUTBOUND��������)IBS_PTAB_JNL_OUTBOUND*****' from dual;
spool off
#add by pengxiaomei 20131217------end

#add by zhanglei 20131217-----start
#�������� IBS_PTAB_JNL_OVERSEASUNION(�����㷢����־��)    20131217              ÿ������
spool /backup/batchdir/shells/data/add_log/2171IBS_PTAB_JNL_OVERSEASUNION_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_OVERSEASUNION��������) IBS_PTAB_JNL_OVERSEASUNION*****' from dual;
spool off
@IBS_PTAB_JNL_OVERSEASUNION.sql
spool /backup/batchdir/shells/data/add_log/2172IBS_PTAB_JNL_OVERSEASUNION_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_OVERSEASUNION��������) IBS_PTAB_JNL_OVERSEASUNION*****' from dual;
spool off
#add by zhanglei 20131217------end

#add by lyf 20140508-----start
#�������� IBS_PTAB_JNL_GOLDEXCHANGE(�ƽ����һ���־��)    20131217              ÿ������
spool /backup/batchdir/shells/data/add_log/2173IBS_PTAB_JNL_GOLDEXCHANGE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_GOLDEXCHANGE��������) IBS_PTAB_JNL_GOLDEXCHANGE*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDEXCHANGE.sql
spool /backup/batchdir/shells/data/add_log/2174IBS_PTAB_JNL_GOLDEXCHANGE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_GOLDEXCHANGE��������) IBS_PTAB_JNL_GOLDEXCHANGE*****' from dual;
spool off
#add by lyf 20140508------end

#�������� IBS_PTAB_JNL_GOLDSTORE(�ƽ���潻����־��)    20131217              ÿ������
spool /backup/batchdir/shells/data/add_log/2175IBS_PTAB_JNL_GOLDSTORE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_PTAB_JNL_GOLDSTORE��������) IBS_PTAB_JNL_GOLDSTORE*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDSTORE.sql
spool /backup/batchdir/shells/data/add_log/2176IBS_PTAB_JNL_GOLDSTORE.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_PTAB_JNL_GOLDSTORE��������) IBS_PTAB_JNL_GOLDSTORE*****' from dual;
spool off
#add by lyf 20140508------end

#�������� IBS_MTAB_MP_PJNLASSETPOOL(΢��������ƽ�������־��)    20140623              ÿ������
spool /backup/batchdir/shells/data/add_log/2177IBS_MTAB_MP_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(IBS_MTAB_MP_PJNLASSETPOOL��������) IBS_MTAB_MP_PJNLASSETPOOL*****' from dual;
spool off
@IBS_MTAB_MP_PJNLASSETPOOL.sql
spool /backup/batchdir/shells/data/add_log/2178IBS_MTAB_MP_PJNLASSETPOOL.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP�������(IBS_MTAB_MP_PJNLASSETPOOL��������) IBS_MTAB_MP_PJNLASSETPOOL*****' from dual;
spool off
#add by pengxiaomei 20140623------end

exit;