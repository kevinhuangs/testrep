set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999
set trimspool on
spool BankNo01.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *1 and t2.num > 10000* 1 - 10000;                                 
spool off                                                 
spool BankNo02.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *2 and t2.num > 10000* 2 - 10000;                                 
spool off                                                 
spool BankNo03.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *3 and t2.num > 10000* 3 - 10000;                                 
spool off                                                 
spool BankNo04.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *4 and t2.num > 10000* 4 - 10000;                                 
spool off                                                 
spool BankNo05.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *5 and t2.num > 10000* 5 - 10000;                                 
spool off                                                 
spool BankNo06.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *6 and t2.num > 10000* 6 - 10000;                                 
spool off                                                 
spool BankNo07.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *7 and t2.num > 10000* 7 - 10000;                                 
spool off                                                 
spool BankNo08.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *8 and t2.num > 10000* 8 - 10000;                                 
spool off                                                 
spool BankNo09.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *9 and t2.num > 10000* 9 - 10000;                                 
spool off                                                 
spool BankNo10.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *10 and t2.num > 10000* 10 - 10000;                                 
spool off                                                 
spool BankNo11.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *11 and t2.num > 10000* 11 - 10000;                                 
spool off                                                 
spool BankNo12.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *12 and t2.num > 10000* 12 - 10000;                                 
spool off                                                 
spool BankNo13.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *13 and t2.num > 10000* 13 - 10000;                                 
spool off                                                 
spool BankNo14.txt
select 	    FQHHAO
     ||'|'||LIANHH  
     ||'|'||ZHUANT  
     ||'|'||JIGULB  
     ||'|'||HANBDM  
     ||'|'||BHSJCY  
     ||'|'||ZJCYHH  
     ||'|'||SSRHDM  
     ||'|'||JIEDDM  
     ||'|'||CHSHDM  
     ||'|'||JIGOMC  
     ||'|'||JIGOJC  
     ||'|'||DIZHII  
     ||'|'||YOUZBM  
     ||'|'||DIHDIG  
     ||'|'||DZYJDZ  
     ||'|'||SXIORQ  
     ||'|'||SHIXRQ  
     ||'|'||GNGXRQ  
     ||'|'||GNGXSJ  
     ||'|'||CAOZBZ  
     ||'|'||GNGXQH  
     ||'|'||REMARK  
     ||'|'||SHJNCH  
     ||'|'||JILUZT  
     from                                                 
      (select rownum num , t.* from ibs_ptab_bankno t) t2 
     where t2.num<=10000 *14 and t2.num > 10000* 14 - 10000;                                 
spool off                                                 
exit
