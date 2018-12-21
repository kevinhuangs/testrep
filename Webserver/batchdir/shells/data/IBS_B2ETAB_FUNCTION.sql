set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     trim(replace(replace(CIF_NO, chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(B2E_FUNCTION,chr(13)),chr(10))) || '|+|' ||
                                     TELLER || '|+|' ||
                                     to_char(CREATE_TIME, 'yyyyMMdd') || '|+|'
                                      from IBS_B2ETAB_FUNCTION a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_b2etab_function',
                                   '.tmp'));
