set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

spool /Webserver/batchdir/shells/data/add_log/1111IBS_BTAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_BTAB_JNL增量导出) IBS_BTAB_JNL*****' from dual;
spool off
@IBS_BTAB_JNL.sql
spool /Webserver/batchdir/shells/data/add_log/1112IBS_BTAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_BTAB_JNL增量导出) IBS_BTAB_JNL*****' from dual;
spool off
`
spool /Webserver/batchdir/shells/data/add_log/1113IBS_ETAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_JNL增量导出) IBS_ETAB_JNL*****' from dual;
spool off
@IBS_ETAB_JNL.sql
spool /Webserver/batchdir/shells/data/add_log/1114IBS_ETAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_JNL增量导出) IBS_ETAB_JNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1115IBS_ETAB_JNL2_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_JNL2增量导出) IBS_ETAB_JNL2*****' from dual;
spool off
@IBS_ETAB_JNL2.sql
spool /Webserver/batchdir/shells/data/add_log/1116IBS_ETAB_JNL2_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_JNL2增量导出) IBS_ETAB_JNL2*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1117IBS_ETAB_JNL_B2ECARD_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_JNL_B2ECARD增量导出) IBS_ETAB_JNL_B2ECARD*****' from dual;
spool off
@IBS_ETAB_JNL_B2ECARD.sql
spool /Webserver/batchdir/shells/data/add_log/1118IBS_ETAB_JNL_B2ECARD_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_JNL_B2ECARD增量导出) IBS_ETAB_JNL_B2ECARD*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1119IBS_PTAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL增量导出) IBS_PTAB_JNL*****' from dual;
spool off
@IBS_PTAB_JNL.sql
spool /Webserver/batchdir/shells/data/add_log/1120IBS_PTAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL增量导出) IBS_PTAB_JNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1121IBS_PTAB_JNL_TRANSFER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_TRANSFER增量导出) IBS_PTAB_JNL_TRANSFER*****' from dual;
spool off
@IBS_PTAB_JNL_TRANSFER.sql
spool /Webserver/batchdir/shells/data/add_log/1122IBS_PTAB_JNL_TRANSFER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_TRANSFER增量导出) IBS_PTAB_JNL_TRANSFER*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1123IBS_PTAB_JNL_C2F_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_C2F增量导出) IBS_PTAB_JNL_C2F*****' from dual;
spool off
@IBS_PTAB_JNL_C2F.sql
spool /Webserver/batchdir/shells/data/add_log/1124IBS_PTAB_JNL_C2F_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_C2F增量导出) IBS_PTAB_JNL_C2F*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1125IBS_PTAB_JNL_F2C_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_F2C增量导出) IBS_PTAB_JNL_F2C*****' from dual;
spool off
@IBS_PTAB_JNL_F2C.sql
spool /Webserver/batchdir/shells/data/add_log/1126IBS_PTAB_JNL_F2C_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_F2C增量导出) IBS_PTAB_JNL_F2C*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1127IBS_PTAB_JNL_LOAN_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_LOAN增量导出) IBS_PTAB_JNL_LOAN*****' from dual;
spool off
@IBS_PTAB_JNL_LOAN.sql
spool /Webserver/batchdir/shells/data/add_log/1128IBS_PTAB_JNL_LOAN_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_LOAN增量导出) IBS_PTAB_JNL_LOAN*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1129IBS_PTAB_JNL_LOANPAYOFF_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_LOANPAYOFF增量导出) IBS_PTAB_JNL_LOANPAYOFF*****' from dual;
spool off
@IBS_PTAB_JNL_LOANPAYOFF.sql
spool /Webserver/batchdir/shells/data/add_log/1130IBS_PTAB_JNL_LOANPAYOFF_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_LOANPAYOFF增量导出) IBS_PTAB_JNL_LOANPAYOFF*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1131IBS_PTAB_JNL_DEBT_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_DEBT增量导出) IBS_PTAB_JNL_DEBT*****' from dual;
spool off
@IBS_PTAB_JNL_DEBT.sql
spool /Webserver/batchdir/shells/data/add_log/1132IBS_PTAB_JNL_DEBT_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_DEBT增量导出) IBS_PTAB_JNL_DEBT*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1133IBS_PTAB_JNL_DEBTCASH_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_DEBTCASH增量导出) IBS_PTAB_JNL_DEBTCASH*****' from dual;
spool off
@IBS_PTAB_JNL_DEBTCASH.sql
spool /Webserver/batchdir/shells/data/add_log/1134IBS_PTAB_JNL_DEBTCASH_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_DEBTCASH增量导出) IBS_PTAB_JNL_DEBTCASH*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1135IBS_PTAB_JNL_FEXCHANGER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FEXCHANGER增量导出) IBS_PTAB_JNL_FEXCHANGER*****' from dual;
spool off
@IBS_PTAB_JNL_FEXCHANGER.sql
spool /Webserver/batchdir/shells/data/add_log/1136IBS_PTAB_JNL_FEXCHANGER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FEXCHANGER增量导出) IBS_PTAB_JNL_FEXCHANGER*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1137IBS_PTAB_JNL_BANKSTOCK_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_BANKSTOCK增量导出) IBS_PTAB_JNL_BANKSTOCK*****' from dual;
spool off
@IBS_PTAB_JNL_BANKSTOCK.sql
spool /Webserver/batchdir/shells/data/add_log/1138IBS_PTAB_JNL_BANKSTOCK_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_BANKSTOCK增量导出) IBS_PTAB_JNL_BANKSTOCK*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1139IBS_PTAB_JNL_FUND_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FUND增量导出) IBS_PTAB_JNL_FUND*****' from dual;
spool off
@IBS_PTAB_JNL_FUND.sql
spool /Webserver/batchdir/shells/data/add_log/1140IBS_PTAB_JNL_FUND_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FUND增量导出) IBS_PTAB_JNL_FUND*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1141IBS_PTAB_JNL_QUERY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_QUERY增量导出) IBS_PTAB_JNL_QUERY*****' from dual;
spool off
@IBS_PTAB_JNL_QUERY.sql
spool /Webserver/batchdir/shells/data/add_log/1142IBS_PTAB_JNL_QUERY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_QUERY增量导出) IBS_PTAB_JNL_QUERY*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1143IBS_PTAB_JNL_CREDITSET_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_CREDITSET增量导出) IBS_PTAB_JNL_CREDITSET*****' from dual;
spool off
@IBS_PTAB_JNL_CREDITSET.sql
spool /Webserver/batchdir/shells/data/add_log/1144IBS_PTAB_JNL_CREDITSET_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_CREDITSET增量导出) IBS_PTAB_JNL_CREDITSET*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1145IBS_PTAB_JNL_CREDITPAY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_CREDITPAY增量导出) IBS_PTAB_JNL_CREDITPAY*****' from dual;
spool off
@IBS_PTAB_JNL_CREDITPAY.sql
spool /Webserver/batchdir/shells/data/add_log/1146IBS_PTAB_JNL_CREDITPAY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_CREDITPAY增量导出) IBS_PTAB_JNL_CREDITPAY*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1147IBS_PTAB_JNL_CREDITLOST_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_CREDITLOST增量导出) IBS_PTAB_JNL_CREDITLOST*****' from dual;
spool off
@IBS_PTAB_JNL_CREDITLOST.sql
spool /Webserver/batchdir/shells/data/add_log/1148IBS_PTAB_JNL_CREDITLOST_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_CREDITLOST增量导出) IBS_PTAB_JNL_CREDITLOST*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1149IBS_PTAB_JNL_SUPERVISE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_SUPERVISE增量导出) IBS_PTAB_JNL_SUPERVISE*****' from dual;
spool off
@IBS_PTAB_JNL_SUPERVISE.sql
spool /Webserver/batchdir/shells/data/add_log/1150IBS_PTAB_JNL_SUPERVISE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_SUPERVISE增量导出) IBS_PTAB_JNL_SUPERVISE*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1151IBS_PTAB_BJNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_BJNL增量导出) IBS_PTAB_BJNL*****' from dual;
spool off
@IBS_PTAB_BJNL.sql
spool /Webserver/batchdir/shells/data/add_log/1152IBS_PTAB_BJNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_BJNL增量导出) IBS_PTAB_BJNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1153IBS_PTAB_TELLERJNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_TELLERJNL增量导出) IBS_PTAB_TELLERJNL*****' from dual;
spool off
@IBS_PTAB_TELLERJNL.sql
spool /Webserver/batchdir/shells/data/add_log/1154IBS_PTAB_TELLERJNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_TELLERJNL增量导出) IBS_PTAB_TELLERJNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1155IBS_PTAB_JNL_FINANCE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FINANCE增量导出) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off
@IBS_PTAB_JNL_FINANCE.sql
spool /Webserver/batchdir/shells/data/add_log/1156IBS_PTAB_JNL_FINANCE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FINANCE增量导出) IBS_PTAB_JNL_FINANCE*****' from dual;
spool off

#20081023
spool /Webserver/batchdir/shells/data/add_log/1157IBS_PTAB_JNL_DONATE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_DONATE增量导出) IBS_PTAB_JNL_DONATE*****' from dual;
spool off
@IBS_PTAB_JNL_DONATE.sql
spool /Webserver/batchdir/shells/data/add_log/1158IBS_PTAB_JNL_DONATE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_DONATE增量导出) IBS_PTAB_JNL_DONATE*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1159IBS_PTAB_JNL_EPAY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_EPAY增量导出) IBS_PTAB_JNL_EPAY*****' from dual;
spool off
@IBS_PTAB_JNL_EPAY.sql
spool /Webserver/batchdir/shells/data/add_log/1160IBS_PTAB_JNL_EPAY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_EPAY增量导出) IBS_PTAB_JNL_EPAY*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1161IBS_PTAB_JNL_FEE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_FEE增量导出) IBS_PTAB_JNL_FEE*****' from dual;
spool off
@IBS_PTAB_JNL_FEE.sql
spool /Webserver/batchdir/shells/data/add_log/1162IBS_PTAB_JNL_FEE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_FEE增量导出) IBS_PTAB_JNL_FEE*****' from dual;
spool off
#add on 20090828
spool /Webserver/batchdir/shells/data/add_log/1163IBS_PTAB_JNL_OUTOPENMOBILEBANK_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_OUTOPENMOBILEBANK增量导出) IBS_PTAB_JNL_OUTOPENMOBILEBANK*****' from dual;
spool off
@IBS_PTAB_JNL_OUTOPENMOBILEBANK.sql
spool /Webserver/batchdir/shells/data/add_log/1164IBS_PTAB_JNL_OUTOPENMOBILEBANK_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_OUTOPENMOBILEBANK增量导出) IBS_PTAB_JNL_OUTOPENMOBILEBANK*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1165IBS_PTAB_JNL_ACCOUNTINFORMNET_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_ACCOUNTINFORMNET增量导出) IBS_PTAB_JNL_ACCOUNTINFORMNET*****' from dual;
spool off
@IBS_PTAB_JNL_ACCOUNTINFORMNET.sql
spool /Webserver/batchdir/shells/data/add_log/1166IBS_PTAB_JNL_ACCOUNTINFORMNET_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_ACCOUNTINFORMNET增量导出) IBS_PTAB_JNL_ACCOUNTINFORMNET*****' from dual;
spool off
#add on 20091126 for delete ivr record yesterdata
spool /Webserver/batchdir/shells/data/add_log/1167DEL_IBS_PTAB_IVRMESSAGE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(DEL_IBS_PTAB_IVRMESSAGE增量导出) DEL_IBS_PTAB_IVRMESSAGE*****' from dual;
spool off
@DEL_IBS_PTAB_IVRMESSAGE.sql
spool /Webserver/batchdir/shells/data/add_log/1168DEL_IBS_PTAB_IVRMESSAGE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(DEL_IBS_PTAB_IVRMESSAGE增量导出) DEL_IBS_PTAB_IVRMESSAGE*****' from dual;
spool off
#add on 20100527

spool /Webserver/batchdir/shells/data/add_log/1169IBS_BTAB_PERREGISER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_BTAB_PERREGISER增量导出) IBS_BTAB_PERREGISER*****' from dual;
spool off
@IBS_BTAB_PERREGISER.sql
spool /Webserver/batchdir/shells/data/add_log/1170IBS_BTAB_PERREGISER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_BTAB_PERREGISER增量导出) IBS_BTAB_PERREGISER*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1171IBS_BTAB_PERREGISERDETAIL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_BTAB_PERREGISERDETAIL增量导出) IBS_BTAB_PERREGISERDETAIL*****' from dual;
spool off
@IBS_BTAB_PERREGISERDETAIL.sql
spool /Webserver/batchdir/shells/data/add_log/1172IBS_BTAB_PERREGISERDETAIL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_BTAB_PERREGISERDETAIL增量导出) IBS_BTAB_PERREGISERDETAIL*****' from dual;
spool off

#add on 20100527
spool /Webserver/batchdir/shells/data/add_log/1173IBS_B2ETAB_JNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL增量导出) IBS_B2ETAB_JNL*****' from dual;
spool off
@IBS_B2ETAB_JNL.sql
spool /Webserver/batchdir/shells/data/add_log/1174IBS_B2ETAB_JNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL增量导出) IBS_B2ETAB_JNL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1175IBS_B2ETAB_QUERY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_QUERY增量导出) IBS_B2ETAB_QUERY*****' from dual;
spool off
@IBS_B2ETAB_QUERY.sql
spool /Webserver/batchdir/shells/data/add_log/1176IBS_B2ETAB_QUERY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_QUERY增量导出) IBS_B2ETAB_QUERY*****' from dual;
spool off

#20100826 by yangtao 
#@IBS_PTAB_CIF.sql
#@IBS_PTAB_USER.sql

#add by fangxw 20110117
spool /Webserver/batchdir/shells/data/add_log/1177TRANSINFOTBL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(TRANSINFOTBL增量导出) TRANSINFOTBL*****' from dual;
spool off
@TRANSINFOTBL.sql
spool /Webserver/batchdir/shells/data/add_log/1178TRANSINFOTBL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(TRANSINFOTBL增量导出) TRANSINFOTBL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1179IBS_B2ETAB_SALARYFILE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_SALARYFILE增量导出) IBS_B2ETAB_SALARYFILE*****' from dual;
spool off
@IBS_B2ETAB_SALARYFILE.sql
spool /Webserver/batchdir/shells/data/add_log/1180IBS_B2ETAB_SALARYFILE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_SALARYFILE增量导出) IBS_B2ETAB_SALARYFILE*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1181IBS_B2ETAB_JNL_B2E009_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E009增量导出) IBS_B2ETAB_JNL_B2E009*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E009.sql
spool /Webserver/batchdir/shells/data/add_log/1182IBS_B2ETAB_JNL_B2E009_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E009增量导出) IBS_B2ETAB_JNL_B2E009*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1183IBS_B2ETAB_JNL_B2E008_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E008增量导出) IBS_B2ETAB_JNL_B2E008*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E008.sql
spool /Webserver/batchdir/shells/data/add_log/1184IBS_B2ETAB_JNL_B2E008_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E008增量导出) IBS_B2ETAB_JNL_B2E008*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1185IBS_B2ETAB_JNL_B2E007_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E007增量导出) IBS_B2ETAB_JNL_B2E007*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E007.sql
spool /Webserver/batchdir/shells/data/add_log/1186IBS_B2ETAB_JNL_B2E007_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E007增量导出) IBS_B2ETAB_JNL_B2E007*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1187IBS_B2ETAB_JNL_B2E006_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E006增量导出) IBS_B2ETAB_JNL_B2E006*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E006.sql
spool /Webserver/batchdir/shells/data/add_log/1188IBS_B2ETAB_JNL_B2E006_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E006增量导出) IBS_B2ETAB_JNL_B2E006*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1189IBS_B2ETAB_JNL_B2E004_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E004增量导出) IBS_B2ETAB_JNL_B2E004*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E004.sql
spool /Webserver/batchdir/shells/data/add_log/1190IBS_B2ETAB_JNL_B2E004_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E004增量导出) IBS_B2ETAB_JNL_B2E004*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1191IBS_B2ETAB_JNL_B2E003_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E003增量导出) IBS_B2ETAB_JNL_B2E003*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E003.sql
spool /Webserver/batchdir/shells/data/add_log/1192IBS_B2ETAB_JNL_B2E003_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E003增量导出) IBS_B2ETAB_JNL_B2E003*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1193IBS_B2ETAB_JNL_B2E002_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E002增量导出) IBS_B2ETAB_JNL_B2E002*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E002.sql
spool /Webserver/batchdir/shells/data/add_log/1194IBS_B2ETAB_JNL_B2E002_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E002增量导出) IBS_B2ETAB_JNL_B2E002*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1195IBS_B2ETAB_JNL_B2E001_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E001增量导出) IBS_B2ETAB_JNL_B2E001*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E001.sql
spool /Webserver/batchdir/shells/data/add_log/1196IBS_B2ETAB_JNL_B2E001_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E001增量导出) IBS_B2ETAB_JNL_B2E001*****' from dual;
spool off

#add by zhaozhijie 20110322
spool /Webserver/batchdir/shells/data/add_log/1197IBS_PTAB_JNL_OUTBANK_SIGN_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_OUTBANK_SIGN增量导出) IBS_PTAB_JNL_OUTBANK_SIGN*****' from dual;
spool off
@IBS_PTAB_JNL_OUTBANK_SIGN.sql
spool /Webserver/batchdir/shells/data/add_log/1198IBS_PTAB_JNL_OUTBANK_SIGN_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_OUTBANK_SIGN增量导出) IBS_PTAB_JNL_OUTBANK_SIGN*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1199IBS_PTAB_JNL_METAL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_METAL增量导出) IBS_PTAB_JNL_METAL*****' from dual;
spool off
@IBS_PTAB_JNL_METAL.sql
spool /Webserver/batchdir/shells/data/add_log/1200IBS_PTAB_JNL_METAL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_METAL增量导出) IBS_PTAB_JNL_METAL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1201IBS_PTAB_JNL_OUTBANK_VERIFY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_OUTBANK_VERIFY增量导出) IBS_PTAB_JNL_OUTBANK_VERIFY*****' from dual;
spool off
@IBS_PTAB_JNL_OUTBANK_VERIFY.sql
spool /Webserver/batchdir/shells/data/add_log/1202IBS_PTAB_JNL_OUTBANK_VERIFY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_OUTBANK_VERIFY增量导出) IBS_PTAB_JNL_OUTBANK_VERIFY*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1203IBS_PTAB_JNL_DELEGATIONAC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_DELEGATIONAC增量导出) IBS_PTAB_JNL_DELEGATIONAC*****' from dual;
spool off
@IBS_PTAB_JNL_DELEGATIONAC.sql
spool /Webserver/batchdir/shells/data/add_log/1204IBS_PTAB_JNL_DELEGATIONAC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_DELEGATIONAC增量导出) IBS_PTAB_JNL_DELEGATIONAC*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/add_log/1205I_NB_EF_SIGN_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(I_NB_EF_SIGN增量导出) I_NB_EF_SIGN*****' from dual;
spool off
@I_NB_EF_SIGN.sql
spool /Webserver/batchdir/shells/data/add_log/1206I_NB_EF_SIGN_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(I_NB_EF_SIGN增量导出) I_NB_EF_SIGN*****' from dual;
spool off




exit;