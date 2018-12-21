#DIR=/oracle/batch/lib
#export LANG=zh_CN.UTF-8
DIR=/backup/batchdir/lib
NOTAXHOME=/backup/batchdir
CLASSPATH=$CLASSPATH:/backup/batchdir
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
CLASSPATH=$CLASSPATH:$NOTAXHOME/file

#������ά�ձ��ű�ͳ�Ʊ�ʶ ��"JOB����ʼ"  "JOB�������"
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB����ʼ(����������������) fundftp.sh*****" >>/backup/batchdir/log/fund.log

#echo "`date` ========================SynFund Start================>" >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]����ʼ(����������������) fundftp.sh*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFundStart 2>> /backup/batchdir/log/fund.log >> /backup/batchdir/log/fund.log 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]�������(����������������) fundftp.sh*****" >>/backup/batchdir/log/fund.log
#echo "`date` ========================SynFund End=================>" >> /backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]����ʼ(�����ʲ��ؿ�������������) PrdWorkDateInfo.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/PrdWorkDateInfo.sh >> /backup/batchdir/log/fund.log >> /backup/batchdir/log/fund.log 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]�������(�����ʲ��ؿ���������������) PrdWorkDateInfo.sh*****" >>/backup/batchdir/log/fund.log

#added on 20120625 huangshuai
#echo "`date` Runing PrdRate.sh start*****************" >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]����ʼ(������)PrdRate.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/PrdRate.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]�������(������)PrdRate.sh*****" >>/backup/batchdir/log/fund.log
#echo "`date` Runing PrdRate.sh end*******************" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]����ʼ(TAϵͳ��ư������ܱ�)TAFinanceWhiteList.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/TAFinanceWhiteList.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]�������(TAϵͳ��ư������ܱ�)TAFinanceWhiteList.sh*****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]����ʼ(��˽��Ʒ�����ܱ�)SynFinanceFundStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFinanceFundStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]�������(��˽��Ʒ�����ܱ�)SynFinanceFundStart*****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]����ʼ(�Թ���Ʒ�����ܱ�)SynFinanceFund4EntStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFinanceFund4EntStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]�������(�Թ���Ʒ�����ܱ�)SynFinanceFund4EntStart*****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]����ʼ(�Թ���Ʒ�м���ձ�)SynFundAllowed4EntStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFundAllowed4EntStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]�������(�Թ���Ʒ�м���ձ�)SynFundAllowed4EntStart*****" >>/backup/batchdir/log/fund.log

#add by huangshuai 71986 20131014 for ATM
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]����ʼ(ͬ��BTA��ATM��Ʋ�Ʒ) SynFund4ATMStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFund4ATMStart 2>> /backup/batchdir/log/fund.log >> /backup/batchdir/log/fund.log 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]�������(ͬ��BTA��ATM��Ʋ�Ʒ) SynFund4ATMStart*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]����ʼ(ͬ��BTA��ATM��������������) PrdWorkDateInfo4ATM.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/PrdWorkDateInfo4ATM.sh >> /backup/batchdir/log/fund.log >> /backup/batchdir/log/fund.log 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]�������(ͬ��BTA��ATM��������������) PrdWorkDateInfo4ATM.sh*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]����ʼ(ATM��Ʒ�����ܱ�)SynFinanceFund4ATMStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFinanceFund4ATMStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]�������(ATM��Ʒ�����ܱ�)SynFundStart4ATM*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]����ʼ(����ATM�����ļ���)ATMFundCodeExport.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMFundCodeExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]�������(����ATM�����ļ���)ATMFundCodeExport.sh*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]����ʼ(����ATM��Ʒ�����ձ�)ATMWorkdayExport.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMWorkdayExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]�������(����ATM��Ʒ�����ձ�)ATMWorkdayExport.sh*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]����ʼ(����ATM��Ʒ�����ʱ�)ATMPrdRateExport.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMPrdRateExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]�������(����ATM��Ʒ�����ʱ�)ATMPrdRateExport.sh*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]����ʼ(����ATM��Ʒ�ܱ�)ATMProductCodeExport.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMProductCodeExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]�������(����ATM��Ʒ�ܱ�)ATMProductCodeExport.sh*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]����ʼ(����ATM��Ʒ��Ȩ����֪)*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.batch.ATMGenerateAckownledgeFile >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]�������(����ATM��Ʒ��Ȩ����֪)*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]����ʼ(����ATM��Ʒ�ķ��ս�ʾ�� )*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.batch.ATMGenerateRiskStatementFile >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]�������(����ATM��Ʒ�ķ��ս�ʾ�� )*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]����ʼ(����ATM��Ʒ�ķ��ս�ʾ�����Ͷ����ļ�)*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMRiskTypeExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]�������(����ATM��Ʒ�ķ��ս�ʾ�����Ͷ����ļ�)*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]����ʼ(����ATM��Ʒ����Ʋ�Ʒ˵����)*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.batch.ATMGenerateProductProtocolFile >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]�������(����ATM��Ʒ����Ʋ�Ʒ˵����)*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]����ʼ(����ATM��ҹ�е������ļ�)*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMAssetMorningTypeExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]�������(����ATM��ҹ�е������ļ�)*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]����ʼ(����ATM��Ʒ��ҹ������ʱ��)*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMSalesTimeExport.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]�������(����ATM��Ʒ��ҹ������ʱ��)*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]����ʼ(ATM����ļ�ѹ������)*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/ATMFileCompress.sh >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]�������(ATM����ļ�ѹ������)*****" >>/backup/batchdir/log/fund.log
#end by huangshuai 71986 20131014 for ATM
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB�������(����������������) fundftp.sh*****" >>/backup/batchdir/log/fund.log

#����ִ�н���������Զ���ƽ̨
echo 0
