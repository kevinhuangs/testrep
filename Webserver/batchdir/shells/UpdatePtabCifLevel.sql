update 
(
select t1.CIF_LEVEL CifLevel,t2.CIF_LEVEL TempCifLevel from IBS_PTAB_CIF t1 ,IBS_PTAB_CIF_LEVEL_TEMP t2 where t1.CIF_NO=t2.CIF_NO
) 
set CifLevel=TempCifLevel;
commit;
exit;