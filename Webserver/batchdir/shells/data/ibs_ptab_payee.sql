set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     AC_NO || '|+|' ||
                                     trim(replace(replace(AC_NAME, chr(13)),chr(10))) || '|+|' ||
                                     SYS_FLAG || '|+|' ||
                                     trim(replace(replace(BANK_NAME, chr(13)),chr(10))) || '|+|' ||
                                     AC_TYPE || '|+|' || 
                                     PRIORITY || '|+|' ||
                                     PAYEE__ALIAS || '|+|' || 
                                     MOBILE_NO ||'|+|' || 
                                     FQHHAO || '|+|' || 
                                     BANKCODE ||'|+|' || 
                                     BANK || '|+|' || 
                                     QISHHH ||'|+|' || 
                                     FORBANKNAME || '|+|' ||
                                     ISUNIONPAY || '|+|' || 
                                     GROUPID || '|+|'
                                      from IBS_PTAB_PAYEE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_payee',
                                   '.tmp'));
