delete from ibs_tab_fee_aerainfo t;
insert into ibs_tab_fee_aerainfo
  (city_no, city_code, city_level, ucity_no, branch_id, city_name, snd_citycode, ucity_name, reserve1, reserve2)
  (
  select cityno, citycode, citylevel, ucitycode, branchid, cityname, sndcitycode, ucityname, reserve1, reserve2 from ibs_tab_fee_aerainfo_tmp
  );
commit;
exit;