update IBS_PTAB_BANKNO  b set b.xiaoeflag='0' where b.jiluzt='0' and
'1'<>(select substr(t.CANSSJ,2,1) from ibs_ptab_bankno_tmp  t where t.fqcyjg=b.fqhhao and t.jiluzt='0');

update IBS_PTAB_BANKNO  b set b.xiaoeflag='1' where b.jiluzt='0' and 
'1'=(select substr(t.CANSSJ,2,1) from ibs_ptab_bankno_tmp  t where t.fqcyjg=b.fqhhao and t.jiluzt='0');

commit;
exit;