set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
								     USER_ID||'|+|'||
								     MPID||'|+|'||
								     MPFLAG||'|+|'||
								     to_char(CURRENTDATE,'yyyyMMdd')||'|+|'||
								     CHANNEL||'|+|'
								  	from IBS_MTAB_MP_USER a ),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   'ibs_mtab_mp_user',
                                   '.tmp'));