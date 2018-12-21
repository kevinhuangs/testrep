
spool ibs_b2etab_jnl_b2e008.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||JNL_DETAILNO||'|+|'||to_char(JNL_DETAILDATE,'yyyyMMdd')||'|+|'
||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||USER_ID||'|+|'
||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_STATUS||'|+|'
||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||BATCH_ID||'|+|'||CLIENTPATCHID||'|+|'||CUSTNO||'|+|'||SAVEBILLID||'|+|'||FLAG||'|+|'
||BILLNO||'|+|'||decode(BILLTYPE,'1','AC01','AC02')||'|+|'||ACSTDT||'|+|'||DUEDT||'|+|'||BILLMONEY||'|+|'||REMITTERCUSTBANK||'|+|'||OUTBILLPERSON||'|+|'
||REMITTERCUSTACCT||'|+|'||REMITTERCUSTBANKNO||'|+|'||PAYEE||'|+|'||PAYEEACCT||'|+|'||PAYEEBANK||'|+|'||DRAWEEBANK||'|+|'||BILLBEFOREOWNER||'|+|'
||INPUTTYPE||'|+|'||BEFORENUMBER||'|+|'||NAMEONE||'|+|'||NAMETWO||'|+|'||NAMETHREE||'|+|'||NAMEFOUR||'|+|'||NAMEFIVE||'|+|'
||NAMESIX||'|+|'||NAMESEVEN||'|+|'||NAMEEIGHT||'|+|'||NAMENINE||'|+|'||ASKID||'|+|'||GETWAY||'|+|'||ATTOENCUSTNO||'|+|'
||GETBILLID||'|+|'||UIMPAWNGETWAY||'|+|'
from IBS_B2ETAB_JNL_B2E008 
where JNL_DATE >= trunc(sysdate-1, 'dd') 
and JNL_DATE < trunc(sysdate, 'dd');
spool off
