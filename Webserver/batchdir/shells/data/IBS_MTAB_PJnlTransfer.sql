set heading off
spool ibs_mtab_pjnltransfer.tmp
set trimspool on
select JNLNO || '|+|' || ACNO || '|+|' || PAYEEACNO
      || '|+|' || replace(replace(PAYEEACNAME,chr(13)),chr(10)) || '|+|' ||BANKCODE  || '|+|' ||
    AMOUNT ||'|+|' ||CURRENCY  ||'|+|' ||CRFLAG  ||'|+|' ||REMARK  || '|+|' ||PUSHRANDOMSEQ  ||'|+|' ||PAYEEIOFLAG  ||'|+|' ||MOBILEPHONE  ||'|+|' || to_char(TRANSDATE, 'yyyyMMdd')  ||'|+|'||
    OUT_FLAG||'|+|'||JYBWBZ||'|+|'
     from IBS_MTAB_PJnlTransfer
     where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off