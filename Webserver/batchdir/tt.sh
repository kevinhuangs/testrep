#备份日志
logDay=`sh /backup/batchdir/shells/data/addday.sh -1 -`
#mv /backup/batchdir/log/tt_run.log /backup/batchdir/log/tt_run.log.${logDay}

#echo "`date` Start batch tt  !!!!!!!!!!!!!" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理开始(网银批处理) tt*****" >>/backup/batchdir/log/tt_run.log

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
echo "==>获取对账日期为："$YESTODAY
TZ=CST-8
#Notax main directory

NOTAXHOME=/backup/batchdir
PATH=.:$PATH:/opt/java6/bin
#Ftp to the remote ftp server and get the file

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理开始(同步文件)*****" >>/backup/batchdir/log/tt_run.log

#---------------------------------网银系统-批量自动化改造 add by fangxianwan 20120824
#echo "==>ftp到对账文件所在服务器"
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
echo "==>压缩文件所在目录"
pwd
uncompress w${YESTODAY}_0002.tar.Z
tar xvf w${YESTODAY}_0002.tar
uncompress g${YESTODAY}_0001.tar.Z
tar xvf g${YESTODAY}_0001.tar
echo "`date` ==>对账单文件清单"
ls ${YESTODAY}_2
echo "==>移动解压后的文件到对账文件目录"
#同步非税
mv ${YESTODAY}_2/D0310_${YESTODAY}_anbmx_wy.txt ${RESULTPATH}
#同步网银节假日文件
mv ${YESTODAY}_2/D0310_${YESTODAY}_pjjrb.txt ${RESULTPATH}
#同步联行行号 由pxdzf pxecj文件整合成pjshh文件
mv ${YESTODAY}_2/D0310_${YESTODAY}_pjshh.txt ${RESULTPATH}
#同步客户信息
mv ${YESTODAY}_2/D0310_${YESTODAY}_bdskh.txt ${RESULTPATH}
#add on 2009.7.31 by lst 同步分行信息
mv ${YESTODAY}_1/D0000_${YESTODAY}_pjgcs.txt ${RESULTPATH}

#同步公务卡对帐文件
mv ${YESTODAY}_2/M0310_${YESTODAY}_bgwbx.txt ${RESULTPATH}
#SynPerCifInfofile
mv ${YESTODAY}_1/D0000_${YESTODAY}_bdskh.txt ${RESULTPATH}
#CombineOrganfile
mv  ${YESTODAY}_1/D0000_1001_tjghb.txt ${RESULTPATH}/CombineOrg_${YESTODAY}.txt

#利率文件
mv ${YESTODAY}_1/D0000_${YESTODAY}_pjzlv.txt ${RESULTPATH}

#牌价文件
mv ${YESTODAY}_1/D0000_${YESTODAY}_phlcs.txt ${RESULTPATH}

#虚帐户明细文件
#mv ${YESTODAY}_2/D0310_${YESTODAY}_aghmx_wy.txt ${RESULTPATH}

#同步核心换卡步文件 add on 20100527
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

#add by fangxianwan 20120515西联
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlzw.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlgj.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pgbdz.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_pxlwd.txt ${RESULTPATH}

#add by dumingping 20121123机构区域对照表
mv ${YESTODAY}_2/D0310_${YESTODAY}_pdqdz.txt ${RESULTPATH}
#end by 20121123

B2EKHHLPATH=/backup/batchdir/shells/b2ekhhl/
#add by DongBiao 20120619 转移支付宝银企通跨行互联行外转账对账单
mv ${YESTODAY}_2/ceb_ceb004_${YESTODAY} ${B2EKHHLPATH}
mv ${YESTODAY}_2/ceb_total_amount_${YESTODAY} ${B2EKHHLPATH}
#end by DongBiao 20120619 转移支付宝银企通跨行互联行外转账对账单

#add by dumingping 20130426核心理财产品代码表
mv ${YESTODAY}_2/D0310_${YESTODAY}_plccp.txt ${RESULTPATH}
#add by dumingping 20130426滚动理财参数表
mv ${YESTODAY}_2/D0310_${YESTODAY}_plcgd.txt ${RESULTPATH}

#add by dumingping 20130513理财额度信息
mv ${YESTODAY}_2/D0310_${YESTODAY}_blced.txt ${RESULTPATH}
#add by dumingping 20130513理财产品附表
mv ${YESTODAY}_2/D0310_${YESTODAY}_plcfb.txt ${RESULTPATH}

#add by dumingping 20130712核心销户账户信息表(对私网银使用)
mv ${YESTODAY}_2/D0310_${YESTODAY}_vyktd.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vggpz.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vhybt.txt ${RESULTPATH}
mv ${YESTODAY}_2/D0310_${YESTODAY}_vdybt.txt ${RESULTPATH}

#add by huangshuai 20130830 for 65736 境外电汇机构权限表pbwsj
mv ${YESTODAY}_2/D0310_${YESTODAY}_pbwsj.txt ${RESULTPATH}
#end by huangshuai 20130830 for 65736

#add by chenyanan 20140408 for 理财白名单信息表  begin
mv ${YESTODAY}_2/D0310_${YESTODAY}_blcbm.txt ${RESULTPATH}
#add by chenyanan 20140408 for 理财白名单信息表 end

#end by 20130426
#rm -r {YESTODAY}_2
echo "==>清除临时文件"
pwd
rm -r ${YESTODAY}_2 w${YESTODAY}_0002.tar
rm -r ${YESTODAY}_1 g${YESTODAY}_0001.tar
cd ..

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理结束(同步文件)*****" >>/backup/batchdir/log/tt_run.log

#Perform the operation of compare bill
echo "==>执行对账操作"
pwd

#added on 20140304 pengxiaomei begin
#echo "`date` Runing MicroMessSigning.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理开始(同步微信银行签约数据)MicroMessSigning.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/MicroMessSigning.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[1]处理结束(同步微信银行签约数据)MicroMessSigning.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing MicroMessSigning.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140304 pengxiaomei end

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]处理开始(核心理财产品同步) fundftpfortt.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/fundftpfortt.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[2]处理结束(核心理财产品同步) fundftpfortt.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]处理开始(执行对账操作) file.CompareBill*****" >>/backup/batchdir/log/tt_run.log
/opt/java6/bin/java -classpath $NOTAXHOME:$NOTAXHOME/file:$NOTAXHOME/lib/classes12.jar:$NOTAXHOME/lib/pe-base-guard.jar:$NOTAXHOME/lib/pe-core-guard.jar:$NOTAXHOME/lib/pe-transform-guard.jar:$NOTAXHOME/lib/xmlParserAPIs.jar:$NOTAXHOME/lib/rt142.jar:$NOTAXHOME/lib/xercesImpl.jar:$NOTAXHOME/lib/jce.jar:$NOTAXHOME/lib/commons-logging-1.1.jar:. file.CompareBill $1
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[3]处理结束(执行对账操作) file.CompareBill*****" >>/backup/batchdir/log/tt_run.log


#echo "`date` Runing IntoMbankBaserate.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]处理开始(手机银行利率表数据导入) IntoMbankBaserate.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoMbankBaserate.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[4]处理结束(手机银行利率表数据导入) IntoMbankBaserate.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing IntoMbankBaserate.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing IntoMbankhlcs.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]处理开始(手机银行汇率表数据导入) IntoMbankhlcs.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoMbankhlcs.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[5]处理结束(手机银行汇率表数据导入) IntoMbankhlcs.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing IntoMbankhlcs.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20110315 for fangxianwan
#echo "`date` Runing SynNetbankAc.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]处理开始(对公账号状态同步) SynNetbankAc.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynNetbankAc.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[6]处理结束(对公账号状态同步) SynNetbankAc.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynNetbankAc.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing SysBankNo.sh start***********" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]处理开始(大额联行号同步) SynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynBankNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[7]处理结束(大额联行号同步) SynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SysBankNo.sh end*************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing SysCif.sh start********************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]处理开始(对私客户信息同步) SynCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCif.sh  >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[8]处理结束(对私客户信息同步) SynCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SysCif.sh end*********************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing cifJoinBatch.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]处理开始(客户号合并) cifJoinBatch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/cifJoinBatch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[9]处理结束(客户号合并) cifJoinBatch.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing cifJoinBatch.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20080619
#echo "`date` Runing epay.sh start ************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]处理开始(获取支付协议) epay.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/epay.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[10]处理结束(获取支付协议) epay.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing epay.sh end ****"********************** >>/backup/batchdir/log/tt_run.log

#added on 20081106 for QIYENIANJIN
#echo "`date` Runing annuityGetCif.sh start****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]处理开始(获取企业年金批量开户文件) annuityGetCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/annuityGetCif.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[11]处理结束(获取企业年金批量开户文件) annuityGetCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing annuityGetCif.sh end******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing startBatchExecute.sh start*************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]处理开始(Java批量) startBatchExecute.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/startBatchExecute.sh 
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[12]处理结束(Java批量) startBatchExecute.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing startBatchExecute.sh end**************************" >>/backup/batchdir/log/tt_run.log

#added on 20081106 for QIYENIANJIN
#echo "`date` Runing resAnnuityCif.sh start***********************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]处理开始(返回企业年金批量开户结果) resAnnuityCif.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/resAnnuityCif.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[13]处理结束(返回企业年金批量开户结果) resAnnuityCif.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing resAnnuityCif.sh end***********************" >>/backup/batchdir/log/tt_run.log

#sh /backup/batchdir/shells/SynVtac.sh

#echo "`date` Running day.sh for edw*******" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/data/day.sh
#add for epay 20071217 add for emdmsg 20100409

#操作员通过iam同步，已不从网银批量同步  add by lyf 20130710
#echo "`date` Running SynTellerinfo.sh for epay start**************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[13]处理开始(上传后台操作员列表给短信和支付) SynTellerinfo.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/SynTellerinfo.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[13]处理结束(上传后台操作员列表给短信和支付) SynTellerinfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Running SynTellerinfo.sh for epay end**************" >>/backup/batchdir/log/tt_run.log

#added on 20100527
#echo "`date` Runing SynAcNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]处理开始(核心换卡) SynAcNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynAcNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[14]处理结束(核心换卡) SynAcNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynAcNo.sh end*******************************" >>/backup/batchdir/log/tt_run.log


#20100826
#echo "`date` Runing EXSynBankNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[15]处理开始(小额联行号同步) EXSynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/EXSynBankNo.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[15]处理结束(小额联行号同步) EXSynBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing EXSynBankNo.sh start*****************************" >>/backup/batchdir/log/tt_run.log

#added on 20140526 pengxiaomei begin
#echo "`date` Runing RedBagWinLottery.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]处理开始(同步红包摇奖活动信息文件)RedBagWinLottery.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/RedBagWinLottery.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[15]处理结束(同步红包摇奖活动信息文件)RedBagWinLottery.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing RedBagWinLottery.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140526 pengxiaomei end

#echo "`date` Runing InPtabPzfhh.sh start*****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]处理开始(跨行互联联行号同步) InPtabPzfhh.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/InPtabPzfhh.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[16]处理结束(跨行互联联行号同步) InPtabPzfhh.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing InPtabPzfhh.sh start*****************************" >>/backup/batchdir/log/tt_run.log

#echo "`date` Runing getLog.sh start***********************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]处理开始(清理数据文件) getLog.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/getLog.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[17]处理结束(清理数据文件) getLog.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing getLog.sh end*************************************" >>/backup/batchdir/log/tt_run.log

#add for database stat ( 20080321 #)
#echo "`date` Runing datebase stat  **********" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/db_stat.sh

#手机银行数据通过中间业务平台同步，已不从网银批量同步  add by lyf 20130710
#added on 20090618 for sjyh
#echo "`date` Runing expFeeData.sh start*******************************" >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[18]处理开始(导出缴费数据) expFeeData.sh*****" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/expFeeData.sh >>/backup/batchdir/log/tt_run.log
#nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
#echo "*****${nowTime} STEP[18]处理结束(导出缴费数据) expFeeData.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing expFeeData.sh end*********************************" >>/backup/batchdir/log/tt_run.log

#added on 20090618 for sjyh
#echo "`date` Runing GenBankNoFile.sh start****************************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]处理开始(导出大额联行号) GenBankNoFile.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/expbankno/GenBankNoFile.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[18]处理结束(导出大额联行号) GenBankNoFile.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing GenBankNoFile.sh end******************************" >>/backup/batchdir/log/tt_run.log

#added on 20101123
#echo "`date` Runing GenentBankNo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]处理开始(对公代发工具导出大额联行号) GenentBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/entbankno/GenentBankNo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[19]处理结束(对公代发工具导出大额联行号) GenentBankNo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing GenentBankNo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20111117
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]处理开始(对公跨行互联签约信息同步) EntSynIB01.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/EntSynIB01.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[20]处理结束(对公跨行互联签约信息同步) EntSynIB01.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]处理开始(同步对私客户等级信息) IntoPtabCifLevel.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/IntoPtabCifLevel.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[21]处理结束(同步对私客户等级信息) IntoPtabCifLevel.sh*****" >>/backup/batchdir/log/tt_run.log

#add by fangxianwan(西联汇款)
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]处理开始(西联国家币种信息同步) SynCountryInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCountryInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[22]处理结束(西联国家币种信息同步) SynCountryInfo.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]处理开始(国别代码对照参数表信息同步) SynCounyAliasCodeDZ.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynCounyAliasCodeDZ.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[23]处理结束(国别代码对照参数表信息同步) SynCounyAliasCodeDZ.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]处理开始(西联汇款中文国家信息信息同步) SynXLRemitCounyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynXLRemitCounyInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[24]处理结束(西联汇款中文国家信息信息同步) SynXLRemitCounyInfo.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]处理开始(IAM密文文件信息同步) iamSynchroPwd.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/iamSynchroPwd.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[25]处理结束(IAM密文文件信息同步) iamSynchroPwd.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20120628 dumingping
#echo "`date` Runing FTPCifOtherFlag.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]处理开始(同步submit服务器上的丙类客户标识到cif表的otherFlag字段的第13位标识上)FTPCifOtherFlag.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/FTPCifOtherFlag.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[26]处理结束(同步submit服务器上的丙类客户标识到cif表的otherFlag字段的第13位标识上)FTPCifOtherFlag.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing FTPCifOtherFlag.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20120628 dumingping
#echo "`date` Runing SynXLBranch.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]处理开始(同步西联营业机构网点信息表)SynXLBranch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynXLBranch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[27]处理结束(同步西联营业机构网点信息表)SynXLBranch.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynXLBranch.sh end*******************" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]处理开始(备份对私落地表) PerManage.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/PerManage.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[28]处理结束(备份对私落地表) PerManage.sh*****" >>/backup/batchdir/log/tt_run.log

#add by DongBiao 20120619 处理支付宝银企通跨行互联对账单文件
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]处理开始(银企通跨行互联对账单) b2ekhhl.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/b2ekhhl/b2ekhhl.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[29]处理结束(银企通跨行互联对账单) b2ekhhl.sh*****" >>/backup/batchdir/log/tt_run.log
#end by DongBiao 20120619 处理支付宝银企通跨行互联对账单文件

#added on 20120703 dumingping
#echo "`date` Runing SynEnterpInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[30]处理开始(同步股权托管系统企业信息表)SynEnterpInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynEnterpInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[30]处理结束(同步股权托管系统企业信息表)SynEnterpInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynEnterpInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[31]处理开始(同步个贷受理支行信息表)SynPerLoan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynPerLoan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[31]处理结束(同步个贷受理支行信息表)SynPerLoan.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[32]处理开始(同步积分数据文件和图片文件)GetPointsGift.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetPointsGift.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[32]处理结束(同步积分数据文件和图片文件)GetPointsGift.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[33]处理开始(同步缴费数据文件和图片文件)GetFeeImages.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetFeeImages.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[33]处理结束(同步缴费数据文件和图片文件)GetFeeImages.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[34]处理开始(同步短信批量开户文件)GetMsgPerBatch.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetMsgPerBatch.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[34]处理结束(同步短信批量开户文件)GetMsgPerBatch.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[35]处理开始(同步跨行代扣支持银行及卡Bin表)SynBin.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynBin.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[35]处理结束(同步跨行代扣支持银行及卡Bin表)SynBin.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[36]处理开始(同步个人网银银联还贷款卡Bin表)SynPerBin.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynPerBin.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[36]处理结束(同步个人网银银联还贷款卡Bin表)SynPerBin.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20121123 by dump
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[37]处理开始(同步机构区域对照表)SynOrganAreaRef.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynOrganAreaRef.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[37]处理结束(同步机构区域对照表)SynOrganAreaRef.sh*****" >>/backup/batchdir/log/tt_run.log

#added on 20130228 dumingping
#echo "`date` Runing SynMagRltInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[38]处理开始(同步股权托管系统托管机构信息表)SynMagRltInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynMagRltInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[38]处理结束(同步股权托管系统托管机构信息表)SynMagRltInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynMagRltInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20130712 dumingping
#echo "`date` Runing acDelete.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[39]处理开始(网银批量删除销户账号)acDelete.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/acDelete.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[39]处理结束(网银批量删除销户账号)acDelete.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing acDelete.sh end*******************" >>/backup/batchdir/log/tt_run.log

#add by huangshuai  20130902 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[40]处理开始(同步境外电汇SWIFT代码表)SynSwiftCode.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynSwiftCode.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[40]处理结束(同步境外电汇SWIFT代码表)SynSwiftCode.sh*****" >>/backup/batchdir/log/tt_run.log

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[41]处理开始(同步境外电汇机构权限表)SynOrganAuth.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynOrganAuth.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[41]处理结束(同步境外电汇机构权限表)SynOrganAuth.sh*****" >>/backup/batchdir/log/tt_run.log
#end by huangshuai  20130902

#added on 20130909 dumingping
#echo "`date` Runing SynFuturesCompanyInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[42]处理开始(银期转账期货公司信息同步)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynFuturesCompanyInfo.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[42]处理结束(银期转账期货公司信息同步)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynFuturesCompanyInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#add by huangshuai 20131119 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[43]处理开始(同步黄金积存提货网点)GetGoldOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/GetGoldOrgan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[43]处理结束(同步黄金积存提货网点)GetGoldOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
#end by huangshuai 20131119
#added on 20101123

#add by zhanglei 20140522 begin
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[44]处理开始(同步实物贵金属产品信息)SynRealGoldPrice.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynRealGoldPrice.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[44]处理结束(同步实物贵金属产品信息)SynRealGoldPrice.sh*****" >>/backup/batchdir/log/tt_run.log
#add by zhanglei 20140522 end

#added on 20140110 zhanglei begin
#echo "`date` Runing SupplyChain.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[45]处理开始(同步供应链角色)SupplyChain.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SupplyChain.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[45]处理结束(同步供应链角色)SupplyChain.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SupplyChain.sh end*******************" >>/backup/batchdir/log/tt_run.log
#added on 20140110 zhanglei end

#added on 20130909 dumingping
#echo "`date` Runing SynFuturesCompanyInfo.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[46]处理开始(对公银期转账期货公司信息同步)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynFuturesCompanyInfo4Ent.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[46]处理结束(对公银期转账期货公司信息同步)SynFuturesCompanyInfo.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynFuturesCompanyInfo.sh end*******************" >>/backup/batchdir/log/tt_run.log

#需求编号84838_网银后台优化实物金购买 add by wangqiang 20140827 start
#echo "`date` Runing SynGoldCityOrgan.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[47]处理开始(实物金产品规格价格文件同步)SynGoldCityOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/SynGoldCityOrgan.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[47]处理结束(实物金产品规格价格文件同步)SynGoldCityOrgan.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing SynGoldCityOrgan.sh*******************" >>/backup/batchdir/log/tt_run.log
#需求编号84838_网银后台优化实物金购买 add by wangqiang 20140827 end

#echo "`date` Runing ClearShareStore.sh start*****************" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[end]处理开始(清理ShareStore) ClearShareStore.sh*****" >>/backup/batchdir/log/tt_run.log
sh /backup/batchdir/shells/ClearShareStore.sh >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP[end]处理结束(清理ShareStore) ClearShareStore.sh*****" >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing ClearShareStore.sh end*******************" >>/backup/batchdir/log/tt_run.log

#added on 20110517
#echo "`date` Runing sjsgs/day.sh start*****************" >>/backup/batchdir/log/tt_run.log
#sh /backup/batchdir/shells/sjsgs/day.sh >>/backup/batchdir/log/tt_run.log
#echo "`date` Runing sjsgs/day.sh end*******************" >>/backup/batchdir/log/tt_run.log

#echo "`date` End of tt !!!!!!!!!!!!!!!!!!!" >>/backup/batchdir/log/tt_run.log
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} JOB处理结束(网银批处理) tt*****" >>/backup/batchdir/log/tt_run.log
echo "      ">>/backup/batchdir/log/tt_run.log

#add by fangxianwan 20120824(55872-网银系统-批量自动化改造)
echo 0
