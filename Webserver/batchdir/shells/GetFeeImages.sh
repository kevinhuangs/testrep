#������־
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
mv /backup/batchdir/log/fee.log /backup/batchdir/log/fee.log.${logDay}
delLogDay=`sh /backup/batchdir/shells/data/addday.sh -7 -`
rm /backup/batchdir/log/fee.log.${delLogDay}

RESULTPATH=/backup/batchdir/anbmx/feeImages
export TFTCFG=/backup/batchdir/tft/tft.conf
export TFT_CLIENT_PRINTDIR=
export RUNLOG=/backup/batchdir/tft
DATAPATH=/backup/batchdir/anbmx/feeImages/PicFile

TZ=CST+16
YESTODAY=`date +%Y%m%d`
TZ=CST-8
TODAY=`date +%Y%m%d`
echo $TODAY
if [ "$1" != "" ]; then TODAY=$1
fi
echo $TODAY
DATANAME=COM_FILE_${TODAY}.tar.gz
echo ${DATANAME}
TARNAME=COM_FILE_${TODAY}.tar
echo "****************ͬ���ɷ����ݺ�ͼƬ--ͬ�����ݿ�ʼ***********************">>/backup/batchdir/log/fee.log
if [ -e "${RESULTPATH}/COM_FILE_${YESTODAY}.tar" ]; then
mv ${RESULTPATH}/COM_FILE_${YESTODAY}.tar /backup/batchdir/anbmx/
fi
rm ${DATAPATH}/*
rm ${RESULTPATH}/ParaFile/*
rm ${RESULTPATH}/*
if [ -e "/backup/batchdir/anbmx/COM_FILE_${YESTODAY}.tar" ]; then
mv /backup/batchdir/anbmx/COM_FILE_${YESTODAY}.tar ${RESULTPATH}/
fi
echo "****************ɾ�������ļ����***********************">>/backup/batchdir/log/fee.log
#Ftp to the remote ftp server and get the file
/backup/batchdir/tft/tftclient -ddown -h15 -r733/snd/ParaFile/${DATANAME} ${RESULTPATH}/${DATANAME} -t1111 
echo "******************���ļ����************************">>/backup/batchdir/log/fee.log
if [ -e "${RESULTPATH}/${DATANAME}" ]; then
cd ${RESULTPATH}
pwd
/usr/contrib/bin/gunzip -f ${DATANAME}
tar xvf ${TARNAME}
echo "******************��ѹ�ļ����************************">>/backup/batchdir/log/fee.log

cd $DATAPATH
countImages=`ls |wc -l`
echo "countImages=$countImages"
if [ countImages  -eq 0 ]; then
echo "����û��ͼƬ"   >>/backup/batchdir/log/fee.log
else
cd /app/ceb/sharestore/per/images/feeimages/
rm -r *
cp /backup/batchdir/anbmx/feeImages/PicFile/* /app/ceb/sharestore/per/images/feeimages/
chmod 777 /app/ceb/sharestore/per/images/feeimages/*.*
fi
echo "****************sharestore���****************">>/backup/batchdir/log/fee.log
else 
echo "NTEBANK-ERROR ��ȡ�ɷ�ͬ���ļ�ʧ�ܣ�"
fi
