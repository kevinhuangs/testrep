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
@IBS_ETAB_CIF.sql
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
#add on 20100629
@IBS_B2ETAB_JNLALL.sql
@IBS_B2ETAB_QUERYALL.sql

exit
