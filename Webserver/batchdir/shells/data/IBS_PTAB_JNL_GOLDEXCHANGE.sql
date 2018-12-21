spool ibs_ptab_jnl_goldexchange.tmp
set trimspool on
select JNL_NO||'|+|'||
       to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
       USER_ID||'|+|'||
       to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
       TRANS_CODE||'|+|'||
       TRANS_STATUS||'|+|'||
       AC_NO||'|+|'||
       AC_ORGANID||'|+|'||
       PRODUCT||'|+|'||
       PRODUCTPRICE||'|+|'||
       EXCHANGEAMT||'|+|'||
       TRANSPRICE||'|+|'||
       EXCHANGESHARE||'|+|'||
       EXCHANGEADDCASH||'|+|'||
       CERTTYPE||'|+|'||
       CERTNO||'|+|'||
       TELNO||'|+|'||
       BRANCH_ID||'|+|'||
       trim(replace(replace(INVOICETITLE,chr(13)),chr(10)))||'|+|'||
       PAYTYPE||'|+|'||
       GOLDORDERNO||'|+|'||
       BRANCH_NAME||'|+|'||
       ORGAN_ID||'|+|'||
       ORGAN_NAME||'|+|'||
       PRODUCTNAME||'|+|'||
       PRODUCTMARKETVALUE||'|+|'
  from IBS_PTAB_JNL_GOLDEXCHANGE
 where JNL_DATE >= trunc(sysdate-1, 'dd')  
      and JNL_DATE < trunc(sysdate, 'dd');
spool off