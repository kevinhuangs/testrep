delete from ibs_ptab_perloanbranch t;
insert into ibs_ptab_perloanbranch
  (jnl_no, par_type, bank_name, address, phone,conphone, business_type, islook, remark, input_userid, input_orgid, input_date, update_userid, update_orgid, update_date)
  (
  select jnl_no, par_type, bank_name, address, phone,conphone, business_type, islook, remark, input_userid, input_orgid, input_date, update_userid, update_orgid, update_date from ibs_ptab_perloanbranch_tmp
  );
commit;
exit;