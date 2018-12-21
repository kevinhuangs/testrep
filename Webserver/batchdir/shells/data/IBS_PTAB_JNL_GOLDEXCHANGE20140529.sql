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
       								 PRODUCT||'|+|'||
       								 PRODUCTPRICE||'|+|'||
       								 EXCHANGEAMT||'|+|'||
       								 TRANSPRICE||'|+|'||
       								 EXCHANGESHARE||'|+|'||
       								 EXCHANGEADDCASH||'|+|'||
       								 CERTTYPE||'|+|'||
       								 CERTNO||'|+|'||
       								 TELNO||'|+|'||
       								 BRANCH_ID||'|+|'||
       								 trim(replace(replace(INVOICETITLE,chr(13)),chr(10)))||'|+|'||
       								 PAYTYPE||'|+|'||
       								 GOLDORDERNO||'|+|'||
       								 BRANCH_NAME||'|+|'||
       								 ORGAN_ID||'|+|'||
       								 ORGAN_NAME||'|+|'||
       								 PRODUCTNAME||'|+|'||
       								 PRODUCTMARKETVALUE||'|+|'
                                      from IBS_PTAB_JNL_GOLDEXCHANGE a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_goldexchange',
                                   '.tmp'));
