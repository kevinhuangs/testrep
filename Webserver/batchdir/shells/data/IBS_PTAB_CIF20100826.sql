
spool ibs_ptab_cif.tmp
set trimspool on
select
a.CIF_NO||'|+|'||a.CIF_NAME||'|+|'||a.CIF_CERTTYPE||'|+|'||a.CIF_CERTNO||'|+|'||a.CIF_SEX||'|+|'||
to_char(a.CIF_BIRTHDATE,'yyyyMMdd')||'|+|'||trim(replace(replace(a.CIF_HOMEADDR,chr(13)),chr(10)))||'|+|'||a.CIF_HOMEZIPCODE||'|+|'||a.CIF_HOMETELNO||'|+|'||
a.CIF_CELLPHONENO||'|+|'||a.CIF_EMAIL||'|+|'
from IBS_PTAB_CIF a,IBS_PTAB_USER b 
where b.USER_LASTMODDATE >= trunc(sysdate-1, 'dd') 
and b.USER_LASTMODDATE < trunc(sysdate, 'dd') 
and b.CIF_NO=a.CIF_NO ;
spool off
