currentpath="/backup/batchdir/shells"
cd ${currentpath}
rm ${currentpath}/ibs_btab_teller.txt
sqlplus bankdb/bankdb @ibs_btab_teller.sql
#生成数据就绪文件数据
sh ${currentpath}/put.sh ${currentpath}/ibs_btab_teller.txt mgmtTeller`sh ${currentpath}"/"addday.sh -1`.txt 

#增加短信平台的操作员信息同步
/backup/batchdir/tft/tftclient -dup -h10 -rteller/mgmtTeller`sh ${currentpath}"/"addday.sh -1`.txt   ${currentpath}/ibs_btab_teller.txt
