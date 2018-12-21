set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     CITY_ID || '|+|' || 
                                     TYPE_ID || '|+|' ||
                                     ITEM_NO || '|+|' || 
                                     ITEM_NAME || '|+|' ||
                                     trim(replace(replace(ITEM_TIPS, chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(ITEM_UNIT, chr(13)),chr(10))) || '|+|' ||
                                     ITEM_TYPE || '|+|' || 
                                     ITEM_TRANCODE1 || '|+|' || 
                                     ITEM_TRANCODE2 || '|+|' ||
                                     ITEM_RULES || '|+|' || 
                                     ITEM_PROCESS_NO ||'|+|' || 
                                     ITEM_INPUTS_NO || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT1,chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT2,chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT3,chr(13)),chr(10))) || '|+|' ||
                                     ITEM_LIMIT_FLAG || '|+|' ||
                                     ITEM_LIMIT_RULES || '|+|' ||
                                     ITEM_PRESERVE1 || '|+|' ||
                                     ITEM_PRESERVE2 || '|+|' ||
                                     ITEM_PRESERVE3 || '|+|' ||
                                     ITEM_INPUT1_TYPE || '|+|' ||
                                     ITEM_INPUT2_TYPE || '|+|' ||
                                     ITEM_INPUT3_TYPE || '|+|' ||
                                     ITEM_CHANNEL_FLAG || '|+|' || 
                                     ITEM_ID ||'|+|' || 
                                     ITEM_ACTYPE_FLAG || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT1_INFO,chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT2_INFO,chr(13)),chr(10))) || '|+|' ||
                                     trim(replace(replace(ITEM_INPUT3_INFO,chr(13)),chr(10))) || '|+|'
                                      from IBS_PTAB_FEEITEM a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_feeitem',
                                   '.tmp'));