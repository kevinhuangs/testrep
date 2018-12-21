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
									PRODUCT_WORKDAY|| '|+|'
                                      from IBS_PTAB_PRDCT_WORKDAY_CH2 a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   '2_PrdWorkDate',
                                   '.txt'));
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     PRODUCT_CODE|| '|+|' ||
									PRODUCT_WORKDAY|| '|+|'
                                      from IBS_PTAB_PRDCT_WORKDAY_CH4 a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   '4_PrdWorkDate',
                                   '.txt'));
exit
