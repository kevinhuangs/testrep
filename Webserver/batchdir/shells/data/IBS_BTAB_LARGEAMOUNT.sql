set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     BRANCH_ID || '|+|' || 
                                     ORGAN_ID || '|+|' ||
                                     ORGAN_LARGEAMOUNT || '|+|' ||
                                     ORGAN_BATCHLARGEAMOUNT || '|+|'
                                      from IBS_BTAB_LARGEAMOUNT a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_btab_largeamount',
                                   '.tmp'));
