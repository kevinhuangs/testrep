set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     TRANS_CODE || '|+|' ||
                                     trim(replace(replace(TRANS_NAME,chr(13)),chr(10))) || '|+|' ||
                                     TRANS_LEVEL || '|+|' ||
                                     PARENT_CODE ||'|+|' || 
                                     FOR_EDTION || '|+|' ||
                                     REGI_CODE || '|+|' ||
                                     trim(replace(replace(NOTES, chr(13)),chr(10))) || '|+|'
                                      from IBS_PTAB_TRANNAME a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_tranname',
                                   '.tmp'));