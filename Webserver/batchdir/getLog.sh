today=`date +%Y-%m-%d`
lastday=`./date_offset.sh $today -35`
shortday=`echo $lastday|awk  -F "-" '{print $1$2$3}'`

#delete batch log files 35 days ago
rm /backup/batchdir/log/batch.log.$lastday

#delete check account files 35 days ago
rm /backup/batchdir/anbmx/D0310_${shortday}_anbmx_wy.txt
rm /backup/batchdir/anbmx/D0310_${shortday}_pjjrb.txt
rm /backup/batchdir/anbmx/D0310_${shortday}_pxdzf.txt
rm /backup/batchdir/anbmx/D0310_${shortday}_bdskh.txt
rm /backup/batchdir/anbmx/NB_WEIXIN_${shortday}.txt
rm /backup/batchdir/anbmx/NB_WEIXIN_${shortday}.ok

#./getLogFile.sh /applog /backup/AppLog/rpp1 10.1.8.74 rsabak net8bank
#./getLogFile.sh /applog /backup/AppLog/rpp2 10.1.8.33 rsabak net8bank
#./getLogFile.sh /applog /backup/AppLog/rpp3 10.1.8.173 rsabak net8bank

