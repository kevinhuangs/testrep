spool ibs_mtab_mp_pjnlquery.tmp
set trimspool on
	 select
            JNLNO
            ||'|+|'||TO_CHAR(TRANSDATE,'yyyyMMdd')
            ||'|+|'||TO_CHAR(TRANSTIME,'yyyyMMdd hh24:mi:ss')
            ||'|+|'||MPID
            ||'|+|'||USERID
            ||'|+|'||TRANSCODE
            ||'|+|'||JNLSTATE
            ||'|+|'||RETURNCODE
            ||'|+|'||trim(replace(replace(replace(RETURNMSG,chr(13)),chr(10)),'|+|','#'))
            ||'|+|'||ACNO
            ||'|+|'||ACTYPE
            ||'|+|'||BEGINDATE
            ||'|+|'||ENDDATE
            ||'|+|'||trim(replace(replace(LOCALADDR,chr(13)),chr(10)))
            ||'|+|'  
        FROM IBS_MTAB_MP_PJNLQUERY;
spool off                                                  