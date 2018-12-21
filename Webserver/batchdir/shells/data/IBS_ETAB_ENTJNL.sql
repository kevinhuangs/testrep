set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     JNL_NO || '|+|' || 
                                     INIT_JNLNO || '|+|' ||
                                     to_char(JNL_DATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss') || '|+|' ||
                                     CIF_NO || '|+|' || 
                                     INIT_FLOWNO || '|+|' ||
                                     CUR_FLOWNO || '|+|' || 
                                     NEXT_FLOWNO ||'|+|' || 
                                     JNL_REJCODE || '|+|' ||
                                     JNL_STATUS || '|+|' || 
                                     JNL_TRANSNAME ||'|+|' || 
                                     JNL_USERID || '|+|' ||
                                     JNL_IPADDR || '|+|' || 
                                     JNL_BRANCHID ||'|+|' || 
                                     JNL_ORGAN || '|+|' ||
                                     to_char(JNL_ENDTIME, 'yyyyMMdd') ||'|+|' || 
                                     JNL_REJMESSAGE || '|+|' ||
                                     JNL_FLAG || '|+|' || 
                                     DETAIL_JNLNO ||'|+|' || 
                                     ROLE_ID || '|+|' || 
                                     JNL_ACNO ||'|+|' || 
                                     JNL_ACNO2 || '|+|' ||
                                     JNL_AMOUNT || '|+|' || 
                                     JNL_ACNO2NAME ||'|+|'
                                      from IBS_ETAB_ENTJNL a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_etab_entjnl',
                                   '.tmp'));
