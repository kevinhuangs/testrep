#������־
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
#mv /backup/batchdir/log/tt_run.log /backup/batchdir/log/tt_run.log.${logDay}

#echo "`date` Start batch tt  !!!!!!!!!!!!!" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB����ʼ(����������) tt*****" >>/backup/batchdir/log/tt_run.log

#Set the FTP server IP address ,user,password

#FTPSERVIP=10.1.100.10

#FTPUSER=netbank
#FTPPWD=netbank
#FTPSERVPATH=/netbank/user/wanglei
FTPSERVIP=10.1.8.52
FTPUSER=u0310
FTPPWD=u0310
FTPSERVPATH=/home/ww/0310
FTPSERVPATHA=/home/gg
RESULTPATH=/backup/batchdir/anbmx

#Get the date of compare bill

TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
else i=1
fi
echo "==>��ȡ��������Ϊ��"$YESTODAY
TZ=CST-8
#Notax main directory

NOTAXHOME=/backup/batchdir
PATH=.:$PATH:/opt/java6/bin
#Ftp to the remote ftp server and get the file

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(ͬ���ļ�)*****" >>/backup/batchdir/log/tt_run.log

#---------------------------------����ϵͳ-�����Զ������� add by fangxianwan 20120824
#echo "==>ftp�������ļ����ڷ�����"
#ftp -n $FTPSERVIP <<!
#user $FTPUSER $FTPPWD
#bin
#prompt
#lcd $NOTAXHOME/tmpzip
#cd $FTPSERVPATH
#pwd
#dir w${YESTODAY}_0002.tar.Z
#get w${YESTODAY}_0002.tar.Z
#cd $FTPSERVPATHA
#pwd
#dir g${YESTODAY}_0001.tar.Z
#get g${YESTODAY}_0001.tar.Z
#close
#bye
#!
#--------------------------------end by 20120824

#Uncompress and untar to local direct
cd $NOTAXHOME/tmpzip/
echo "==>ѹ���ļ�����Ŀ¼"
pwd
uncompress w${YESTODAY}_0002.tar.Z
tar xvf w${YESTODAY}_0002.tar
uncompress g${YESTODAY}_0001.tar.Z
tar xvf g${YESTODAY}_0001.tar
echo "`date` ==>���˵��ļ��嵥"
ls ${YESTODAY}_2
echo "==>�ƶ���ѹ����ļ��������ļ�Ŀ¼"
#ͬ����˰
mv ${YESTODAY}_2/D0310_${YESTODAY}_anbmx_wy.txt ${RESULTPATH}
#ͬ�������ڼ����ļ�
mv ${YESTODAY}_2/D0310_${YESTODAY}_pjjrb.txt ${RESULTPATH}
#ͬ�������к� ��pxdzf pxecj�ļ����ϳ�pjshh�ļ�
mv ${YESTODAY}_2/D0310_${YESTODAY}_pjshh.txt ${RESULTPATH}
#ͬ���ͻ���Ϣ
mv ${YESTODAY}_2/D0310_${YESTODAY}_bdskh.txt ${RESULTPATH}
#add on 2009.7.31 by lst ͬ��������Ϣ
mv ${YESTODAY}_1/D0000_${YESTODAY}_pjgcs.txt ${RESULTPATH}

#ͬ�����񿨶����ļ�
mv ${YESTODAY}_2/M0310_${YESTODAY}_bgwbx.txt ${RESULTPATH}
#SynPerCifInfofile
mv ${YESTODAY}_1/D0000_${YESTODAY}_bdskh.txt ${RESULTPATH}
#CombineOrganfile
mv  ${YESTODAY}_1/D0000_1001_tjghb.txt ${RESULTPATH}/CombineOrg_${YESTODAY}.txt

#�����ļ�
mv ${YESTODAY}_1/D0000_${YESTODAY}_pjzlv.txt ${RESULTPATH}

#�Ƽ��ļ�
mv ${YESTODAY}_1/D0000_${YESTODAY}_phlcs.txt ${RESULTPATH}

#���ʻ���ϸ�ļ�
#mv ${YESTODAY}_2/D0310_${YESTODAY}_aghmx_wy.txt ${RESULTPATH}

#ͬ�����Ļ������ļ� add on 20100527
mv ${YESTODAY}_2/D0310_${YESTODAY}_bhkdj.txt ${RESULTPATH}

#xiaoe add by 20100826
#mv ${YESTODAY}_2/D0310_${YESTODAY}_pxecj.txt ${RESULTPATH}

#qingsuan add by 20100826
mv ${YESTODAY}_2/D0310_${YESTODAY}_pzfhh.txt ${RESULTPATH}

#fangxianwan add by 20110315
mv ${YESTODAY}_2/D0310_${YESTODAY}_aghfh.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_azhjx.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_bdgkh.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_btykh.txt ${RESULTPATH}

#add by fangxianwan 20120515����
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlzw.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlgj.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pgbdz.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlwd.txt ${RESULTPATH}

#add by dumingping 20121123����������ձ�
mv ${YESTODAY}_2/D0310_${YESTODAY}_pdqdz.txt ${RESULTPATH}
#end by 20121123

B2EKHHLPATH=/backup/batchdir/shells/b2ekhhl/
#add by DongBiao 20120619 ת��֧��������ͨ���л�������ת�˶��˵�
mv ${YESTODAY}_2/ceb_ceb004_${YESTODAY} ${B2EKHHLPATH}
mv ${YESTODAY}_2/ceb_total_amount_${YESTODAY} ${B2EKHHLPATH}
#end by DongBiao 20120619 ת��֧��������ͨ���л�������ת�˶��˵�

#add by dumingping 20130426������Ʋ�Ʒ�����
mv ${YESTODAY}_2/D0310_${YESTODAY}_plccp.txt ${RESULTPATH}
#add by dumingping 20130426������Ʋ�����
mv ${YESTODAY}_2/D0310_${YESTODAY}_plcgd.txt ${RESULTPATH}

#add by dumingping 20130513��ƶ����Ϣ
mv ${YESTODAY}_2/D0310_${YESTODAY}_blced.txt ${RESULTPATH}
#add by dumingping 20130513��Ʋ�Ʒ����
mv ${YESTODAY}_2/D0310_${YESTODAY}_plcfb.txt ${RESULTPATH}

#add by dumingping 20130712���������˻���Ϣ��(��˽����ʹ��)
mv ${YESTODAY}_2/D0310_${YESTODAY}_vyktd.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vggpz.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vhybt.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vdybt.txt ${RESULTPATH}

#add by huangshuai 20130830 for 65736 ���������Ȩ�ޱ�pbwsj
mv ${YESTODAY}_2/D0310_${YESTODAY}_pbwsj.txt ${RESULTPATH}
#end by huangshuai 20130830 for 65736

#add by chenyanan 20140408 for ��ư�������Ϣ��  begin
mv ${YESTODAY}_2/D0310_${YESTODAY}_blcbm.txt ${RESULTPATH}
#add by chenyanan 20140408 for ��ư�������Ϣ�� end

#end by 20130426
#rm -r {YESTODAY}_2
echo "==>�����ʱ�ļ�"
pwd
rm -r ${YESTODAY}_2 w${YESTODAY}_0002.tar
rm -r ${YESTODAY}_1 g${YESTODAY}_0001.tar
cd ..

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP�������(ͬ���ļ�)*****" >>/backup/batchdir/log/tt_run.log

#Perform the operation of compare bill
echo "==>ִ�ж��˲���"
pwd

#added on 20140304 pengxiaomei begin
#echo "`date` Runing MicroMessSigning.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]����ʼ(ͬ��΢������ǩԼ����)MicroMessSigning.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/MicroMessSigning.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]�������(ͬ��΢������ǩԼ����)MicroMessSigning.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing MicroMessSigning.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140304 pengxiaomei end

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]����ʼ(������Ʋ�Ʒͬ��) fundftpfortt.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/fundftpfortt.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]�������(������Ʋ�Ʒͬ��) fundftpfortt.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]����ʼ(ִ�ж��˲���) file.CompareBill*****" >>/backup/batchdir/log/tt_run.log
/opt/java6/bin/java -classpath $NOTAXHOME:$NOTAXHOME/file:$NOTAXHOME/lib/classes12.jar:$NOTAXHOME/lib/pe-base-guard.jar:$NOTAXHOME/lib/pe-core-guard.jar:$NOTAXHOME/lib/pe-transform-guard.jar:$NOTAXHOME/lib/xmlParserAPIs.jar:$NOTAXHOME/lib/rt142.jar:$NOTAXHOME/lib/xercesImpl.jar:$NOTAXHOME/lib/jce.jar:$NOTAXHOME/lib/commons-logging-1.1.jar:. file.CompareBill $1
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]�������(ִ�ж��˲���) file.CompareBill*****" >>/backup/batchdir/log/tt_run.log


#echo "`date` Runing IntoMbankBaserate.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]����ʼ(�ֻ��������ʱ����ݵ���) IntoMbankBaserate.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoMbankBaserate.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]�������(�ֻ��������ʱ����ݵ���) IntoMbankBaserate.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing IntoMbankBaserate.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing IntoMbankhlcs.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]����ʼ(�ֻ����л��ʱ����ݵ���) IntoMbankhlcs.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoMbankhlcs.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]�������(�ֻ����л��ʱ����ݵ���) IntoMbankhlcs.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing IntoMbankhlcs.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20110315 for fangxianwan
#echo "`date` Runing SynNetbankAc.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]����ʼ(�Թ��˺�״̬ͬ��) SynNetbankAc.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynNetbankAc.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]�������(�Թ��˺�״̬ͬ��) SynNetbankAc.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynNetbankAc.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing SysBankNo.sh start***********" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]����ʼ(������к�ͬ��) SynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynBankNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]�������(������к�ͬ��) SynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SysBankNo.sh end*************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing SysCif.sh start********************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]����ʼ(��˽�ͻ���Ϣͬ��) SynCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCif.sh  >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]�������(��˽�ͻ���Ϣͬ��) SynCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SysCif.sh end*********************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing cifJoinBatch.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]����ʼ(�ͻ��źϲ�) cifJoinBatch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/cifJoinBatch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]�������(�ͻ��źϲ�) cifJoinBatch.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing cifJoinBatch.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20080619
#echo "`date` Runing epay.sh start ************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]����ʼ(��ȡ֧��Э��) epay.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/epay.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]�������(��ȡ֧��Э��) epay.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing epay.sh end ****"********************** >>/backup/batchdir/log/tt_run.log

#added on 20081106 for QIYENIANJIN
#echo "`date` Runing annuityGetCif.sh start****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]����ʼ(��ȡ��ҵ������������ļ�) annuityGetCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/annuityGetCif.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]�������(��ȡ��ҵ������������ļ�) annuityGetCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing annuityGetCif.sh end******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing startBatchExecute.sh start*************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]����ʼ(Java����) startBatchExecute.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/startBatchExecute.sh 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]�������(Java����) startBatchExecute.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing startBatchExecute.sh end**************************" >>/backup/batchdir/log/tt_run.log

#added on 20081106 for QIYENIANJIN
#echo "`date` Runing resAnnuityCif.sh start***********************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]����ʼ(������ҵ��������������) resAnnuityCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/resAnnuityCif.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]�������(������ҵ��������������) resAnnuityCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing resAnnuityCif.sh end***********************" >>/backup/batchdir/log/tt_run.log

#sh /backup/batchdir/shells/SynVtac.sh

#echo "`date` Running day.sh for edw*******" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/data/day.sh
#add for epay 20071217 add for emdmsg 20100409

#����Աͨ��iamͬ�����Ѳ�����������ͬ��  add by lyf 20130710
#echo "`date` Running SynTellerinfo.sh for epay start**************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[13]����ʼ(�ϴ���̨����Ա�б�����ź�֧��) SynTellerinfo.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/SynTellerinfo.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[13]�������(�ϴ���̨����Ա�б�����ź�֧��) SynTellerinfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Running SynTellerinfo.sh for epay end**************" >>/backup/batchdir/log/tt_run.log

#added on 20100527
#echo "`date` Runing SynAcNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]����ʼ(���Ļ���) SynAcNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynAcNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]�������(���Ļ���) SynAcNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynAcNo.sh end*******************************" >>/backup/batchdir/log/tt_run.log


#20100826
#echo "`date` Runing EXSynBankNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[15]����ʼ(С�����к�ͬ��) EXSynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/EXSynBankNo.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[15]�������(С�����к�ͬ��) EXSynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing EXSynBankNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log

#added on 20140526 pengxiaomei begin
#echo "`date` Runing RedBagWinLottery.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]����ʼ(ͬ�����ҡ�����Ϣ�ļ�)RedBagWinLottery.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/RedBagWinLottery.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]�������(ͬ�����ҡ�����Ϣ�ļ�)RedBagWinLottery.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing RedBagWinLottery.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140526 pengxiaomei end

#echo "`date` Runing InPtabPzfhh.sh start*****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]����ʼ(���л������к�ͬ��) InPtabPzfhh.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/InPtabPzfhh.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]�������(���л������к�ͬ��) InPtabPzfhh.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing InPtabPzfhh.sh start*****************************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing getLog.sh start***********************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]����ʼ(���������ļ�) getLog.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/getLog.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]�������(���������ļ�) getLog.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing getLog.sh end*************************************" >>/backup/batchdir/log/tt_run.log

#add for database stat ( 20080321 #)
#echo "`date` Runing datebase stat  **********" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/db_stat.sh

#�ֻ���������ͨ���м�ҵ��ƽ̨ͬ�����Ѳ�����������ͬ��  add by lyf 20130710
#added on 20090618 for sjyh
#echo "`date` Runing expFeeData.sh start*******************************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[18]����ʼ(�����ɷ�����) expFeeData.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/expFeeData.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[18]�������(�����ɷ�����) expFeeData.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing expFeeData.sh end*********************************" >>/backup/batchdir/log/tt_run.log

#added on 20090618 for sjyh
#echo "`date` Runing GenBankNoFile.sh start****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]����ʼ(����������к�) GenBankNoFile.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/expbankno/GenBankNoFile.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]�������(����������к�) GenBankNoFile.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing GenBankNoFile.sh end******************************" >>/backup/batchdir/log/tt_run.log

#added on 20101123
#echo "`date` Runing GenentBankNo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]����ʼ(�Թ��������ߵ���������к�) GenentBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/entbankno/GenentBankNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]�������(�Թ��������ߵ���������к�) GenentBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing GenentBankNo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20111117
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]����ʼ(�Թ����л���ǩԼ��Ϣͬ��) EntSynIB01.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/EntSynIB01.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]�������(�Թ����л���ǩԼ��Ϣͬ��) EntSynIB01.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]����ʼ(ͬ����˽�ͻ��ȼ���Ϣ) IntoPtabCifLevel.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoPtabCifLevel.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]�������(ͬ����˽�ͻ��ȼ���Ϣ) IntoPtabCifLevel.sh*****" >>/backup/batchdir/log/tt_run.log

#add by fangxianwan(�������)
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]����ʼ(�������ұ�����Ϣͬ��) SynCountryInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCountryInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]�������(�������ұ�����Ϣͬ��) SynCountryInfo.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]����ʼ(���������ղ�������Ϣͬ��) SynCounyAliasCodeDZ.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCounyAliasCodeDZ.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]�������(���������ղ�������Ϣͬ��) SynCounyAliasCodeDZ.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]����ʼ(����������Ĺ�����Ϣ��Ϣͬ��) SynXLRemitCounyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynXLRemitCounyInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]�������(����������Ĺ�����Ϣ��Ϣͬ��) SynXLRemitCounyInfo.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]����ʼ(IAM�����ļ���Ϣͬ��) iamSynchroPwd.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/iamSynchroPwd.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]�������(IAM�����ļ���Ϣͬ��) iamSynchroPwd.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20120628 dumingping
#echo "`date` Runing FTPCifOtherFlag.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]����ʼ(ͬ��submit�������ϵı���ͻ���ʶ��cif���otherFlag�ֶεĵ�13λ��ʶ��)FTPCifOtherFlag.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/FTPCifOtherFlag.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]�������(ͬ��submit�������ϵı���ͻ���ʶ��cif���otherFlag�ֶεĵ�13λ��ʶ��)FTPCifOtherFlag.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing FTPCifOtherFlag.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20120628 dumingping
#echo "`date` Runing SynXLBranch.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]����ʼ(ͬ������Ӫҵ����������Ϣ��)SynXLBranch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynXLBranch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]�������(ͬ������Ӫҵ����������Ϣ��)SynXLBranch.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynXLBranch.sh end*******************" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]����ʼ(���ݶ�˽��ر�) PerManage.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/PerManage.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]�������(���ݶ�˽��ر�) PerManage.sh*****" >>/backup/batchdir/log/tt_run.log

#add by DongBiao 20120619 ����֧��������ͨ���л������˵��ļ�
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]����ʼ(����ͨ���л������˵�) b2ekhhl.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/b2ekhhl/b2ekhhl.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]�������(����ͨ���л������˵�) b2ekhhl.sh*****" >>/backup/batchdir/log/tt_run.log
#end by DongBiao 20120619 ����֧��������ͨ���л������˵��ļ�

#added on 20120703 dumingping
#echo "`date` Runing SynEnterpInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[30]����ʼ(ͬ����Ȩ�й�ϵͳ��ҵ��Ϣ��)SynEnterpInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynEnterpInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[30]�������(ͬ����Ȩ�й�ϵͳ��ҵ��Ϣ��)SynEnterpInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynEnterpInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[31]����ʼ(ͬ����������֧����Ϣ��)SynPerLoan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynPerLoan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[31]�������(ͬ����������֧����Ϣ��)SynPerLoan.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[32]����ʼ(ͬ�����������ļ���ͼƬ�ļ�)GetPointsGift.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetPointsGift.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[32]�������(ͬ�����������ļ���ͼƬ�ļ�)GetPointsGift.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[33]����ʼ(ͬ���ɷ������ļ���ͼƬ�ļ�)GetFeeImages.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetFeeImages.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[33]�������(ͬ���ɷ������ļ���ͼƬ�ļ�)GetFeeImages.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[34]����ʼ(ͬ���������������ļ�)GetMsgPerBatch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetMsgPerBatch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[34]�������(ͬ���������������ļ�)GetMsgPerBatch.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[35]����ʼ(ͬ�����д���֧�����м���Bin��)SynBin.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynBin.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[35]�������(ͬ�����д���֧�����м���Bin��)SynBin.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[36]����ʼ(ͬ�������������������Bin��)SynPerBin.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynPerBin.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[36]�������(ͬ�������������������Bin��)SynPerBin.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20121123 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[37]����ʼ(ͬ������������ձ�)SynOrganAreaRef.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynOrganAreaRef.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[37]�������(ͬ������������ձ�)SynOrganAreaRef.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20130228 dumingping
#echo "`date` Runing SynMagRltInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[38]����ʼ(ͬ����Ȩ�й�ϵͳ�йܻ�����Ϣ��)SynMagRltInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynMagRltInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[38]�������(ͬ����Ȩ�й�ϵͳ�йܻ�����Ϣ��)SynMagRltInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynMagRltInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20130712 dumingping
#echo "`date` Runing acDelete.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[39]����ʼ(��������ɾ�������˺�)acDelete.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/acDelete.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[39]�������(��������ɾ�������˺�)acDelete.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing acDelete.sh end*******************" >>/backup/batchdir/log/tt_run.log

#add by huangshuai  20130902 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[40]����ʼ(ͬ��������SWIFT�����)SynSwiftCode.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynSwiftCode.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[40]�������(ͬ��������SWIFT�����)SynSwiftCode.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[41]����ʼ(ͬ�����������Ȩ�ޱ�)SynOrganAuth.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynOrganAuth.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[41]�������(ͬ�����������Ȩ�ޱ�)SynOrganAuth.sh*****" >>/backup/batchdir/log/tt_run.log
#end by huangshuai  20130902

#added on 20130909 dumingping
#echo "`date` Runing SynFuturesCompanyInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[42]����ʼ(����ת���ڻ���˾��Ϣͬ��)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynFuturesCompanyInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[42]�������(����ת���ڻ���˾��Ϣͬ��)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynFuturesCompanyInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#add by huangshuai 20131119 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[43]����ʼ(ͬ���ƽ�����������)GetGoldOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetGoldOrgan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[43]�������(ͬ���ƽ�����������)GetGoldOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
#end by huangshuai 20131119
#added on 20101123

#add by zhanglei 20140522 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[44]����ʼ(ͬ��ʵ��������Ʒ��Ϣ)SynRealGoldPrice.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynRealGoldPrice.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[44]�������(ͬ��ʵ��������Ʒ��Ϣ)SynRealGoldPrice.sh*****" >>/backup/batchdir/log/tt_run.log
#add by zhanglei 20140522 end

#added on 20140110 zhanglei begin
#echo "`date` Runing SupplyChain.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[45]����ʼ(ͬ����Ӧ����ɫ)SupplyChain.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SupplyChain.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[45]�������(ͬ����Ӧ����ɫ)SupplyChain.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SupplyChain.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140110 zhanglei end

#added on 20130909 dumingping
#echo "`date` Runing SynFuturesCompanyInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[46]����ʼ(�Թ�����ת���ڻ���˾��Ϣͬ��)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynFuturesCompanyInfo4Ent.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[46]�������(�Թ�����ת���ڻ���˾��Ϣͬ��)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynFuturesCompanyInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#������84838_������̨�Ż�ʵ����� add by wangqiang 20140827 start
#echo "`date` Runing SynGoldCityOrgan.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[47]����ʼ(ʵ����Ʒ���۸��ļ�ͬ��)SynGoldCityOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynGoldCityOrgan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[47]�������(ʵ����Ʒ���۸��ļ�ͬ��)SynGoldCityOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynGoldCityOrgan.sh*******************" >>/backup/batchdir/log/tt_run.log
#������84838_������̨�Ż�ʵ����� add by wangqiang 20140827 end

#echo "`date` Runing ClearShareStore.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[end]����ʼ(����ShareStore) ClearShareStore.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/ClearShareStore.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[end]�������(����ShareStore) ClearShareStore.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing ClearShareStore.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20110517
#echo "`date` Runing sjsgs/day.sh start*****************" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/sjsgs/day.sh >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing sjsgs/day.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` End of tt !!!!!!!!!!!!!!!!!!!" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB�������(����������) tt*****" >>/backup/batchdir/log/tt_run.log
echo "      ">>/backup/batchdir/log/tt_run.log

#add by fangxianwan 20120824(55872-����ϵͳ-�����Զ�������)
echo 0
