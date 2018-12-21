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
                                    PRODUCT_CODE|| '|+|' || 
									PRODUCT_NAME|| '|+|' || 
									BEGINDATE|| '|+|' || 
									to_char(BEGIN_AMOUNT,'FM9999999999999990.90')|| '|+|' || 
									to_char(END_AMOUNT,'FM9999999999999990.90')|| '|+|' || 
									to_char(RATE,'FM999999999990.999990') || '|+|' ||
									PRODUCT_LIMIT|| '|+|' || 
									ISROLL|| '|+|' || 
									RATEBASE|| '|+|'
									from ibs_ptab_profitrate a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'FundRate',
                                   '.txt'));
exit
