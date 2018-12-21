set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     TRANS_CODE || '|+|' || 
                                     TRANS_NAME || '|+|' || 
                                     IMAGE_NAME || '|+|' ||
                                     SHOW_TYPE || '|+|' || 
                                     SQUENCE_NO || '|+|' || 
                                     ISNEW_FLAG || '|+|'
                                      FROM IBS_PTAB_SMALL_WANTDO a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_small_wantdo',
                                   '.tmp'));