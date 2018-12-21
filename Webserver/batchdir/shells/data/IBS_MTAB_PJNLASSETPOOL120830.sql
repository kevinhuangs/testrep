spool ibs_mtab_pjnlassetpool.tmp
set trimspool on
 select
  JNLNO||'|+|'||
  to_char(TRANSDATE,'yyyyMMdd')||'|+|'||
  ACNO||'|+|'||
  FUNDCODE||'|+|'||
  FUNDNAME||'|+|'||
  AMOUNT||'|+|'||
  to_char(BUYDATE,'yyyyMMdd')||'|+|'||
  BUY_MODE||'|+|'||
  FUNDCODE2||'|+|'||
  to_char(WT_DATE,'yyyyMMdd')||'|+|'||
  BARGAIN||'|+|'||
  WT_AMOUNT||'|+|'||
  SERIALNO||'|+|'||
  SHAREMODE||'|+|'||
  TARGETFUNDNAME||'|+|'||
  to_char(ASSO_DATE,'yyyyMMdd')||'|+|'||
  IS_OPEN||'|+|'
from IBS_MTAB_PJNLASSETPOOL;
spool off



  
