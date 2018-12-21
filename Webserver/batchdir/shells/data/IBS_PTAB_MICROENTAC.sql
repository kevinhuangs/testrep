set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     AC_NO || '|+|' ||
                                     AC_TYPE || '|+|' || 
                                     AC_NAME || '|+|' ||
                                     AC_ALIAS || '|+|' || 
                                     AC_ORGANID || '|+|' || 
                                     AC_PRIORITY || '|+|' ||
                                     AC_BASEFLAG || '|+|' || 
                                     AC_CURRENCY || '|+|' || 
                                     AC_CURRTYPE || '|+|' ||
                                     AC_TRANSFERTYPE || '|+|' ||
                                     to_char(AC_DATE, 'yyyyMMdd') || '|+|' ||
                                     AC_CIFNO || '|+|' || 
                                     AC_LIMIT || '|+|' ||
                                     AC_OPENBANK || '|+|' || 
                                     AC_BIGAMOUNT || '|+|' || 
                                     AC_FRIENDFLAG || '|+|' ||
                                     AC_STATUS || '|+|' || 
                                     PROXYNAME || '|+|' || 
                                     PROXYCERTTYPE || '|+|' ||
                                     PROXYCERTNO || '|+|' || 
                                     AC_CERTTYPE || '|+|' || 
                                     AC_CERTNO || '|+|' ||
                                     AC_PROPERTIES || '|+|' || 
                                     AC_CIFNAME || '|+|' || 
                                     CIF_NO || '|+|' || 
                                     CIF_NAME || '|+|' || 
                                     AC_NO2 || '|+|'
                                      FROM IBS_PTAB_MICROENTAC a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_microentac',
                                   '.tmp'));