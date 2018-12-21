set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                  (select /*+ parallel(a,0) */
                                    JNLNO||'|+|'||
									to_char(TRANSDATE,'yyyyMMdd')||'|+|'||
									ACNO||'|+|'||
									FUNDCODE||'|+|'||
									FUNDNAME||'|+|'||
									AMOUNT||'|+|'||
									to_char(BUYDATE,'yyyyMMdd')||'|+|'||
									BUY_MODE||'|+|'||
									FUNDCODE2||'|+|'||
									to_char(WT_DATE,'yyyyMMdd')||'|+|'||
									BARGAIN||'|+|'||
									WT_AMOUNT||'|+|'||
									SERIALNO||'|+|'||
									SHAREMODE||'|+|'||
									TARGETFUNDNAME||'|+|'||
									to_char(ASSO_DATE,'yyyyMMdd')||'|+|'||
									IS_OPEN||'|+|'||
									IS_ASSET_RECOMMEND||'|+|'
                                      from IBS_MTAB_MP_PJNLASSETPOOL a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_mtab_mp_pjnlassetpool',
                                   '.tmp'));