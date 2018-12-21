set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     AC_NO || '|+|' || 
                                     AC_NAME || '|+|' ||
                                     AC_TYPE || '|+|' || 
                                     AC_ALIAS || '|+|' ||
                                     AC_ORGANID || '|+|' || 
                                     USER_ID || '|+|' ||
                                     PRIORITY || '|+|'
                                      from IBS_PTAB_AC a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_ac',
                                   '.tmp'));
