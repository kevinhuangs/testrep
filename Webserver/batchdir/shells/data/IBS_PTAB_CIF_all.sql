set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    distinct a.CIF_NO || '|+|' || 
                                             a.CIF_NAME ||'|+|' || 
                                             a.CIF_CERTTYPE ||'|+|' || 
                                             a.CIF_CERTNO || '|+|' ||
                                             a.CIF_SEX || '|+|' ||
                                             to_char(a.CIF_BIRTHDATE,'yyyyMMdd') || '|+|' ||
                                             trim(replace(replace(a.CIF_HOMEADDR,chr(13)),chr(10))) || '|+|' ||
                                             a.CIF_HOMEZIPCODE || '|+|' ||
                                             a.CIF_HOMETELNO || '|+|' ||
                                             a.CIF_CELLPHONENO || '|+|' ||
                                             a.CIF_EMAIL || '|+|'
                                      from IBS_PTAB_CIF a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_cif',
                                   '.tmp'));