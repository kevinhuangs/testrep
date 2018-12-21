update IBS_PTAB_BANKNO b set b.superfqhhao=(
select t3.bankNo from ibs_tab_bankarea t2 ,IBS_PTAB_SUPERBANKNO_SET t3 where t2.area_code=substr(b.fqhhao,4,4) and t3.prov_code=t2.prov_code and rownum<2
) where b.hanbdm='104';
update IBS_PTAB_BANKNO b set b.superfqhhao='104584000003' where b.hanbdm='104' and substr(b.fqhhao,4,4)='5840';
commit;
exit;