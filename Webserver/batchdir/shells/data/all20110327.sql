set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 

@IBS_BTAB_LARGEAMOUNT.sql
@IBS_BTAB_TRANSSTATUS.sql
@IBS_ETAB_AC.sql
@IBS_PTAB_AC.sql
@IBS_PTAB_TRANNAME.sql
@IBS_PTAB_COUNTRYCODE.sql
@IBS_ETAB_USER.sql
#20081023
@IBS_PTAB_DONMSG.sql
@IBS_PTAB_FEECITY.sql
@IBS_PTAB_FEEITEM.sql
@IBS_PTAB_FEETYPE.sql
#20081211
@IBS_ETAB_ENTJNL.sql
#add on 20100121 by lst
@IBS_PTAB_JNL_TAFUND.sql
@IBS_PTAB_JNL_GOLDTRADE.sql
@IBS_PTAB_JNL_GOLDDELIV.sql
@IBS_PTAB_JNL_GOLDCASH.sql
##add on 20100128
@IBS_B2ETAB_JNL_B2E005.sql
#20100826 add by yangtao for MBank
@IBS_PTAB_PSIGNRECORD.sql
@IBS_MTAB_PJNLFUND.sql
@IBS_MTAB_PJNLSTOCK.sql
@IBS_MTAB_PJnl.sql
@IBS_MTAB_PJnlAccess.sql
@IBS_MTAB_PJnlCredit.sql
@IBS_MTAB_PJnlF2C.sql
@IBS_MTAB_PJnlFee.sql
@IBS_MTAB_PJnlPay.sql
@IBS_MTAB_PJnlQuery.sql
@IBS_MTAB_PJnlTransfer.sql
@IBS_MTAB_PMobilePayee.sql
@IBS_MTAB_CreditVerJnl.sql

#add by fangxw 20110117
@USERTBL.sql
@IBS_B2ETAB_SIGNRECORD.sql
@IBS_B2ETAB_FUNCTION.sql
@IBS_ETAB_CIF.sql

#add by fangxianwan 20110319
@ibs_btab_teller.sql

#add by zhaozhijie 20110322
@IBS_PTAB_JNL_OUTBANK_SIGN20110327.sql
@IBS_PTAB_JNL_METAL20110327.sql
@IBS_PTAB_JNL_OUTBANK_VERIFY20110327.sql
@IBS_PTAB_JNL_DELEGATIONAC20110327.sql
exit
