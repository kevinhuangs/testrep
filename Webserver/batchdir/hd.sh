export LANG=zh_CN.gb18030
#������־
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
mv /backup/batchdir/log/hd.log /backup/batchdir/log/hd.log.${logDay}

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB����ʼ(����������) hd*****" >>/backup/batchdir/log/hd.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]����ʼ(��������ˮ�����ļ�)ExportCopTrans.sh*****" >>/backup/batchdir/log/hd.log
sh /backup/batchdir/shells/ExportCopTrans.sh >>/backup/batchdir/log/hd.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]�������(��������ˮ�����ļ�)ExportCopTrans.sh*****" >>/backup/batchdir/log/hd.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB�������(����������) hd****" >>/backup/batchdir/log/hd.log
echo "      ">>/backup/batchdir/log/hd.log

echo 0