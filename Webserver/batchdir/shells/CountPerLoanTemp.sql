set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool IBS_PTAB_PERLOANBRANCH_TMP.txt
set trimspool on
select count(*) from IBS_PTAB_PERLOANBRANCH_TMP t;
spool off
exit