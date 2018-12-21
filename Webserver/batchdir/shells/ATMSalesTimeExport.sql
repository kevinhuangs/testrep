set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    value||'|+|'||key||'|+|' from ibs_tab_variable a 
                                    where key in('MorningStartTime','MorningEndTime','SellStartTime','SellEndTime') 
									order by decode(key,'MorningStartTime','1','MorningEndTime','2','SellStartTime','3','SellEndTime','4')),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'salestime',
                                   '.txt'));
exit
