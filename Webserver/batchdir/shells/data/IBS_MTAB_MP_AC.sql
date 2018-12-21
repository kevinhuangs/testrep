set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     AC_NO || '|+|' || 
                                     replace(replace(replace(AC_NAME ,chr(13)),chr(10)),'|+|','#')|| '|+|' ||
                                     AC_TYPE || '|+|' || 
                                     replace(replace(replace(AC_ALIAS ,chr(13)),chr(10)),'|+|','#') || '|+|' ||
                                     AC_ORGANID || '|+|' || 
                                     USER_ID || '|+|' ||
                                     PRIORITY || '|+|'||
                                     AC_NBTYPE||'|+|'
                                      from IBS_MTAB_MP_AC a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_mtab_mp_ac',
                                   '.tmp'));
