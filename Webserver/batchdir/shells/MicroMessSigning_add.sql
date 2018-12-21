set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999
set trimspool on
spool on
spool NB_WEIXIN_TMP.txt
 select 
     u.cif_no ||'|+|' || 
     t.mpid  ||'|+|' ||  
     to_char(t.currentdate,'yyyymmddHH24MMSS') ||'|+|' ||  
     t.mpflag ||'|+|'
 from 
      ibs_mtab_mp_user t, ibs_ptab_user u
 where  t.channel = '0'
  and   t.user_id = u.user_id
  and   t.mpflag='1'
  and 	t.currentdate >= trunc(sysdate-1, 'dd') 
  and   t.currentdate < trunc(sysdate, 'dd') ;

spool off
exit