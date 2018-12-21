FTPSERVPATH=/home/bea/app/ftpdata/ftpwy/
RESULTPATH=/backup/batchdir/anbmx/points
export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
export TFTCFG=/backup/batchdir/tft/tft.conf
export TFT_CLIENT_PRINTDIR=
export RUNLOG=/backup/batchdir/tft
DATAPATH=/backup/batchdir/anbmx/points
DBUSER=bankdb
DBPWD=bankdb
DBSID=newebank

echo "****************下面判断是否存在数据文件***********************" >>/backup/batchdir/log/SynCreditLogo.log
countFile=`ls /backup/batchdir/anbmx/SynCreditLogo20130328 | grep "CREDIT_AC_LOGO_20130328.txt" |wc -l`
if [ countFile  -eq 0 ]; then
echo "本地不存在数据文件CREDIT_AC_LOGO_20130328.txt"   >>/backup/batchdir/log/SynCreditLogo.log
else
#执行batch类更新本地数据库（批量同步logo）
#如果不存在sql_logo目录，新建sql_logo目录用于存放生产的sql文件

countsql=`ls /backup/batchdir/anbmx/SynCreditLogo20130328| grep "sql_logo" |wc -l`
if [ countsql  -eq 0 ]; then
echo "本地新建sql_logo子目录"   >>/backup/batchdir/log/SynCreditLogo.log
cd /backup/batchdir/anbmx/SynCreditLogo20130328
mkdir sql_logo
else
echo "本地已存在sql_logo子目录"   >>/backup/batchdir/log/SynCreditLogo.log
fi


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

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理开始(批量同步乐惠金卡logo开始) SynCreditLogo.sh*****" >>/backup/batchdir/log/SynCreditLogo.log
/opt/java6/bin/java -Xms512m -Xmx512m -classpath $CLASSPATH  com.ceb.ibs.batch.SynCreditLogo>> /backup/batchdir/log/SynCreditLogo.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理结束(批量同步乐惠金卡logo完成) SynCreditLogo.sh*****" >>/backup/batchdir/log/SynCreditLogo.log

fi
