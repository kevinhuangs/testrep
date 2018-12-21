insert into IBS_PTAB_REPZFHH(FQHHAO,SHOW,ORAN_LEVEL)
(     
      select FQHHAO,'0','1' from IBS_PTAB_PZFHH t1 
      where not exists (select FQHHAO from IBS_PTAB_REPZFHH t2 where t2.FQHHAO=t1.FQHHAO) and substr(FQHHAO,1,3) not in ('313','314','317','320','401','402')
);
insert into IBS_PTAB_REPZFHH(FQHHAO,SHOW,ORAN_LEVEL,PARENT)
(     
select FQHHAO,'0','2',
case 
when substr(FQHHAO,1,3)='313' 
then 'selfadd00002'  
when substr(FQHHAO,1,3)='314' 
then 'selfadd00004' 
when substr(FQHHAO,1,3)='317' 
then 'selfadd00003'
when substr(FQHHAO,1,3)='320' 
then 'selfadd00005'
when substr(FQHHAO,1,3)='401' 
then 'selfadd00007'
when substr(FQHHAO,1,3)='402' 
then 'selfadd00006'
end 
from IBS_PTAB_PZFHH t1
      where not exists (select FQHHAO from IBS_PTAB_REPZFHH t2 where t2.FQHHAO=t1.FQHHAO) 
      and substr(FQHHAO,1,3) in ('313','314','317','320','401','402')
);
delete from  IBS_PTAB_REPZFHH t1
where not exists (select FQHHAO from IBS_PTAB_PZFHH t2 where t2.FQHHAO=t1.FQHHAO)
      and t1.SELF_ADD!='1' ;

commit;
exit;