set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    JNL_NO||'|+|'||
		                            to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
                                    USER_ID || '|+|' ||
                                    TRANS_CODE || '|+|' ||
                                    TRANS_STATUS || '|+|' ||
                                    PAYER_DATE || '|+|' ||
                                    PAYER_NAME ||'|+|'||
                                    CURRENCY  || '|+|' ||
                                    TRANS_AMOUNT || '|+|' ||
                                    PAYEE_NAME ||'|+|'||
                                    AC_NO || '|+|' ||
                                    ADDRESS ||'|+|'||
                                    PAY_PURPOSE  || '|+|' ||
                                    trim(replace(replace(NOTE,chr(13)),chr(10)))||'|+|'||
                                    SIGN_FLAG  || '|+|' ||
                                    COUNTRY_NAME ||'|+|'||
                                    COUNTRY_ALL ||'|+|'
                                    from IBS_PTAB_JNL_OUTBOUND a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_ptab_jnl_outbound',
                                   '.tmp'));              
                                   
                                   
