set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    to_char(jnl_date,'yyyymmdd')||'|+|'||
                                    to_char(jnl_datetime,'hh24:mi:ss')||'|+|'||
                                    jnl_organid||'|+|'||
                                    jnl_entrytellerid||'|+|'||
                                    decode(jnl_transname, '5418','7891',jnl_transname)||'|+|'||
                                    jnl_copno||'|+|'||
                                    jnl_no||'|+|'||
                                    '0'||'|+|'||
                                    JNL_AUTHTELLERID||'|+|'
									from IBS_BTAB_JNL a where 
									jnl_date = trunc(sysdate-1) and jnl_status = '0' and jnl_copno is not null),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'NetBankTrans',
                                   '.txt'));
exit
