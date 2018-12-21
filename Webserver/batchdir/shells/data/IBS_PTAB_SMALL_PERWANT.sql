set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     TRANS_CODE || '|+|'
                                      FROM IBS_PTAB_SMALL_PERWANT a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_small_perwant',
                                   '.tmp'));