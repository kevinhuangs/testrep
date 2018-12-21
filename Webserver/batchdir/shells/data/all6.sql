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

exit
