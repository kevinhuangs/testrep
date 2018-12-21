delete from ibs_ptab_acdelete a;
insert into ibs_ptab_acdelete (cif_no,ac_no,status)
select kehhao,kahaoo,jiluzt from ibs_ptab_acdelete_card_tmp;

insert into ibs_ptab_acdelete (cif_no,ac_no,status)
select kehhao,zhangh,jiluzt from ibs_ptab_acdelete_cert_tmp;

insert into ibs_ptab_acdelete (cif_no,ac_no,status)
select kehhao,hqybth,jiluzt from ibs_ptab_acdelete_current_tmp;

insert into ibs_ptab_acdelete (cif_no,ac_no,status)
select kehhao,dqybth,jiluzt from ibs_ptab_acdelete_fix_tmp;
commit;
exit