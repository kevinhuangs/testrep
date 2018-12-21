select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
					                  JNLNO || '|+|' || 
					                  ACNO || '|+|' || 
					                  PAYEEACNO|| '|+|' || 
					                  replace(replace(PAYEEACNAME,chr(13)),chr(10)) || '|+|' ||
					                  BANKCODE  || '|+|' ||
					                  AMOUNT ||'|+|' ||
					                  CURRENCY  ||'|+|' ||
					                  CRFLAG  ||'|+|' ||
					                  REMARK  || '|+|' ||
					                  PUSHRANDOMSEQ  ||'|+|' ||
					                  PAYEEIOFLAG  ||'|+|' ||
					                  MOBILEPHONE  ||'|+|' || 
					                  to_char(TRANSDATE, 'yyyyMMdd')  ||'|+|'||
					                  OUT_FLAG||'|+|'||
					                  JYBWBZ||'|+|'
					                from IBS_MTAB_PJNLTRANSFER a 
					                where a.transdate>=to_date('20140528','yyyy-MM-dd')
					                and  a.transdate<to_date('20140829','yyyy-MM-dd')
					                ),
                                    0,
                                    'NBTXTPUMP_DATAPATH_EDW',
                                    'ibs_mtab_pjnltransfer',
                                    '.tmp'));
