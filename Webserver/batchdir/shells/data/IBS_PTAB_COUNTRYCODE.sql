set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     COUNTRY_ECODE || '|+|' || 
                                     COUNTRY_CODE ||'|+|' || 
                                     COUNTRY_SIMPLECODE || '|+|' ||
                                     COUNTRY_CNAME || '|+|' || 
                                     COUNTRY_ENAME ||'|+|' || 
                                     CONTINENT || '|+|' ||
                                     AREA_CODE || '|+|' || 
                                     AREA_NAME || '|+|' || 
                                     TIME_PRINT || '|+|' ||
                                     RECODE_STATUS || '|+|'
                                      from IBS_PTAB_COUNTRYCODE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_countrycode',
                                   '.tmp'));
