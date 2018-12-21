set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CIF_NO || '|+|' || 
                                     AC_NO || '|+|' ||
                                     AC_STATUS || '|+|' || 
                                     AC_TYPE || '|+|' ||
                                     AC_CURRENCY || '|+|' || 
                                     AC_CURRTYPE ||'|+|' || 
                                     AC_TRANSFERTYPE || '|+|' ||
                                     to_char(AC_DATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(AC_CANCELDATE, 'yyyyMMdd') ||'|+|' || 
                                     AC_CIFNO || '|+|' || 
                                     AC_LEVEL ||'|+|' || 
                                     AC_PARENTCIF || '|+|' ||
                                     AC_LIMIT || '|+|' || 
                                     AC_DAYLIMIT ||'|+|' || 
                                     AC_REMAIN || '|+|' || 
                                     AC_OPEN ||'|+|' ||
                                     trim(replace(replace(AC_NAME, chr(13)),chr(10))) || '|+|' ||
                                     AC_OPENBANK || '|+|' ||
                                     to_char(AC_LIMITDATE, 'yyyyMMdd') ||'|+|' || 
                                     AC_LIMITAMOUNT || '|+|' ||
                                     AC_ALIAS || '|+|' || 
                                     AC_ORGAN || '|+|' ||
                                     AC_APPENDCHANNEL || '|+|' ||
                                     AC_BASEFLAG || '|+|' || 
                                     AC_SALARYFLAG ||'|+|' || 
                                     AC_ISCHECK || '|+|' ||
                                     AC_BIGAMOUNT || '|+|' ||
                                     AC_ISSETSALARYFREQ || '|+|' ||
                                     AC_SALARYFREQ || '|+|' ||
                                     AC_SALARYTIMES || '|+|' ||
                                     AC_SALARYAMOUNT || '|+|' ||
                                     AC_SUPVISETYPE || '|+|' ||
                                     AC_BATCH_FLAG || '|+|' ||
                                     AC_ISSETBATCHREQ || '|+|' ||
                                     AC_BATCHFREQ || '|+|' || 
                                     AC_BATCHTIMES ||'|+|' || 
                                     AC_BATCHAMOUNT || '|+|' ||
                                     AC_EPAYFLAG || '|+|' || '' || '|+|' ||
                                     AC_BATCHDRAWINGFLAG || '|+|' ||
                                     AC_SPECIALACCLIMIT || '|+|' ||
                                     AC_FUNCFLAG || '|+|' || '' || '|+|' ||
                                     ACCREDIT_CHECKBALFLAG || '|+|' ||
                                     AC_SUNFUND || '|+|' || 
                                     AC_SIGNFLAG ||'|+|' || 
                                     AC_E2PLIMITTYPE || '|+|' ||
                                     AC_E2PLIMITAMOUNT || '|+|' ||
                                     AC_ISSETINTERBANKFREQ || '|+|' ||
                                     AC_FREQFORINTERBANK || '|+|' ||
                                     AC_TIMESFORINTERBANK || '|+|' ||
                                     AC_AMOUNTFORINTERBANK || '|+|' ||
                                     AC_FEETYPE || '|+|'
                                      from IBS_ETAB_AC a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_etab_ac',
                                   '.tmp'));
