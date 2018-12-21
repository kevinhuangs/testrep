set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999
set trimspool on
spool on
spool b2ekhhlls.txt
 select
 to_char(t.jnl_date,'yyyy-MM-dd')
     ||'|+|'||t.jnl_detailno
     ||'|+|'||t.batch_id
     ||'|+|'||t.clientpatchid
     ||'|+|'||t.cif_no
     ||'|+|'||t.user_id
     ||'|+|'||t.acno
     ||'|+|'||t.acno2
     ||'|+|'||t.transfertype
     ||'|+|'||t.amount
     from
     ibs_b2etab_jnl_b2e004 t , ibs_b2etab_superbankparam e
     where t.acno=e.ac_no
     and t.jnl_transcode='b2e004007'
     and e.param_type = '6'
	 and e.param_value ='1'
     and  jnl_date=trunc(sysdate-1);
spool off

spool acnolist.txt
select distinct a.inner_acno||'|+|'||a.ac_no from ibs_b2etab_superbankacrelation a,
                                (select * from ibs_b2etab_superbankparam c where c.param_type='6' and c.param_value = '1') b
      where a.cif_no = b.cif_no and a.ac_no = b.ac_no;
spool off
exit