set heading off
spool ibs_mtab_pjnl.tmp
set trimspool on
select JnlNo || '|+|' || to_char(TransDate, 'yyyyMMdd') || '|+|' || to_char(TransTime, 'HH24miss') || '|+|' || TransCode 
	  || '|+|' || JnlState || '|+|' ||  TRSSTATE  || '|+|' || replace(replace(ReturnCode,chr(13)),chr(10))|| '|+|' || replace(replace(ReturnMsg,chr(13)),chr(10)) || '|+|' 
	  || AcNo || '|+|' || Amount || '|+|' || Currency || '|+|' ||  CRFlag   || '|+|' 
	  ||UserId || '|+|' || BankSeq  || '|+|' || ChannelId   || '|+|' || RootJnlNo  || '|+|' 
	  || LocalAddr   || '|+|' ||  LoginType  || '|+|' ||  FEE   || '|+|' || MOBILEPHONE   
	  || '|+|' ||  ACTYPE    || '|+|' ||  REALFEE   || '|+|' 
	from IBS_MTAB_PJnl
	where TRANSDATE >= trunc(sysdate-1, 'dd') 
				and TRANSDATE < trunc(sysdate, 'dd') ;
spool off

