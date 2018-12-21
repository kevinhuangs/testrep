set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
spool ibs_ptab_pzfhh_temp.txt
set trimspool on
select count(t.fqhhao) from ibs_ptab_pzfhh t;
spool off
exit