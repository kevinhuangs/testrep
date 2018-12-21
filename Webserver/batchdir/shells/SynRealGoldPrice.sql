update 
      (select  a.GSP_PRONO    a1,
               a.GSP_PRICE    a2,
               a.GSP_STANDARD a3,
               a.GSP_SNAME    a4,
               a.GSP_TYPE	  a5,
               b.GSP_PRONO    b1,
               b.GSP_PRICE    b2,
               b.GSP_STANDARD b3,
               b.GSP_SNAME    b4,
               b.GSP_TYPE	  b5
          from IBS_PTAB_GOLDSALEPRICE a, IBS_PTAB_GOLDSALEPRICE_TMP b
         where a.gsp_prono = b.gsp_prono)
   set a1 = b1, a2 = b2, a3 = b3, a4 = b4, a5 = b5;
insert into IBS_PTAB_GOLDSALEPRICE
  (GSP_PRONO, GSP_PRICE, GSP_STANDARD, GSP_SNAME, GSP_TYPE)
  (select GSP_PRONO, GSP_PRICE, GSP_STANDARD, GSP_SNAME, GSP_TYPE
     from IBS_PTAB_GOLDSALEPRICE_TMP b
    where not exists (select a.gsp_prono
             from IBS_PTAB_GOLDSALEPRICE a
            where a.gsp_prono = b.gsp_prono));
delete from IBS_PTAB_GOLDSALEPRICE a
 where not exists (select a.gsp_prono
          from IBS_PTAB_GOLDSALEPRICE_TMP b
         where a.gsp_prono = b.gsp_prono);
commit;
exit;