delete from ibs_tab_fee_busiaera t;
 insert into ibs_tab_fee_busiaera
    (fee_no, city_level, city_no, busi_type)
    (
select billnum, citylevel, cityid, BILLBUSITYPE from ibs_tab_fee_busiaera_tmp
    );
commit;
exit;