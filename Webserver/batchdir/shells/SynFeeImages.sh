TZ=CST-8
TODAY=`date +%Y%m%d`
echo $TODAY
if [ "$1" != "" ]; then TODAY=$1
fi
echo "******************ͬ�������ļ���ʼ************************">>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷѳ�����Ϣ��)SynAeraInfo.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynAeraInfo.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷѳ�����Ϣ��)SynAeraInfo.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷ�֧�ֳ��б�)SynBusiAera.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynBusiAera.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷ�֧�ֳ��б�)SynBusiAera.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷ����ͱ�͹���������)SynBusiType.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynBusiType.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷ����ͱ�͹���������)SynBusiType.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷ�Ȩ�ޱ�)SynFeeAuth.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeAuth.sh $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷ�Ȩ�ޱ�)SynFeeAuth.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷѶ��β�ѯ��)SynFeeEccxBusi.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeEccxBusi.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷѶ��β�ѯ��)SynFeeEccxBusi.sh*****" >>/backup/batchdir/log/fee.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP����ʼ(ͬ���ɷ���Ŀ��)SynFeeBillBusi.sh*****" >>/backup/batchdir/log/fee.log
sh /backup/batchdir/shells/SynFeeBillBusi.sh  $TODAY>>/backup/batchdir/log/fee.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} STEP�������(ͬ���ɷ���Ŀ��)SynFeeBillBusi.sh*****" >>/backup/batchdir/log/fee.log

echo "******************ͬ�������ļ����************************">>/backup/batchdir/log/fee.log