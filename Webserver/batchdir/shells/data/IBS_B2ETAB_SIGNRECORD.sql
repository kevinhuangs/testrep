set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CIF_NO || '|+|' || 
                                     CIF_VERSION || '|+|' ||
                                     to_char(CIF_SIGNINDATE, 'yyyyMMdd') || '|+|' || 
                                     CIF_SIGNINORGANID || '|+|' ||
                                     CIF_SIGNINCHANNEL || '|+|' ||
                                     to_char(CIF_SIGNOFFDATE, 'yyyyMMdd') || '|+|' || 
                                     CIF_SIGNOFFORGANID || '|+|' ||
                                     CIF_SIGNOFFCHANNEL || '|+|' ||
                                     CIF_STATUS || '|+|' || 
                                     USER_ID || '|+|'
                                      from IBS_B2ETAB_SIGNRECORD a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_b2etab_signrecord',
                                   '.tmp'));
