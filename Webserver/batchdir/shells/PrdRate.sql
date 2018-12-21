delete from ibs_ptab_profitrate;
insert into ibs_ptab_profitrate
(PRODUCT_CODE,PRODUCT_NAME,BEGINDATE,BEGIN_AMOUNT,END_AMOUNT,RATE,PRODUCT_LIMIT,ISROLL,RATEBASE) 
(select PRODUCT_CODE,PRODUCT_NAME,BEGINDATE,BEGIN_AMOUNT,END_AMOUNT,RATE,PRODUCT_LIMIT,ISROLL,RATEBASE
 from ibs_ptab_profitrate_tmp a where 
		not exists 
		(select b.PRODUCT_CODE,b.PRODUCT_NAME ,b.BEGINDATE,b.BEGIN_AMOUNT,b.END_AMOUNT,b.RATE,PRODUCT_LIMIT,b.ISROLL,b.RATEBASE
		 from ibs_ptab_profitrate b where a.PRODUCT_CODE=b.PRODUCT_CODE)
);
commit;
exit;