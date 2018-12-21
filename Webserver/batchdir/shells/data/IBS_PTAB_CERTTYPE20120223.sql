spool ibs_ptab_certtype.tmp
set trimspool on
select
CORE_CERTTYPE||'|+|'||CREDIT_CERTTYPE||'|+|'||CERTTYPE_NAME||'|+|'||CHANNEL_TYPE||'|+|'
from ibs_ptab_certtype;

spool off