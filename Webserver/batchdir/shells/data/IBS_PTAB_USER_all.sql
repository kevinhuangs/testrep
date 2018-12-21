set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     USER_ID || '|+|' || 
                                     USER_LOGINNAME ||'|+|' || 
                                     CIF_NO || '|+|' || 
                                     USER_TYPE ||'|+|' || 
                                     USER_PASSWORD || '|+|' ||
                                     USER_CERTNO || '|+|' || 
                                     USER_ORGANID ||'|+|' ||
                                     to_char(USER_OPENDATE, 'yyyyMMdd') ||'|+|' || 
                                     USER_STATUS || '|+|' ||
                                     to_char(USER_LASTLOGIN,'yyyyMMdd hh24:mi:ss') || '|+|' ||
                                     to_char(USER_LASTMODDATE, 'yyyyMMdd') ||'|+|' ||
                                     trim(replace(replace(USER_TIPNOTE,chr(13)),chr(10))) || '|+|' ||
                                     USER_STYLE || '|+|' ||
                                     USER_LOGINTIME ||'|+|' || 
                                     USER_FAILLOGIN || '|+|' ||
                                     USER_SETFLAG || '|+|' ||
                                     USER_TRANSFERFLAG || '|+|' ||
                                     USER_SOURCE || '|+|' ||
                                     USER_CERTSTORETYPE || '|+|' ||
                                     USER_PROLOGINTIME || '|+|' ||
                                     USER_TELNO4DYNAMIC || '|+|' ||
                                     USER_VERSIONSTATUS || '|+|' ||
                                     USER_MTRANSFERFLAG || '|+|' || 
                                     AVATAR ||'|+|' ||
                                     to_char(USER_LASTMODPWD, 'yyyyMMdd') ||'|+|' || 
                                     USER_FIRSTLOGIN || '|+|' ||
                                     USER_SETSTATUS || '|+|'
                                      from IBS_PTAB_USER a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_user',
                                   '.tmp'));
