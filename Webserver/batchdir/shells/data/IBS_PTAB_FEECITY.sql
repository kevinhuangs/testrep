set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CITY_ID || '|+|' ||
                                     trim(replace(replace(CITY_NAME, chr(13)),chr(10))) || '|+|' ||
                                     CITY_WTC || '|+|'
                                      from IBS_PTAB_FEECITY a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_feecity',
                                   '.tmp'));