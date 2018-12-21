spool ibs_ptab_jnl_overseasunion.tmp
set trimspool on
SELECT
   to_char(JNL_DATE, 'yyyyMMdd') || '|+|' ||
   JNL_NO || '|+|' || 
   USER_ID || '|+|' ||
   TRANS_CODE || '|+|' || 
   TRANS_STATUS || '|+|' || 
   AC_ORGANID || '|+|' ||
   CURRENCY || '|+|' || 
   AC_NO || '|+|' || 
   SWIFT_CODE || '|+|' ||
   BRANCH_NAME || '|+|' || 
   ISUSE_AGENCY || '|+|' || 
   AGENCYSWIFT_CODE || '|+|' || 
   trim(replace(replace(PURPOES, chr(13)),chr(10))) || '|+|' ||
   trim(replace(replace(NOTE1, chr(13)),chr(10))) || '|+|' ||
   trim(replace(replace(POSTSCRIPT, chr(13)),chr(10))) || '|+|' ||
   SHOU_NAME || '|+|' || 
   ROUTINENO || '|+|' || 
   BRANCHNAMENO || '|+|' ||
   TRANSITCCNO || '|+|' || 
   BSB || '|+|' || 
   ACCEPTADDRESS || '|+|' ||
   FU_NAME || '|+|' || 
   FU_ADDRESS || '|+|' || 
   FU_PHONE || '|+|' ||
   FU_ACNO || '|+|' || 
   FU_AMOUNT || '|+|' || 
   FU_FEE || '|+|' ||
   FU_CHAOHUI_FEE || '|+|' || 
   CHAO_AMOUNT || '|+|' || 
   HUI_AMOUNT || '|+|' || 
   SIGN_FLAG || '|+|' || 
   COUNTRYCODE || '|+|' ||
   COUNTRYCODEALL || '|+|' ||
   trim(replace(replace(DEFAULTACCEPTADDRESS, chr(13)),chr(10))) || '|+|'
FROM ibs_ptab_jnl_overseasunion
where JNL_DATE >= trunc(sysdate-1, 'dd') 
  and JNL_DATE <  trunc(sysdate,   'dd');
spool off
