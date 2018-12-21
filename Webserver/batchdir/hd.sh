export LANG=zh_CN.gb18030
#备份日志
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
mv /backup/batchdir/log/hd.log /backup/batchdir/log/hd.log.${logDay}

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理开始(网银批处理) hd*****" >>/backup/batchdir/log/hd.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理开始(导出后督流水数据文件)ExportCopTrans.sh*****" >>/backup/batchdir/log/hd.log
sh /backup/batchdir/shells/ExportCopTrans.sh >>/backup/batchdir/log/hd.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理结束(导出后督流水数据文件)ExportCopTrans.sh*****" >>/backup/batchdir/log/hd.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理结束(网银批处理) hd****" >>/backup/batchdir/log/hd.log
echo "      ">>/backup/batchdir/log/hd.log

echo 0