#Set Language is LANG=zh_CN.hp15CN
LANG=zh_CN.hp15CN
export LANG=zh_CN.hp15CN
DIR=/backup/batchdir/lib
#DIR=/oracle/batch/lib
CLASSPATH=$CLASSPATH:/backup/batchdir
#CLASSPATH=$CLASSPATH:/oracle/batch
CLASSPATH=$CLASSPATH:$DIR/activation-1.1.jar
CLASSPATH=$CLASSPATH:$DIR/aopalliance.jar
CLASSPATH=$CLASSPATH:$DIR/backport-util-concurrent.jar
CLASSPATH=$CLASSPATH:$DIR/bcprov-jdk14-136.jar
CLASSPATH=$CLASSPATH:$DIR/cglib-nodep-2.1_2.jar
CLASSPATH=$CLASSPATH:$DIR/classes12.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.datasource_1.8.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.jatmi.ja_1.4.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.jatmi_1.4.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.resourcepool.ja_1.6.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.resourcepool_1.6.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.transaction.ja_2.6.1.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.transaction_2.6.1.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.utils.full_1.8.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.rmi.client.ja_1.7.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.rmi.client_1.7.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.security.identity_1.1.2.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.security.wls_1.0.0.0_6-0-3-0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.workmanager.ja_1.8.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/com.bea.core.weblogic.workmanager_1.8.0.0.jar
CLASSPATH=$CLASSPATH:$DIR/commons-codec-1.3.jar
CLASSPATH=$CLASSPATH:$DIR/commons-collections.jar
CLASSPATH=$CLASSPATH:$DIR/commons-dbcp.jar
CLASSPATH=$CLASSPATH:$DIR/commons-fileupload-1.1.1.jar
CLASSPATH=$CLASSPATH:$DIR/commons-httpclient-3.0.1.jar
CLASSPATH=$CLASSPATH:$DIR/commons-io-1.2.jar
CLASSPATH=$CLASSPATH:$DIR/commons-lang.jar
CLASSPATH=$CLASSPATH:$DIR/commons-logging-1.1.jar
CLASSPATH=$CLASSPATH:$DIR/commons-net-1.4.1.jar
CLASSPATH=$CLASSPATH:$DIR/commons-pool.jar
CLASSPATH=$CLASSPATH:$DIR/CRLQuery.jar
CLASSPATH=$CLASSPATH:$DIR/ctgclient.jar
CLASSPATH=$CLASSPATH:$DIR/ctgserver.jar
CLASSPATH=$CLASSPATH:$DIR/CXTClient.jar
CLASSPATH=$CLASSPATH:$DIR/dom4j-1.6.jar
CLASSPATH=$CLASSPATH:$DIR/graphics.jar
CLASSPATH=$CLASSPATH:$DIR/ibatis-2.3.0.677.jar
CLASSPATH=$CLASSPATH:$DIR/itext-1.1.4.jar
CLASSPATH=$CLASSPATH:$DIR/j2ee.jar
CLASSPATH=$CLASSPATH:$DIR/jackson-core-asl-1.5.2.jar
CLASSPATH=$CLASSPATH:$DIR/jackson-mapper-asl-1.5.2.jar
CLASSPATH=$CLASSPATH:$DIR/jce.jar
CLASSPATH=$CLASSPATH:$DIR/jcommon-1.0.13.jar
CLASSPATH=$CLASSPATH:$DIR/jfreechart-1.0.10.jar
CLASSPATH=$CLASSPATH:$DIR/jfreechart-1.0.10-experimental.jar
CLASSPATH=$CLASSPATH:$DIR/jstl.jar
CLASSPATH=$CLASSPATH:$DIR/log4j-1.2.9.jar
CLASSPATH=$CLASSPATH:$DIR/mail-1.4.jar
CLASSPATH=$CLASSPATH:$DIR/ognl-2.6.5.jar
CLASSPATH=$CLASSPATH:$DIR/ojdbc14.jar
CLASSPATH=$CLASSPATH:$DIR/pe-base-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-core-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-dev-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-http-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-ibs-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-lc.jar
CLASSPATH=$CLASSPATH:$DIR/pe-monitor.jar
CLASSPATH=$CLASSPATH:$DIR/pe-security-captcha.jar
CLASSPATH=$CLASSPATH:$DIR/pe-security-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-service-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-tcp-guard.jar
CLASSPATH=$CLASSPATH:$DIR/pe-transform-guard.jar
CLASSPATH=$CLASSPATH:$DIR/poi-2.5.1.jar
CLASSPATH=$CLASSPATH:$DIR/raapi.jar
CLASSPATH=$CLASSPATH:$DIR/rt142.jar
CLASSPATH=$CLASSPATH:$DIR/spring-webmvc-2.5.6.jar
CLASSPATH=$CLASSPATH:$DIR/standard.jar
CLASSPATH=$CLASSPATH:$DIR/unionapi.jar
CLASSPATH=$CLASSPATH:$DIR/weblogic.jar
CLASSPATH=$CLASSPATH:$DIR/wlthint3client.jar
CLASSPATH=$CLASSPATH:$DIR/xercesImpl.jar
CLASSPATH=$CLASSPATH:$DIR/xmlParserAPIs.jar
CLASSPATH=$CLASSPATH:$DIR/xmlx.jar
CLASSPATH=$CLASSPATH:$DIR/axis-ant.jar
CLASSPATH=$CLASSPATH:$DIR/axis.jar
CLASSPATH=$CLASSPATH:$DIR/bcmail-jdk14-141.jar
CLASSPATH=$CLASSPATH:$DIR/commons-discovery-0.2.jar
CLASSPATH=$CLASSPATH:$DIR/jaxrpc.jar
CLASSPATH=$CLASSPATH:$DIR/PKIBASE.jar
CLASSPATH=$CLASSPATH:$DIR/RA2.jar
CLASSPATH=$CLASSPATH:$DIR/saaj.jar
CLASSPATH=$CLASSPATH:$DIR/wsdl4j-1.5.1.jar
CLASSPATH=$CLASSPATH:$DIR/cebcore.jar
CLASSPATH=$CLASSPATH:$DIR/cebTcp.jar
PATH=.:$PATH:/opt/java6/bin
#��������

FTPSERVIP=10.1.8.221
FTPUSER=dwetl
FTPPWD=dwetl
RESULTPATH=/backup/batchdir/anbmx
TZ=CST-8

cd $RESULTPATH
if [ -e permsgregister ];
then echo
else mkdir permsgregister
fi

mv  /backup/batchdir/anbmx/ebi_cust4nbsms_nb_????????.tar /backup/batchdir/anbmx/permsgregister
mv  /backup/batchdir/anbmx/ebi_cust4nbsms_nb_????????.ok /backup/batchdir/anbmx/permsgregister
mv  /backup/batchdir/anbmx/ebi_cust4nbsms_????????.dat /backup/batchdir/anbmx/permsgregister
mv  /backup/batchdir/anbmx/E00400_1707_??????????????.txt /backup/batchdir/anbmx/permsgregister

echo "\n\n" >>/backup/batchdir/log/GetMsgPerBatch.log
echo "**********************************************��ʼ**********************************************" >>/backup/batchdir/log/GetMsgPerBatch.log
echo ������ DAY=`sh /backup/batchdir/shells/addday.sh` >>/backup/batchdir/log/GetMsgPerBatch.log

if [ "$1" != "" ]; then
echo ���ղ���Ϊ $1
LOOPVALUE='0'
else
LOOPVALUE='-3 -2 -1'
fi 
for i in $LOOPVALUE;
do 
DAY=`sh /backup/batchdir/shells/addday.sh $i`
if [ "$1" != "" ]; then DAY=$1
fi
echo "\n" >>/backup/batchdir/log/GetMsgPerBatch.log
echo ��ȡ����Ϊ��$DAY  >>/backup/batchdir/log/GetMsgPerBatch.log
SERVPATH=/dwdata/expdata/${DAY}/ebi/
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo ${nowTime}**********************************************ѭ����ʼ��������${DAY}*************************************** >>/backup/batchdir/log/GetMsgPerBatch.log
FILENAME=ebi_cust4nbsms_${DAY}.dat
echo Ҫ�õ��ļ��� $FILENAME >>/backup/batchdir/log/GetMsgPerBatch.log
VALUE=`sqlplus -silent /nolog <<END
����conn bankdb/bankdb
����set pagesize 0 feedback off verify off heading off echo off numwidth 10
����select count( * ) coun from ibs_ptab_permesregiser where File_name = '$FILENAME';
����exit;
����END`
echo ͨ��$FILENAME�����ݿ��ֵ $VALUE >>/backup/batchdir/log/GetMsgPerBatch.log
if [ $VALUE  -eq  0 ]; then	
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo ${nowTime}**********************************************FTP �� EBI ��ȡ�ļ�  ������  ${DAY}*************************************** >>/backup/batchdir/log/GetMsgPerBatch.log
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
lcd $RESULTPATH
cd $SERVPATH
pwd
get ebi_cust4nbsms_nb_${DAY}.ok
get ebi_cust4nbsms_nb_${DAY}.tar

close
bye
!
cd $RESULTPATH
if [ -e ebi_cust4nbsms_nb_${DAY}.ok ]; then
if [ -e ebi_cust4nbsms_nb_${DAY}.tar ]; then
echo ************************${DAY}�����ļ����õ�*********************** >>/backup/batchdir/log/GetMsgPerBatch.log
pwd
tar xvf ebi_cust4nbsms_nb_${DAY}.tar
uncompress -f ebi_cust4nbsms_${DAY}.dat.Z
echo *******************��ѹ${DAY}���*************************** >>/backup/batchdir/log/GetMsgPerBatch.log
fileline=`echo "\n" >>ebi_cust4nbsms_${DAY}.dat|sed /^[[:space:]]*$/d ebi_cust4nbsms_${DAY}.dat|wc -l`
echo �ļ�����${fileline}>>/backup/batchdir/log/GetMsgPerBatch.log
if [ fileline  -eq 0 ]; then
echo ${DAY}�ļ�Ϊ�� >>/backup/batchdir/log/GetMsgPerBatch.log
else
echo *********************${DAY}�ļ�����***************************** >>/backup/batchdir/log/GetMsgPerBatch.log
fi
else echo ******************${DAY}û���ҵ�tar�ļ�************************ >>/backup/batchdir/log/GetMsgPerBatch.log
fi
else echo ******************${DAY}û���ҵ�oK�ļ�************************ >>/backup/batchdir/log/GetMsgPerBatch.log
fi
else echo $FILENAME �ļ��ѱ����� >>/backup/batchdir/log/GetMsgPerBatch.log
fi
echo ******************************${DAY}ѭ������************************************* >>/backup/batchdir/log/GetMsgPerBatch.log

done

cd $RESULTPATH
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo ${nowTime}--------------------------------------�γ�  .dat �ļ����б���PerMsgFileList.txt----------------------------- >>/backup/batchdir/log/GetMsgPerBatch.log
ls ebi_cust4nbsms_????????.dat >PerMsgFileList.txt
fileline=`echo "\n" >>PerMsgFileList.txt|sed /^[[:space:]]*$/d PerMsgFileList.txt|wc -l`
echo         PerMsgFileList.txt �б��ļ�����${fileline}>>/backup/batchdir/log/GetMsgPerBatch.log
if [ fileline  -eq 0 ]; then
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo  ${nowTime}  PerMsgFileList.txt �ļ�Ϊ�գ��������ļ�����ִ����������>>/backup/batchdir/log/GetMsgPerBatch.log
else 
echo  ��ʼִ��������ȡ�ļ����� MsgPerBatchGetFile >>/backup/batchdir/log/GetMsgPerBatch.log
/opt/java6/bin/java -Xms1536m -Xmx1536m -classpath $CLASSPATH com.ceb.ibs.batch.MsgPerBatchGetFile
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo ${nowTime}     ******************************�������ݽ���************************************ >>/backup/batchdir/log/GetMsgPerBatch.log
fi
echo "\n\n" >>/backup/batchdir/log/GetMsgPerBatch.log
echo ${nowTime}     ******************************����************************************ >>/backup/batchdir/log/GetMsgPerBatch.log