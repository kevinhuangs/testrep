delete from ibs_ptab_countryinfo t;
commit;
insert into ibs_ptab_countryinfo
(COUNTRYCODE,COUNTRYNAMEEN,COUNTRYNAMECN,CURRENCYISO,CURRENCYEN,CURRENCYXL,STATUS) 
(select COUNTRYCODE,COUNTRYNAMEEN,COUNTRYNAMECN,CURRENCYISO,CURRENCYEN,CURRENCYXL,STATUS from ibs_ptab_countryinfo_tmp a
);
commit;
exit;