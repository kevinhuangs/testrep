spool ibs_ptab_jnl_points.tmp
set trimspool on
select
JNL_NO||'|+|'||to_char(JNL_DATE,'yyyyMMdd')||'|+|'||USER_ID||'|+|'||
TRANS_CODE||'|+|'||TRANS_STATUS||'|+|'||AC_ORGANID||'|+|'||
AC_NO||'|+|'||CURRENCY||'|+|'||POINTS_AMOUNT||'|+|'||POINTS_NPOINTS||'|+|'||
POINTS_PERSON||'|+|'||POINTS_ADDRESS||'|+|'||POINTS_TELNO||'|+|'||POINTS_CODE||'|+|'||POINTS_NOTES||'|+|'
||SIGN_DATA||'|+|'
from ibs_ptab_jnl_points where JNL_DATE >= trunc(sysdate-1, 'dd')  
and JNL_DATE < trunc(sysdate, 'dd');

spool off