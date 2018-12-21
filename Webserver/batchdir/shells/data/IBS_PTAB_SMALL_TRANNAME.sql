set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     TRANS_CODE || '|+|' || 
                                     TRANS_NAME || '|+|' || 
                                     TRANS_LEVEL || '|+|' ||
                                     PARENT_CODE || '|+|' || 
                                     FOR_EDTION || '|+|' || 
                                     REGI_CODE || '|+|' || 
                                     NOTES || '|+|' || 
                                     FOR_SELECTED || '|+|' ||
                                     ORDERNO || '|+|'
                                      FROM IBS_PTAB_SMALL_TRANNAME a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_small_tranname',
                                   '.tmp'));