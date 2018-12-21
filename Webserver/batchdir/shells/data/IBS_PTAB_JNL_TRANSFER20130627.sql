set trimspool on 
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     JNL_NO || '|+|' ||
                                     to_char(JNL_DATE, 'yyyyMMdd') || '|+|' ||
                                     USER_ID || '|+|' || 
                                     TRANS_CODE || '|+|' ||
                                     TRANS_STATUS || '|+|' || 
                                     AC_ORGANID || '|+|' || 
                                     AC_NO || '|+|' || 
                                     AC_TYPE || '|+|' || 
                                     AC_NO2 || '|+|' || 
                                     AC2_TYPE || '|+|' || 
                                     AC_NAME || '|+|' ||
                                     AC_ORGANNAME || '|+|' || 
                                     AMOUNT || '|+|' ||
                                     trim(replace(replace(REMARK, chr(13)),chr(10))) || '|+|' ||
                                     MONEY_FLAG || '|+|' || 
                                     CURRENCY || '|+||+|' || 
                                     FEE || '|+|' || 
                                     REALFEE || '|+|' || 
                                     INFORM || '|+|' || 
                                     DEAL_TYPE ||
                                     '|+|' || 
                                     DE_AMOUNT || '|+|' || 
                                     OUT_FLAG || '|+|' || 
                                     OPERATE_NO || '|+|' ||
                                     FALL_FLAG || '|+|' || 
                                     MOBILE || '|+|' ||
                                     AC_NAME1 || '|+|' || 
                                     AC_ORGANNAME1 || '|+|' || 
                                     AC_BASEFLAG || '|+|'
                                      from IBS_PTAB_JNL_TRANSFER a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_transfer',
                                   '.tmp'));