delete from IBS_TAB_FEE_ECCXBUSI t;
    insert into ibs_tab_fee_eccxbusi
      (bill_num, tag, tag_name1, tag_order1, send_tag1, tag_name2, tag_order2, send_tag2, spec_flag, repea_flag, reserve1, reserve2, reserve3, reserve4, reserve5)
      (
select billnum,  tag,  tagname1,  tagorder1,  sendtag1,  tagname2,  tagorder2,  sendtag2,  specflag,  repeaflag, reserve1, reserve2, reserve3, reserve4, reserve5 from ibs_tab_fee_eccxbusi_tmp
       );
commit;
exit;