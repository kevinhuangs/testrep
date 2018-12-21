. /oracle/.profile

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo " *****${nowTime} 准备银企通跨行互联交易流水文件"
echo "set long 1999"
echo "set linesize 1999"
echo "set pagesize 0"
echo "set feedback 0"
echo "set termout off"
echo "set heading off"
echo "set longchunksize 1999"
echo "set trimspool on"
echo "select "
echo "to_char(t.jnl_date,'yyyy-MM-dd')"
echo "     ||'|+|'||t.jnl_detailno  "
echo "     ||'|+|'||t.batch_id "
echo "     ||'|+|'||t.clientpatchid  "
echo "     ||'|+|'||t.cif_no  "
echo "     ||'|+|'||t.user_id  "
echo "     ||'|+|'||t.acno "
echo "     ||'|+|'||t.acno2  "
echo "     ||'|+|'||t.transfertype "
echo "     ||'|+|'||t.amount  "
echo "     from        "                        }
echo "     ibs_b2etab_jnl_b2e004 t , ibs_b2etab_khhlparam e "
echo "     where t.acno=e.ac_no  "
echo "     t.jnl_transcode='b2e004007'  "
echo "     and e.bill_type='1'  "
echo "     and  jnl_date=trunc(sysdate-1) "
echo "spool off"
echo "exit"
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo " *****${nowTime} 准备导出银企通交易流水"
sqlplus bankdb/bankdb @b2ekhhl.sql
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo " *****${nowTime} 银企通交易流水导出完毕"
