set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     JNL_NO || '|+|' ||
                                     to_char(JNL_DATE, 'yyyyMMdd') || '|+|' ||
                                     USER_ID || '|+|' || 
                                     TRANS_CODE || '|+|' ||
                                     TRANS_STATUS || '|+|' || 
                                     AC_ORGANID ||'|+|' || 
                                     AC_NO || '|+|' || 
                                     AC_NAME ||'|+|' || 
                                     FUND_CODE || '|+|' ||
                                     FUND_NAME || '|+|' || 
                                     AMOUNT || '|+|' ||
                                     to_char(BUY_DATE, 'yyyyMMdd') || '|+|' ||
                                     BUY_MODE || '|+|' || 
                                     FUND_CODE2 ||'|+|' || 
                                     to_char(WT_DATE, 'yyyyMMdd') ||'|+|' || 
                                     BARGAIN || '|+|' || 
                                     WT_AMOUNT ||'|+|' || 
                                     SERIALNO || '|+|' || 
                                     SHAREMODE ||'|+|' || 
                                     TARGETFUNDNAME || '|+|' ||
                                     MANAGER_ORGANID || '|+|' || 
                                     MANAGER_NO ||'|+|' || 
                                     WTCHANNEL_ID || '|+|'
                                      from IBS_PTAB_JNL_TAFUND a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_tafund',
                                   '.tmp'));
