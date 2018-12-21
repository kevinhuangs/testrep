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
									PRODUCT_TYPE|| '|+|' ||
									PRODUCT_NAME|| '|+|'
                                      from IBS_PTAB_RISKMANAGER a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'netbank_riskstatement_type',
                                   '.txt'));
exit
