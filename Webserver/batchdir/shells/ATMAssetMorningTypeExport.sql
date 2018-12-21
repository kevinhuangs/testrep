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
                                    asset_code||'|+|'||asset_type||'|+|'
                                    from ibs_ptab_asset_params a
                                    where substr(sell_channel,4,1) = '0' 
                                    or substr(sell_channel,5,1) = '0'),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'asset_morning_type',
                                   '.txt'));
exit
