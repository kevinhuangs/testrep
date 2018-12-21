set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor (select /*+ parallel(a,0) */
                                     CORE_CERTTYPE || '|+|' ||
                                     CREDIT_CERTTYPE || '|+|' ||
                                     CERTTYPE_NAME || '|+|' ||
                                     CHANNEL_TYPE || '|+|'
                                      from ibs_ptab_certtype a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_certtype',
                                   '.tmp'));