
spool ibs_b2etab_jnl_b2e003.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||JNL_DETAILNO||'|+|'||to_char(JNL_DETAILDATE,'yyyyMMdd')||'|+|'
||to_char(JNL_DATETIME,'yyyyMMdd hh24:mi:ss')||'|+|'||CIF_NO||'|+|'||USER_ID||'|+|'
||trim(replace(replace(JNL_TRANSCODE,chr(13)),chr(10)))||'|+|'||JNL_TRSSTATUS||'|+|'||JNL_STATUS||'|+|'
||trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))||'|+|'||trim(replace(replace(JNL_REJMSG,chr(13)),chr(10)))||'|+|'||BATCH_ID||'|+|'||CLIENTPATCHID||'|+|'||ACNO||'|+|'||ACNO2||'|+|'
||ACNAME2||'|+|'||AMOUNT||'|+|'||BILLTYPE||'|+|'||BANKTYPE||'|+|'||ACPTBRANCH||'|+|'||ACPTBANKNO||'|+|'
||ACPTBANKNAME||'|+|'||ISENDO||'|+|'||BATCHNO||'|+|'||MOBILE||'|+|'||ACPTDATE||'|+|'||DUEDATE||'|+|'
||PAYEEBANKNAME||'|+|'||PAYEEBANKNO||'|+|'||CONFERNNO||'|+|'||BILLID||'|+|'||TOENDORSEBANKNO||'|+|'||LIQUIDATION||'|+|'
||OVERDOSERESULTS||'|+|'||NOTES||'|+|'||ACPTSTUATS||'|+|'||to_char(CREATE_TIME,'yyyyMMdd hh24:mi:ss')||'|+|'
from IBS_B2ETAB_JNL_B2E003;
spool off
