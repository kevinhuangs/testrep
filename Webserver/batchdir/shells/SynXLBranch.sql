delete from ibs_ptab_xlbranch t;
insert into ibs_ptab_xlbranch
  (bank_code, organ_id, organ_name, xl_ac, status)
  (
  select bank_code, organ_id, organ_name, xl_ac, status from ibs_ptab_xlbranch_tmp
  );
commit;
exit;