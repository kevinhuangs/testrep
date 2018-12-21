set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     trim(replace(replace(TELLER_ID, chr(13)),chr(10))) || '|+|' ||
                                     TELLER_BRANCHID || '|+|' ||
                                     TELLER_DEPTID || '|+|' || 
                                     TELLER_NAME || '|+|' || 
                                     TELLER_TELEPHONE || '|+|' ||
                                     TELLER_CELLPHONE || '|+|' ||
                                     TELLER_EMAIL || '|+|' ||
                                     TELLER_PASSWORD || '|+|' ||
                                     TELLER_STATUS || '|+|' ||
                                     to_char(TELLER_OPENDATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(TELLER_CLOSEDATE, 'yyyyMMdd') || '|+|' || 
                                     TELLER_ROOTFLAG || '|+|' ||
                                     to_char(TELLER_LASTLOGIN, 'yyyyMMdd') || '|+|' || 
                                     TELLER_LOGINIP || '|+|'
                                      from ibs_btab_teller a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_btab_teller',
                                   '.tmp'));