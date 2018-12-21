set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     JNLNO || '|+|' || 
                                     ACNO || '|+|' ||
                                     CURRENCY || '|+|' || 
                                     AMOUNT || '|+|' ||
                                     ORDERID || '|+|' || 
                                     MERCHANTID || '|+|' ||
                                     to_char(TRANSDATE, 'yyyyMMdd') || '|+|' ||
                                     RANDOMSEQ || '|+|' || '' || '|+|' ||
                                     OTHERPAY || '|+|' || 
                                     CHANNEL || '|+|'
                                      from IBS_MTAB_PJNLPAY a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_mtab_pjnlpay',
                                   '.tmp'));