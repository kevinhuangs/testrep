set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CIF_NO || '|+|' || USER_STYLE || '|+|' ||
                                     to_char(USER_LASTLOGIN, 'yyyyMMdd') || '|+|' ||
                                     to_char(USER_LASTMODDATE, 'yyyyMMdd') || '|+|' || 
                                     USER_LOGINTIME || '|+|' ||
                                     USER_FAILLOGIN || '|+|' || 
                                     USER_ID || '|+|' || 
                                     USER_ORGANID || '|+|' ||
                                     FIRST_LOGIN || '|+|'
                                      from ibs_dtab_user a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_dtab_user',
                                   '.tmp'));