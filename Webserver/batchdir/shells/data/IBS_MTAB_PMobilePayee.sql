set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                     UserId || '|+|' || 
                                     PayeeAcNo || '|+|' ||
                                     PayeeAcName || '|+|' || 
                                     MobileNo || '|+|' || 
                                     Currency || '|+|' || 
                                     SysFlag || '|+|' || 
                                     ProCity || '|+|' || 
                                     PayeeBank || '|+|' || 
                                     BankAcType || '|+|' || 
                                     Channel || '|+|' || 
                                     BankCode || '|+|' || 
                                     DrecCode || '|+|'
                                      from IBS_MTAB_PMobilePayee a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_mtab_pmobilepayee',
                                   '.tmp'));
