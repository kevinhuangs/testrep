set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     JNL_NO||'|+|'||
       								 to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
       								 USER_ID||'|+|'||
       								 to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
       								 TRANS_CODE||'|+|'||
       								 TRANS_STATUS||'|+|'||
        							 AC_NO||'|+|'||
        							 AC_ORGANID||'|+|'||
      								 TRANS_PRICE||'|+|'||
       								 TRANS_SHARE||'|+|'||
       								 TRANS_AMOUNT||'|+|'||
                                     HANDLINGFEE||'|+|'||
       								 TRANS_SUM||'|+|'||
       								 JPDPROFITRATE||'|+|'||
       								 TRANS_TYPE||'|+|'||
       								 STARTMONTH||'|+|'||
       								 ENDMONTH||'|+|'||
       								 HOLDSHARE||'|+|'
                                      from IBS_PTAB_JNL_GOLDSTORE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_goldstore',
                                   '.tmp'));