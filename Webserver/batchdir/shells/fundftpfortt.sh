#备份日志
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
mv /backup/batchdir/log/fund.log /backup/batchdir/log/fund.log.${logDay}

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

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} 核心理财同步处理开始  fundftpfortt.sh*****" >>/backup/batchdir/log/fund.log

#added on 20130507 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理开始(同步核心理财产品代码表)SynFundFromCore.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/SynFundFromCore.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理结束(同步核心理财产品代码表)SynFundFromCore.sh*****" >>/backup/batchdir/log/fund.log

#added on 20130507 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]处理开始(同步滚动理财参数信息表)SynRollFromCore.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/SynRollFromCore.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]处理结束(同步滚动理财参数信息表)SynRollFromCore.sh*****" >>/backup/batchdir/log/fund.log

#added on 20130513 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]处理开始(同步理财额度信息表)SynFinanceAmt.sh*****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/SynFinanceAmt.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]处理结束(同步理财额度信息表)SynFinanceAmt.sh*****" >>/backup/batchdir/log/fund.log

#added on 20130513 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]处理开始(同步理财产品附表)SynFinanceForAC.sh *****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/SynFinanceForAC.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]处理结束(同步理财产品附表)SynFinanceForAC.sh *****" >>/backup/batchdir/log/fund.log

#added on 20140409 chenyanan
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]处理开始(理财白名单信息总表)SynFinanceWhiteList.sh *****" >>/backup/batchdir/log/fund.log
sh /backup/batchdir/shells/SynFinanceWhiteList.sh >>/backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]处理结束(理财白名单信息总表)SynFinanceWhiteList.sh *****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]处理开始(对私产品代码总表)SynFinanceFundStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFinanceFundStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]处理结束(对私产品代码总表)SynFinanceFundStart*****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]处理开始(对公产品代码总表)SynFinanceFund4EntStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFinanceFund4EntStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]处理结束(对公产品代码总表)SynFinanceFund4EntStart*****" >>/backup/batchdir/log/fund.log

#added on 20130427 songlei
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]处理开始(对公产品中间对照表)SynFundAllowed4EntStart*****" >>/backup/batchdir/log/fund.log
/opt/java6/bin/java -Xms1024m -Xmx1024m -classpath $CLASSPATH  com.ceb.ibs.SynFundAllowed4EntStart >> /backup/batchdir/log/fund.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]处理结束(对公产品中间对照表)SynFundAllowed4EntStart*****" >>/backup/batchdir/log/fund.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} 核心理财同步处理结束  fundftpfortt.sh*****" >>/backup/batchdir/log/fund.log