set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     USER_DN || '|+|' ||
                                     USER_NAME || '|+|' || 
                                     USER_ID_TYPE ||'|+|' || 
                                     USER_ID_NO || '|+|' || 
                                     EMAIL ||'|+|' || 
                                     USER_STATUS || '|+|' ||
                                     LEVEL_ID || '|+|' || 
                                     LRA_ID || '|+|' ||
                                     CERT_TYPE || '|+|' ||
                                     to_char(CA_TIME, 'yyyyMMdd hh24:mi:ss') ||'|+|' || 
                                     REF_NO || '|+|' || 
                                     AUTH_CODE ||'|+|' || 
                                     TMPL_ID || '|+|' || 
                                     SERIAL_NO ||'|+|' || 
                                     CA_CODE || '|+|' ||
                                     DISTRIBUTE_MODE || '|+|' || 
                                     SUB_CODE ||'|+|' ||
                                     trim(replace(replace(ERROR_CODE,chr(13)),chr(10))) || '|+|' ||
                                     TELE_NO || '|+|' || 
                                     ADDRESS || '|+|' ||
                                     DOMAIN_IP || '|+|' ||
                                     DECODE(oid, 'null', '') || '|+|' ||
                                     START_TIME || '|+|' || 
                                     END_TIME ||'|+|'
                                      from gd.USERTBL a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'usertbl',
                                   '.tmp'));
