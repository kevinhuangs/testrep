set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     USER_VERSION ||'|+|' ||
                                     to_char(USER_SIGNINDATE, 'yyyyMMdd') ||'|+|' || 
                                     USER_SIGNINORGANID || '|+|' ||
                                     USER_SIGNINCHANNEL || '|+|' ||
                                     to_char(USER_SIGNOFFDATE, 'yyyyMMdd') ||'|+|' || 
                                     USER_SIGNOFFORGANID || '|+|' ||
                                     USER_SIGNOFFCHANNEL || '|+|' ||
                                     REFERRER_CODE || '|+|' || 
                                     USER_CHANNEL ||'|+|'
                                      from ibs_ptab_psignrecord a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_psignrecord',
                                   '.tmp'));
