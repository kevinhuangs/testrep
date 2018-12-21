TZ=CST-8
TODAY=`date +%Y%m%d`
echo $TODAY
if [ "$1" != "" ]; then TODAY=$1
fi
echo "******************同步数据文件开始************************">>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费城市信息表)SynAeraInfo.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynAeraInfo.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费城市信息表)SynAeraInfo.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费支持城市表)SynBusiAera.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynBusiAera.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费支持城市表)SynBusiAera.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费类型表和公共参数表)SynBusiType.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynBusiType.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费类型表和公共参数表)SynBusiType.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费权限表)SynFeeAuth.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeAuth.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费权限表)SynFeeAuth.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费二次查询表)SynFeeEccxBusi.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeEccxBusi.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费二次查询表)SynFeeEccxBusi.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理开始(同步缴费项目表)SynFeeBillBusi.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeBillBusi.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP处理结束(同步缴费项目表)SynFeeBillBusi.sh*****" >>/backup/batchdir/log/fee.log

echo "******************同步数据文件完成************************">>/backup/batchdir/log/fee.log