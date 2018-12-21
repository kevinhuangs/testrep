set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     DON_NO || '|+|' ||
                                     trim(replace(replace(DON_DEPTNAME,chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(DON_NAME, chr(13)),chr(10))) || '|+|' ||
                                     DON_ITEM || '|+|' ||
                                     trim(replace(replace(DON_MSG, chr(13)),chr(10))) || '|+|' ||
                                     AMOUNT_LIMIT1 || '|+|' || 
                                     AMOUNT_LIMIT2 ||'|+|' ||
                                     trim(replace(replace(SUCCESS_MSG,chr(13)),chr(10))) || '|+||+|'
                                      from IBS_PTAB_DONMSG a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_donmsg',
                                   '.tmp'));