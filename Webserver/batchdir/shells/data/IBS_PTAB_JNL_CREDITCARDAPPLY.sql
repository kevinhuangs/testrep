spool ibs_ptab_jnl_creditcardapply.tmp
set trimspool on
SELECT 
USER_ID||'|+|'||
to_char(JNL_DATE,'yyyyMMdd')||'|+|'||
JNL_NO||'|+|'||
TRANS_CODE||'|+|'||
TRANS_STATUS||'|+|'||
NAME_PY||'|+|'||
PHONE_NO||'|+|'||
EMAIL||'|+|'||
SEX||'|+|'||
CERT_TYPE||'|+|'||
CERT_NO||'|+|'||
to_char(CERT_DATE,'yyyyMMdd')||'|+|'||
CERT_ORG_PRO||'|+|'||
CERT_ORG_PRONAME||'|+|'||
CERT_ORG_CITY||'|+|'||
CERT_ORG_CITYNAME||'|+|'||
CERT_ORG_DISTRICT||'|+|'||
CERT_ORG_DISTRICTNAME||'|+|'||
NATION||'|+|'||
NATION_NAME||'|+|'||
REGISTER_CITY||'|+|'||
to_char(BIRTH_DATE,'yyyyMMdd')||'|+|'||
MARITAL_STATUS||'|+|'||
EDUCATE_STATUS||'|+|'||
HOUSE_TYPE||'|+|'||
HOME_ADDR||'|+|'||
HOME_POST||'|+|'||
HOME_CODE||'|+|'||
HOME_PHONE||'|+|'||
HOME_YEAR||'|+|'||
COMPANY_NAME||'|+|'||
COM_PART||'|+|'||
YEAR_INCONE||'|+|'||
COM_ADDR||'|+|'||
COM_POST||'|+|'||
COM_CODE||'|+|'||
COM_PHONE||'|+|'||
COM_PHONEEXT||'|+|'||
COMPANY_YEAR||'|+|'||
COM_INDUSTRY||'|+|'||
COM_NATURE||'|+|'||
COM_POSITION||'|+|'||
COM_TECHNICIANS||'|+|'||
FAMILY_NAME||'|+|'||
RELATION||'|+|'||
FAMILY_CODE||'|+|'||
FAMILY_PHONE||'|+|'||
FAMILY_MOBILE||'|+|'||
FAMILY_COM||'|+|'||
LINK_NAME||'|+|'||
LINK_RELATION||'|+|'||
LINK_CODE||'|+|'||
LINK_PHONE||'|+|'||
LINK_MOBILE||'|+|'||
LINK_COM||'|+|'||
BILL_SENDTYPE||'|+|'||
CARD_SENDTYPE||'|+|'||
GETCARD_TYPE||'|+|'||
CARD_TYPE||'|+|'||
CARD_NO||'|+|'||
CARDYX1||'|+|'||
CARDYX2||'|+|'||
CARD_ADDR||'|+|'||
LOGO||'|+|'||
COMPANYLOGO||'|+|'||
MEMO1||'|+|'||
PDCID||'|+|' 
FROM IBS_PTAB_JNL_CREDITCARDAPPLY
where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');
spool off