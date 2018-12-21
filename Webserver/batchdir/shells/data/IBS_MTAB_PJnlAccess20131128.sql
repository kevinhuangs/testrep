spool ibs_mtab_pjnlaccess.tmp
set trimspool on
	 select 
	 ACCESSJNLNO  || '|+|' || 
	 ACCESSSTATE || '|+|' || 
	 ACCESSIP    || '|+|' || 
	 CHANNELID || '|+|' ||  
	 LOGINTYPE || '|+|' || 
	 USERID    || '|+|' || 
	 to_char(ACCESSDATE, 'yyyyMMdd')  || '|+|' || 
	 to_char(ACCESSTIME, 'hh24miss')  || '|+|' ||
	 trim(replace(replace(JNL_REJCODE,chr(13)),chr(10)))|| '|+|' ||
	 MPID || '|+|'
	from  IBS_MTAB_PJnlAccess ;
spool off                