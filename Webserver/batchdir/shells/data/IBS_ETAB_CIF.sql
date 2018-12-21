set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CIF_NO || '|+|' || 
                                     BRANCH_ID || '|+|' ||
                                     ORGAN_ID || '|+|' || 
                                     CIF_NAME || '|+|' ||
                                     CIF_SHORTNAME || '|+|' || 
                                     CIF_ENGNAME || '|+|' || 
                                     CIF_IDTYPE || '|+|' ||
                                     CIF_IDNO || '|+|' || 
                                     CIF_BOSSNAME || '|+|' || 
                                     CIF_BOSSIDTYPE || '|+|' ||
                                     CIF_BOSSIDNO || '|+|' || 
                                     CIF_APPLYNAME || '|+|' || 
                                     CIF_LINKMAN || '|+|' ||
                                     CIF_EMAIL || '|+|' ||
                                     trim(replace(replace(CIF_ADDR, chr(13)),chr(10))) || '|+|' ||
                                     CIF_TELNO || '|+|' || 
                                     CIF_FAX || '|+|' ||
                                     CIF_ZIPCODE || '|+|' || 
                                     CIF_CERT_NUM || '|+|' || 
                                     CIF_CERT_DN || '|+|' ||
                                     CIF_STATUS || '|+|' || 
                                     CIF_AUTHFLAG || '|+|' || 
                                     CIF_AUTHLEVEL || '|+|' ||
                                     to_char(CIF_REGISTERDATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(CIF_OPENDATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(CIF_CLOSEDATE, 'yyyyMMdd') || '|+|' || 
                                     CIF_BANKUSERID || '|+|' ||
                                     CIF_BANKCHECKER || '|+|' ||
                                     CIF_BANKOPENUSER || '|+|' ||
                                     CIF_CERTTYPE || '|+|' || 
                                     CIF_MANAGEFLAG ||'|+|' ||
                                     to_char(CIF_LOGINTIME, 'yyyyMMdd') || '|+|' || 
                                     CIF_OTHERFLAG|| '|+|' ||
                                     CIF_REMAIN || '|+|' || 
                                     CIF_FEEDATE || '|+|' || 
                                     CIF_FEEFLAG || '|+|' ||
                                     CIF_ALIAS || '|+|' || 
                                     CIF_TYPE || '|+|' ||
                                     CIF_LICENSENO || '|+|' ||
                                     CIF_LICENSEDATE || '|+|' ||
                                     CIF_FOREIGNNO || '|+|' ||
                                     CIF_FELICENSENO || '|+|' ||
                                     CIF_ISGROUPPARTNER || '|+|' ||
                                     CIF_ISGROUPRELATE || '|+|' || 
                                     CIF_CODE || '|+|' || 
                                     CIF_CLOSEUSERID || '|+|' ||
                                     CIF_CLOSECHECKER || '|+|' ||
                                     CIF_OPERAPPLYNAME || '|+|' ||
                                     CIF_OPERAPPLYUNIT || '|+|' ||
                                     CIF_OPERAPPLYIDTYPE || '|+|' ||
                                     CIF_OPERAPPLYIDNO || '|+|' ||
                                     to_char(CIF_OPERAPPLYDATE, 'yyyyMMdd') || '|+|' || 
                                     CIF_OPERAPPLYREMARK || '|+|' ||
                                     CIF_SIGNCHECK || '|+|' ||
                                     to_char(CIF_SIGNDATE, 'yyyyMMdd') || '|+|' ||
                                     to_char(CIF_DROPDATE, 'yyyyMMdd') || '|+|' || 
                                     CIF_SIGNFLAG || '|+|' ||
                                     CIF_E2PLIMITTYPE || '|+|' ||
                                     CIF_E2PLIMITAMOUNT || '|+|' ||
                                     CHECK_BALANCE_FLAG || '|+|' ||
                                     to_char(CHECK_BALANCEDATE, 'yyyyMMdd') || '|+|'
                                      from IBS_ETAB_CIF a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_etab_cif',
                                   '.tmp'));
