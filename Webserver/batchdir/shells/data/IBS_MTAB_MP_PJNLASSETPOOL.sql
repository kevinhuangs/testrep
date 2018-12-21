spool ibs_mtab_mp_pjnlassetpool.tmp
set trimspool on
SELECT 
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
IS_OPEN||'|+|'||
IS_ASSET_RECOMMEND||'|+|'
FROM IBS_MTAB_MP_PJNLASSETPOOL
where TRANSDATE >= trunc(sysdate-1, 'dd') 
  and TRANSDATE <  trunc(sysdate,   'dd');
spool off