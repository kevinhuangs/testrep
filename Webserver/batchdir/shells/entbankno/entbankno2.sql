set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999
set trimspool on
spool EntBankNo2.txt
select      FQHHAO
     ||'|'||JIGOMC ||'|'||DIZHII||'|'||ZJCYHH
     from  ibs_ptab_bankno t  where JILUZT='0' AND ZHUANT='1' ;
spool off
                                                
                                             
exit
