
spool ibs_etab_jnl_b2ecard.tmp
set trimspool on
select 
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||
JNL_BATCHID||'|+|'||JNL_CLIENTPATCHID||'|+|'||CIF_NO||'|+|'||JNL_REJCODE||'|+|'||JNL_STATUS||'|+|'||
JNL_TRSSTATUS||'|+|'||JNL_TRANSNAME||'|+|'||JNL_USERID||'|+|'||JNL_ACNO||'|+|'||JNL_ACNO2||'|+|'||
JNL_CURRENCY||'|+|'||JNL_AMOUNT||'|+|'||ROLE_ID||'|+|'||JNL_BRANCHID||'|+|'||JNL_ORGAN||'|+|'||
to_char(JNL_ENDTIME,'yyyyMMdd hh24:mi:ss')||'|+|'||JNL_REJMESSAGE||'|+|'||TRANSFER_TYPE||'|+|'||CVV2||'|+|'||
VALID_DATE||'|+|'||AUTHER_NO||'|+|'||UNIT_NAME||'|+|'||UNIT_NO||'|+|'||CARD_OWNERNAME||'|+|'||
TOUNIT_NAME||'|+|'||NOTE||'|+|'
from IBS_ETAB_JNL_B2ECARD
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off
