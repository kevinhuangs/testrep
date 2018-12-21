update ibs_ptab_bankno b set b.superfqhhao=(select p1.fqhhao from ibs_ptab_pzfhh p1 where b.hanbdm=p1.hanbdm and rownum<2 and p1.qszxdh='IBPS') 
where exists(
select * from ibs_ptab_pzfhh p where b.hanbdm=p.hanbdm and p.hanbdm not in ('313','314','317','320','401','402') and p.qszxdh='IBPS'
) and b.hanbdm not in ('313','314','317','320','401','402');
update ibs_ptab_bankno b set b.superfqhhao='' where not exists(
select * from ibs_ptab_pzfhh p where b.hanbdm=p.hanbdm and p.hanbdm not in ('313','314','317','320','401','402') and p.qszxdh='IBPS'
) and b.hanbdm not in ('313','314','317','320','401','402');
commit;
exit;