currentpath="/backup/batchdir/shells"
cd ${currentpath}
rm ${currentpath}/ibs_btab_teller.txt
sqlplus bankdb/bankdb @ibs_btab_teller.sql
#�������ݾ����ļ�����
sh ${currentpath}/put.sh ${currentpath}/ibs_btab_teller.txt mgmtTeller`sh ${currentpath}"/"addday.sh -1`.txt 

#���Ӷ���ƽ̨�Ĳ���Ա��Ϣͬ��
/backup/batchdir/tft/tftclient -dup -h10 -rteller/mgmtTeller`sh ${currentpath}"/"addday.sh -1`.txt   ${currentpath}/ibs_btab_teller.txt
