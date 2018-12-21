set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CIF_NO || '|+|' || 
                                     FILLER || '|+|' ||
                                     FILLER_PHONE || '|+|' || 
                                     TRS_BODY || '|+|' || 
                                     FOREX_STATUS || '|+|' ||
                                     to_char(FOREX_OPENDATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(FOREX_CLOSEDDATE, 'yyyyMMdd') || '|+|' || 
                                     FOREX_TYPE || '|+|' ||
                                     TELLER_NAME || '|+|' ||
                                     to_char(OPERATE_DATE, 'yyyyMMdd') || '|+|'
                                      FROM IBS_ETAB_CIF_FOREXINFO a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_etab_cif_forexinfo',
                                   '.tmp'));