set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

spool /Webserver/batchdir/shells/data/all_log/1111IBS_BTAB_LARGEAMOUNT_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_BTAB_LARGEAMOUNT全量导出) IBS_BTAB_LARGEAMOUNT*****' from dual;
spool off
@IBS_BTAB_LARGEAMOUNT.sql
spool /Webserver/batchdir/shells/data/all_log/1112IBS_BTAB_LARGEAMOUNT_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_BTAB_LARGEAMOUNT全量导出) IBS_BTAB_LARGEAMOUNT*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1113IBS_BTAB_TRANSSTATUS_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_BTAB_TRANSSTATUS全量导出) IBS_BTAB_TRANSSTATUS*****' from dual;
spool off
@IBS_BTAB_TRANSSTATUS.sql
spool /Webserver/batchdir/shells/data/all_log/1114IBS_BTAB_TRANSSTATUS_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_BTAB_TRANSSTATUS全量导出) IBS_BTAB_TRANSSTATUS*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1115IBS_ETAB_AC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_AC全量导出) IBS_ETAB_AC*****' from dual;
spool off
@IBS_ETAB_AC.sql
spool /Webserver/batchdir/shells/data/all_log/1116IBS_ETAB_AC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_AC全量导出) IBS_ETAB_AC*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1117IBS_PTAB_AC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_AC全量导出) IBS_PTAB_AC*****' from dual;
spool off
@IBS_PTAB_AC.sql
spool /Webserver/batchdir/shells/data/all_log/1118IBS_PTAB_AC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_AC全量导出) IBS_PTAB_AC*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1119IBS_PTAB_TRANNAME_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_TRANNAME全量导出) IBS_PTAB_TRANNAME*****' from dual;
spool off
@IBS_PTAB_TRANNAME.sql
spool /Webserver/batchdir/shells/data/all_log/1120IBS_PTAB_TRANNAME_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_TRANNAME全量导出) IBS_PTAB_TRANNAME*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1121IBS_PTAB_COUNTRYCODE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_COUNTRYCODE全量导出) IBS_PTAB_COUNTRYCODE*****' from dual;
spool off
@IBS_PTAB_COUNTRYCODE.sql
spool /Webserver/batchdir/shells/data/all_log/1122IBS_PTAB_COUNTRYCODE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_COUNTRYCODE全量导出) IBS_PTAB_COUNTRYCODE*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1123IBS_ETAB_USER_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_USER全量导出) IBS_ETAB_USER*****' from dual;
spool off
@IBS_ETAB_USER.sql
spool /Webserver/batchdir/shells/data/all_log/1124IBS_ETAB_USER_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_USER全量导出) IBS_ETAB_USER*****' from dual;
spool off

#20081023
spool /Webserver/batchdir/shells/data/all_log/1125IBS_PTAB_DONMSG_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_DONMSG全量导出) IBS_PTAB_DONMSG*****' from dual;
spool off
@IBS_PTAB_DONMSG.sql
spool /Webserver/batchdir/shells/data/all_log/1126IBS_PTAB_DONMSG_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_DONMSG全量导出) IBS_PTAB_DONMSG*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1127IBS_PTAB_FEECITY_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_FEECITY全量导出) IBS_PTAB_FEECITY*****' from dual;
spool off
@IBS_PTAB_FEECITY.sql
spool /Webserver/batchdir/shells/data/all_log/1128IBS_PTAB_FEECITY_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_FEECITY全量导出) IBS_PTAB_FEECITY*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1129IBS_PTAB_FEEITEM_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_FEEITEM全量导出) IBS_PTAB_FEEITEM*****' from dual;
spool off
@IBS_PTAB_FEEITEM.sql
spool /Webserver/batchdir/shells/data/all_log/1130IBS_PTAB_FEEITEM_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_FEEITEM全量导出) IBS_PTAB_FEEITEM*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1131IBS_PTAB_FEETYPE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_FEETYPE全量导出) IBS_PTAB_FEETYPE*****' from dual;
spool off
@IBS_PTAB_FEETYPE.sql
spool /Webserver/batchdir/shells/data/all_log/1132IBS_PTAB_FEETYPE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_FEETYPE全量导出) IBS_PTAB_FEETYPE*****' from dual;
spool off

#20081211
spool /Webserver/batchdir/shells/data/all_log/1133IBS_ETAB_ENTJNL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_ENTJNL全量导出) IBS_ETAB_ENTJNL*****' from dual;
spool off
@IBS_ETAB_ENTJNL.sql
spool /Webserver/batchdir/shells/data/all_log/1134IBS_ETAB_ENTJNL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_ENTJNL全量导出) IBS_ETAB_ENTJNL*****' from dual;
spool off
#add on 20100121 by lst
spool /Webserver/batchdir/shells/data/all_log/1135IBS_PTAB_JNL_TAFUND_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_TAFUND全量导出) IBS_PTAB_JNL_TAFUND*****' from dual;
spool off
@IBS_PTAB_JNL_TAFUND.sql
spool /Webserver/batchdir/shells/data/all_log/1136IBS_PTAB_JNL_TAFUND_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_TAFUND全量导出) IBS_PTAB_JNL_TAFUND*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1137IBS_PTAB_JNL_GOLDTRADE_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_GOLDTRADE全量导出) IBS_PTAB_JNL_GOLDTRADE*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDTRADE.sql
spool /Webserver/batchdir/shells/data/all_log/1138IBS_PTAB_JNL_GOLDTRADE_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_GOLDTRADE全量导出) IBS_PTAB_JNL_GOLDTRADE*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1139IBS_PTAB_JNL_GOLDDELIV_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_GOLDDELIV全量导出) IBS_PTAB_JNL_GOLDDELIV*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDDELIV.sql
spool /Webserver/batchdir/shells/data/all_log/1140IBS_PTAB_JNL_GOLDDELIV_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_GOLDDELIV全量导出) IBS_PTAB_JNL_GOLDDELIV*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1141IBS_PTAB_JNL_GOLDCASH_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_JNL_GOLDCASH全量导出) IBS_PTAB_JNL_GOLDCASH*****' from dual;
spool off
@IBS_PTAB_JNL_GOLDCASH.sql
spool /Webserver/batchdir/shells/data/all_log/1142IBS_PTAB_JNL_GOLDCASH_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_JNL_GOLDCASH全量导出) IBS_PTAB_JNL_GOLDCASH*****' from dual;
spool off

##add on 20100128
spool /Webserver/batchdir/shells/data/all_log/1143IBS_B2ETAB_JNL_B2E005_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_JNL_B2E005全量导出) IBS_B2ETAB_JNL_B2E005*****' from dual;
spool off
@IBS_B2ETAB_JNL_B2E005.sql
spool /Webserver/batchdir/shells/data/all_log/1144IBS_B2ETAB_JNL_B2E005_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_JNL_B2E005全量导出) IBS_B2ETAB_JNL_B2E005*****' from dual;
spool off
#20100826 add by yangtao for MBank
spool /Webserver/batchdir/shells/data/all_log/1145IBS_PTAB_PSIGNRECORD_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_PSIGNRECORD全量导出) IBS_PTAB_PSIGNRECORD*****' from dual;
spool off
@IBS_PTAB_PSIGNRECORD.sql
spool /Webserver/batchdir/shells/data/all_log/1146IBS_PTAB_PSIGNRECORD_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_PSIGNRECORD全量导出) IBS_PTAB_PSIGNRECORD*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1147IBS_MTAB_PJNLFUND_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNLFUND全量导出) IBS_MTAB_PJNLFUND*****' from dual;
spool off
@IBS_MTAB_PJNLFUND.sql
spool /Webserver/batchdir/shells/data/all_log/1148IBS_MTAB_PJNLFUND_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNLFUND全量导出) IBS_MTAB_PJNLFUND*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1149IBS_MTAB_PJNLSTOCK_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNLSTOCK全量导出) IBS_MTAB_PJNLSTOCK*****' from dual;
spool off
@IBS_MTAB_PJNLSTOCK.sql
spool /Webserver/batchdir/shells/data/all_log/1150IBS_MTAB_PJNLSTOCK_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNLSTOCK全量导出) IBS_MTAB_PJNLSTOCK*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1151IBS_MTAB_PJnl_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnl全量导出) IBS_MTAB_PJnl*****' from dual;
spool off
@IBS_MTAB_PJnl.sql
spool /Webserver/batchdir/shells/data/all_log/1152IBS_MTAB_PJnl_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnl全量导出) IBS_MTAB_PJnl*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1153IBS_MTAB_PJnlAccess_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlAccess全量导出) IBS_MTAB_PJnlAccess*****' from dual;
spool off
@IBS_MTAB_PJnlAccess.sql
spool /Webserver/batchdir/shells/data/all_log/1154IBS_MTAB_PJnlAccess_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlAccess全量导出) IBS_MTAB_PJnlAccess*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1155IBS_MTAB_PJnlCredit_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlCredit全量导出) IBS_MTAB_PJnlCredit*****' from dual;
spool off
@IBS_MTAB_PJnlCredit.sql
spool /Webserver/batchdir/shells/data/all_log/1156IBS_MTAB_PJnlCredit_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlCredit全量导出) IBS_MTAB_PJnlCredit*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1157IBS_MTAB_PJnlF2C_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlF2C全量导出) IBS_MTAB_PJnlF2C*****' from dual;
spool off
@IBS_MTAB_PJnlF2C.sql
spool /Webserver/batchdir/shells/data/all_log/1158IBS_MTAB_PJnlF2C_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlF2C全量导出) IBS_MTAB_PJnlF2C*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1159IBS_MTAB_PJnlFeeT_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlFee全量导出) IBS_MTAB_PJnlFee*****' from dual;
spool off
@IBS_MTAB_PJnlFee.sql
spool /Webserver/batchdir/shells/data/all_log/1160IBS_MTAB_PJnlFee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlFee全量导出) IBS_MTAB_PJnlFee*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1161IBS_MTAB_PJnlPay_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlPay全量导出) IBS_MTAB_PJnlPay*****' from dual;
spool off
@IBS_MTAB_PJnlPay.sql
spool /Webserver/batchdir/shells/data/all_log/1162IBS_MTAB_PJnlPay_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlPay全量导出) IBS_MTAB_PJnlPay*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1163IBS_MTAB_PJnlQuery_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlQuery全量导出) IBS_MTAB_PJnlQuery*****' from dual;
spool off
@IBS_MTAB_PJnlQuery.sql
spool /Webserver/batchdir/shells/data/all_log/1164IBS_MTAB_PJnlQuery_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlQuery全量导出) IBS_MTAB_PJnlQuery*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1165IBS_MTAB_PJnlTransfer_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJnlTransfer全量导出) IBS_MTAB_PJnlTransfer*****' from dual;
spool off
@IBS_MTAB_PJnlTransfer.sql
spool /Webserver/batchdir/shells/data/all_log/1166IBS_MTAB_PJnlTransfer_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJnlTransfer全量导出) IBS_MTAB_PJnlTransfer*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1167IBS_MTAB_PMobilePayee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PMobilePayee全量导出) IBS_MTAB_PMobilePayee*****' from dual;
spool off
@IBS_MTAB_PMobilePayee.sql
spool /Webserver/batchdir/shells/data/all_log/1168IBS_MTAB_PMobilePayee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PMobilePayee全量导出) IBS_MTAB_PMobilePayee*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1169IBS_MTAB_CreditVerJnl_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_CreditVerJnl全量导出) IBS_MTAB_CreditVerJnl*****' from dual;
spool off
@IBS_MTAB_CreditVerJnl.sql
spool /Webserver/batchdir/shells/data/all_log/1170IBS_MTAB_CreditVerJnl_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_CreditVerJnl全量导出) IBS_MTAB_CreditVerJnl*****' from dual;
spool off

#add by fangxw 20110117
spool /Webserver/batchdir/shells/data/all_log/1171USERTBL_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(USERTBL全量导出) USERTBL*****' from dual;
spool off
@USERTBL.sql
spool /Webserver/batchdir/shells/data/all_log/1172USERTBL_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(USERTBL全量导出) USERTBL*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1173IBS_B2ETAB_SIGNRECORD_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_SIGNRECORD全量导出) IBS_B2ETAB_SIGNRECORD*****' from dual;
spool off
@IBS_B2ETAB_SIGNRECORD.sql
spool /Webserver/batchdir/shells/data/all_log/1174IBS_B2ETAB_SIGNRECORD_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_SIGNRECORD全量导出) IBS_B2ETAB_SIGNRECORD*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1175IBS_B2ETAB_FUNCTION_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_B2ETAB_FUNCTION全量导出) IBS_B2ETAB_FUNCTION*****' from dual;
spool off
@IBS_B2ETAB_FUNCTION.sql
spool /Webserver/batchdir/shells/data/all_log/1176IBS_B2ETAB_FUNCTION_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_B2ETAB_FUNCTION全量导出) IBS_B2ETAB_FUNCTION*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1177IBS_ETAB_CIF_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_ETAB_CIF全量导出) IBS_ETAB_CIF*****' from dual;
spool off
@IBS_ETAB_CIF.sql
spool /Webserver/batchdir/shells/data/all_log/1178IBS_ETAB_CIF_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_ETAB_CIF全量导出) IBS_ETAB_CIF*****' from dual;
spool off

#add by fangxianwan 20110319
spool /Webserver/batchdir/shells/data/all_log/1179ibs_btab_teller_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_btab_teller全量导出) ibs_btab_teller*****' from dual;
spool off
@ibs_btab_teller.sql
spool /Webserver/batchdir/shells/data/all_log/1180ibs_btab_teller_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_btab_teller全量导出) ibs_btab_teller*****' from dual;
spool off

#add by fangxianwan 20110414
spool /Webserver/batchdir/shells/data/all_log/1181IBS_PTAB_USER_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off
@IBS_PTAB_USER_all.sql
spool /Webserver/batchdir/shells/data/all_log/1182IBS_PTAB_USER_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_USER_all全量导出) IBS_PTAB_USER_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1183IBS_PTAB_CIF_all_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off
@IBS_PTAB_CIF_all.sql
spool /Webserver/batchdir/shells/data/all_log/1184IBS_PTAB_CIF_all_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_PTAB_CIF_all全量导出) IBS_PTAB_CIF_all*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1185ibs_ptab_payee_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off
@ibs_ptab_payee.sql
spool /Webserver/batchdir/shells/data/all_log/1186ibs_ptab_payee_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(ibs_ptab_payee全量导出) ibs_ptab_payee*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1187IBS_MTAB_PJNL_NOLOGIN_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNL_NOLOGIN全量导出) IBS_MTAB_PJNL_NOLOGIN*****' from dual;
spool off
@IBS_MTAB_PJNL_NOLOGIN.sql
spool /Webserver/batchdir/shells/data/all_log/1188IBS_MTAB_PJNL_NOLOGIN_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNL_NOLOGIN全量导出) IBS_MTAB_PJNL_NOLOGIN*****' from dual;
spool off

spool /Webserver/batchdir/shells/data/all_log/1189IBS_MTAB_PJNLCREDITCC_STARTTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(IBS_MTAB_PJNLCREDITCC全量导出) IBS_MTAB_PJNLCREDITCC*****' from dual;
spool off
@IBS_MTAB_PJNLCREDITCC.sql
spool /Webserver/batchdir/shells/data/all_log/1190IBS_MTAB_PJNLCREDITCC_ENDTIME.log
set trimspool on
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理结束(IBS_MTAB_PJNLCREDITCC全量导出) IBS_MTAB_PJNLCREDITCC*****' from dual;
spool off
exit
