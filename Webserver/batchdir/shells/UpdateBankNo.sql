update 
       (select a.JIGULB a1,b.JIGULB b1,
               a.HANBDM a2,b.HANBDM b2,
               a.BHSJCY a3,b.BHSJCY b3,
               a.ZJCYHH a4,b.FQZJJG b4,
               a.JIEDDM a5,b.JIEDDM b5,
               a.JIGOMC a6,b.FUKRHM b6,
               a.JILUZT a7,b.JILUZT b7
               from IBS_PTAB_BANKNO a,IBS_PTAB_BANKNO_TMP b
               where a.FQHHAO=b.FQCYJG and a.JILUZT=b.JILUZT)
set a1=b1,a2=b2,a3=b3,a4=b4,a5=b5,a6=b6,a7=b7;

insert into IBS_PTAB_BANKNO 
     (FQHHAO,JIGULB,HANBDM,BHSJCY,ZJCYHH,JIEDDM,JIGOMC,JILUZT)
    (select FQCYJG,JIGULB,HANBDM,BHSJCY,FQZJJG,JIEDDM,FUKRHM,JILUZT
     from  IBS_PTAB_BANKNO_TMP b where not exists (select a.FQHHAO from IBS_PTAB_BANKNO a where a.FQHHAO = b.FQCYJG and b.JILUZT='0') and b.JILUZT='0');
     
delete from IBS_PTAB_BANKNO a where not exists (select a.FQHHAO from IBS_PTAB_BANKNO_TMP b where a.FQHHAO = b.FQCYJG and b.JILUZT='0');

update IBS_PTAB_BANKNO a set a.STATUS = '1' where a.STATUS = '0';

update IBS_PTAB_BANKNO a set a.STATUS = '0'
    where  exists (select a.FQHHAO from IBS_PTAB_BANKNODEL b where a.FQHHAO = b.FQHHAO);

update IBS_PTAB_BANKNO t set t.status = '0'
   where t.fqhhao like '001%' or  t.fqhhao like '011%';
commit;
exit;