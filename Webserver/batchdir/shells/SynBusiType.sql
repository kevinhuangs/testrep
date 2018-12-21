--缴费类型表
delete from ibs_tab_fee_busitype t;
  insert into ibs_tab_fee_busitype
        (type_id, type_name, type_no)
        (
select paravalue, paraname,  paraid from ibs_tab_fee_parameter_tmp where PARATYPE='BillBusiType' and paraid is not null
        );
--号段运营商对应表
delete ibs_tab_fee_parameter;
insert into ibs_tab_fee_parameter
select a.paravalue FEE_NO,a.paraname OPERATOR_NAME,b.paraname PARA_VALUE,a.paraid OPERATOR_ID 
from (select paravalue,paraname,paraid from ibs_tab_fee_parameter_tmp t where t.paratype='OPERATORS') a,
(select paravalue,paraname,paraid from ibs_tab_fee_parameter_tmp t where t.paratype='NUMSEG') b 
where a.paraid=b.paravalue;
--领取发票说明表
delete ibs_tab_fee_common_pram;
insert into ibs_tab_fee_common_pram
select paratype,paravalue,paraname,paraid from ibs_tab_fee_parameter_tmp t 
where t.paratype in ('ExcessFareRule4ys','ExcessFareRule4dd')  or (t.PARATYPE='BillBusiType' and t.paraid is not null);
commit;
exit;