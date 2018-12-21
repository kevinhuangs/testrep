set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     TYPE_ID || '|+|' ||
                                     trim(replace(replace(TYPE_NAME, chr(13)),chr(10))) || '|+|'
                                      from IBS_PTAB_FEETYPE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_feetype',
                                   '.tmp'));