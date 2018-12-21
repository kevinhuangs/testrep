set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor (select /*+ parallel(a,0) */
                                     JNL_TRSSTATUS || '|+|' ||
                                     JNL_TRSSTATUSNAME || '|+|'
                                      from IBS_BTAB_TRANSSTATUS a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_btab_transstatus',
                                   '.tmp'));
