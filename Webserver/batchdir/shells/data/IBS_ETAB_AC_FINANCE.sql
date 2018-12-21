set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     AC_NO || '|+|' || 
                                     CIF_NO || '|+|' ||
                                     BUSINESS_CODE || '|+|' || 
                                     CURRENCY_CODE || '|+|' || 
                                     PAY_MODE || '|+|' ||
                                     BASE_UNITCODE || '|+|' ||
                                     FIRST_UNITCODE || '|+|' ||
                                     FIRST_UNITNAME || '|+|' || 
                                     BASE_FLAG || '|+|' || 
                                     MONEY_FLAG || '|+|' || 
                                     TYPE || '|+|' || 
                                     AC_NAME || '|+|' || 
                                     AC_ORGAN || '|+|' || 
                                     AC_SALARYFLAG || '|+|' ||
                                     AC_ISSETSALARYFREQ || '|+|' ||
                                     AC_SALARYFREQ || '|+|' ||
                                     AC_SALARYTIMES || '|+|' ||
                                     AC_SALARYAMOUNT || '|+|' ||
                                     AC_BATCH_FLAG || '|+|' ||
                                     AC_ISSETBATCHREQ || '|+|' ||
                                     AC_BATCHFREQ || '|+|' || 
                                     AC_BATCHTIMES || '|+|' || 
                                     AC_BATCHAMOUNT || '|+|' ||
                                     AC_ISCHECK || '|+|' || 
                                     AC_BIGAMOUNT || '|+|' || 
                                     AC_SPECIALACCLIMIT || '|+|' ||
                                     AC_LEVEL || '|+|' ||
                                     to_char(AC_OPENDATE, 'yyyyMMdd') || '|+|'
                                      from IBS_ETAB_AC_FINANCE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_etab_ac_finance',
                                   '.tmp'));