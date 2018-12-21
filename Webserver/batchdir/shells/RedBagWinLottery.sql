--更新的红包参数信息
 update 
      (select  a.Batch_Num       a1,
               a.RedEnv_Name     a2,
	           a.RedEnv_EndDate  a3,
	           a.City_Code       a4,
	           a.Start_Date      a5,
	           a.End_Date        a6,
	           a.TopPrize_Amt    a7,
	           b.Batch_Num       b1,
	           b.RedEnv_Name     b2,
	           b.RedEnv_EndDate  b3,
	           b.City_Code       b4,
	           b.Start_Date      b5,
	           b.End_Date        b6,
	           b.TopPrize_Amt    b7
          from IBS_PTAB_CJ_REDENVPARA a, IBS_PTAB_CJ_REDENVPARA_TMP b
         where a.Batch_Num = b.Batch_Num)
   set a1 = b1, a2 = b2, a3 = b3, a4 = b4,a5 = b5,a6 = b6,a7 = b7; 
   
--新增加的红包参数信息                      
	    insert into IBS_PTAB_CJ_REDENVPARA (Batch_Num,RedEnv_Name, RedEnv_EndDate, City_Code,Start_Date,End_Date,TopPrize_Amt)
	   (select Batch_Num, RedEnv_Name, RedEnv_EndDate, City_Code,Start_Date,End_Date,TopPrize_Amt
	     from IBS_PTAB_CJ_REDENVPARA_TMP t2
	     where not exists(select t1.Batch_Num from IBS_PTAB_CJ_REDENVPARA t1
	                    where t1.Batch_Num = t2.Batch_Num));
--删除的红包参数信息  
      delete from IBS_PTAB_CJ_REDENVPARA  t1
	  where not exists(
		    select t2.Batch_Num from IBS_PTAB_CJ_REDENVPARA_TMP t2
		    where t1.Batch_Num = t2.Batch_Num );
--删除的抽奖网银适用信息		    
	 delete from  ibs_ptab_cj_netbapplicate  t1
      where  not exists
		  (select t2.batch_num from ibs_ptab_cj_redenvpara_tmp t2
		    where t1.batch_num = t2.batch_num );
--删除的手机银行营销活动信息
     delete from  ibs_mtab_cj_netbapplicate  t1
     where  not  exists
		  (select t2.batch_num from ibs_ptab_cj_redenvpara_tmp t2	
		    where t1.batch_num = t2.batch_num );
--抽奖业务授权信息全删全加		  
	  delete from IBS_PTAB_CJ_AUTH;
	   insert into IBS_PTAB_CJ_AUTH (Batch_Num,  Mer_No)
		      (select Batch_Num, Mer_No from IBS_PTAB_CJ_AUTH_TMP);
commit;
exit;
		      