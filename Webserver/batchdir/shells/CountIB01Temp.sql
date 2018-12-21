set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool ibs_etab_super_ac_temp.txt
set trimspool on
select count(*) from IBS_ETAB_SUPER_AC_TEMP t;
spool off
exit