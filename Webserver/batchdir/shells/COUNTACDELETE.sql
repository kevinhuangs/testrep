set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool IBS_PTAB_ACDELETE.txt
set trimspool on
SELECT COUNT(*) FROM IBS_PTAB_ACDELETE T;
spool off
exit
