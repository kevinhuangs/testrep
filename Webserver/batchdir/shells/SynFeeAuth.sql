delete from ibs_tab_fee_auth t;
insert into ibs_tab_fee_auth
  (			chnlinst_no, fee_no, auth)
  (
select  chnlinstno, billnum, flag from ibs_tab_fee_auth_tmp
  )  ;
commit;
exit;