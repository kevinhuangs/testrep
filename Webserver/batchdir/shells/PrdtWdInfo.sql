delete from IBS_PTAB_PRDCT_WORKDAYINFO;
insert into IBS_PTAB_PRDCT_WORKDAYINFO
(PRODUCT_CODE,PRODUCT_WORKDAY) 
(select PRODUCT_CODE,PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAYINFO_TMP a where 
		not exists 
		(select b.PRODUCT_CODE,b.PRODUCT_WORKDAY from IBS_PTAB_PRDCT_WORKDAYINFO b where a.PRODUCT_CODE=b.PRODUCT_CODE)
);
commit;
exit;