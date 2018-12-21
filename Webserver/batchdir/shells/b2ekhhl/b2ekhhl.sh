#支付宝银企通跨行互联行对账单为压缩包，包含四个文件
#  1、行外转账对账单明细文件 KHZDMX ceb_ceb004_${YESTODAY} 17个
#  2、行外转账对账单汇总文件 KHZDHZ ceb_total_amount_${YESTODAY} 10列
#  3、行内转账对账单文件 HNZD  ceb_ceb003_${TRANSDATE}
#  4、银企通交易流水文件 B2ELS ceb_relation_20130328
#  5、对账单压缩文件 DZYSWJ

#STEP1: tt中已经从数据采集机上取得两个行外转账对账单文件，并将其转移到/backup/batchdir/shells/b2ekhhl/下

LOCALFILEPATH=/backup/batchdir/shells/b2ekhhl
cd ${LOCALFILEPATH}

#删除上一次的账单文件(两天前产生的)压缩包
rmCount=`find . -type f -mtime +2 | grep ceb | grep tar.gz |wc -l`
if [[ ${rmCount} > 0 ]]  then 
	find . -type f -mtime +2 | grep ceb | grep tar.gz | xargs rm
fi

TZ=CST+16
TRANSDATE=`date +%Y%m%d`
if [ "$1" != "" ]; then TRANSDATE=$1
else i=1
fi
TZ=CST-8

#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
#tftclient命令路径
TFTCLIENTPATH=/backup/batchdir/tft
#文件下载路径
DOWNFILE=/app/ceb/sharestore/b2e
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 end
#文件名称统一命名
KHZDMX=ceb_ceb004_${TRANSDATE}
KHZDHZ=ceb_total_amount_${TRANSDATE}
HNZD=ceb_ceb003_${TRANSDATE}
B2ELS=ceb_relation_${TRANSDATE}
TARNAME=ceb_${TRANSDATE}.tar
DZYSWJ=ceb_${TRANSDATE}.tar.gz 

#STEP2: 去核心取行内转账对账单文件，并将其放到/backup/batchdir/shells/b2ekhhl/下
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理开始(去核心取行内转账对账单文件) TFT*****"
${TFTCLIENTPATH}/tftclient -ddown -h0 -r/ext/dz/${TRANSDATE}/${HNZD} ${LOCALFILEPATH}/${HNZD}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理结束(去核心取行内转账对账单文件) TFT*****"


#STEP3: 生成银企通交易流水文件
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理开始(生成银企通跨行互联交易流水文件)*****"
sh ${LOCALFILEPATH}/GenerateB2ELS.sh
echo "ok">>b2ekhhlls.txt
mv b2ekhhlls.txt ${B2ELS}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP处理结束(生成银企通跨行互联交易流水文件)*****"

#检查文件是否存在 
ALLCOUNT=0
FILECOUNT=`ls | grep ${KHZDMX} |wc -l`
if [[ ${FILECOUNT} = 1 ]]  then
	ALLCOUNT=1
	FILECOUNT=`ls | grep ${KHZDHZ} |wc -l`
	if [[ ${FILECOUNT} = 1 ]]  then
		ALLCOUNT=2
		FILECOUNT=`ls | grep ${HNZD} |wc -l`
		if [[ ${FILECOUNT} = 1 ]]  then
			ALLCOUNT=3
			FILECOUNT=`ls | grep ${B2ELS} |wc -l`
			if [[ ${FILECOUNT} = 1 ]]  then
				ALLCOUNT=4
			else
				echo "    ***** 银企通交易流水文件不存在"
			fi
		else
			echo "    ***** 行内转账对账单文件不存在"
		fi
	else
		echo "    ***** 跨行转账对账单汇总文件不存在"
	fi
else
	echo "    ***** 跨行转账对账单明细文件不存在"
fi

KHZDMXNEW=ceb_ceb004
KHZDHZNEW=ceb_total_amount
HNZDNEW=ceb_ceb003
B2ELSNEW=ceb_relation
TARNAMENEW=${TRANSDATE}.tar
DZYSWJNEW=${TRANSDATE}.tar.gz 
ACCOUNT=0

if [[ ${ALLCOUNT} = 4 ]]  then
k=0
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo '循环开始时间为 '${nowTime}
		if [ -e acnolist.txt ];then
			ACCOUNT=`cat acnolist.txt|wc -l`
			echo "账号列表中账号的个数为"  ${ACCOUNT}
			cat acnolist.txt | while  read acnoall
			do
			let k="$k+1"
			echo '第' $k '行为' ${acnoall}
			gdjsacno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $1}'`
			acno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $2}'`
			jg="|+|"
			echo '第' $k '个垫资账号为' ${gdjsacno} ', 账号为' ${acno}
			gdjsacnomatch="/^"${gdjsacno}"$/"
			acnomatch="/^"${acno}"$/"
			echo '第' $k '个垫资账号匹配为' ${gdjsacnomatch} ', 账号匹配为' ${acnomatch}
			
			echo '开始分类文件'
			#银企通交易流水文件 第7个字段为付款账号 共10个字段  ceb_relation_20130328
			awk -F "[|][+][|]" '{if($7 ~ '$acnomatch') print $0}' acnomatch=${acnomatch} ${B2ELS} > ${B2ELSNEW}_${acno}_${TRANSDATE}
			echo ${B2ELS} '文件分类完成'
			
			#行外转账对账单明细文件 第1个字段为垫资账号 共17个字段  ceb_ceb004_${YESTODAY}
			awk -F "[|][+][|]" '{if($1 ~ '$gdjsacnomatch') print acno jg$2jg$3jg$4jg$5jg$6jg$7jg$8jg$9jg$10jg$11jg$12jg$13jg$14jg$15jg$16jg$17jg}' gdjsacnomatch=${gdjsacnomatch} acno=${acno} jg=${jg} ${KHZDMX} >> ${KHZDMXNEW}_${acno}_${TRANSDATE}
			echo ${KHZDMX} '文件分类完成'
			
			#行外转账对账单汇总文件 第1个字段为垫资账号 共10个字段 ceb_total_amount_${YESTODAY}
			awk -F "[|][+][|]" '{if($1 ~ '$gdjsacnomatch') print acno jg$2jg$3jg$4jg$5jg$6jg$7jg$8jg$9jg$10jg}' gdjsacnomatch=${gdjsacnomatch} acno=${acno} jg=${jg} ${KHZDHZ} >> ${KHZDHZNEW}_${acno}_${TRANSDATE}
			echo ${KHZDHZ} '文件分类完成'
			
			#行内转账对账单文件 第17个字段为付款账号 共24个字段  ceb_ceb003_${TRANSDATE}
			awk -F "[|][+][|]" '{if($17 ~ '$acnomatch') print $0}' acnomatch=${acnomatch} ${HNZD} > ${HNZDNEW}_${acno}_${TRANSDATE}
			echo ${HNZD} '文件分类完成'
			done
			#生成拆分文件列表文件splitfilelist.txt
			ls ${B2ELSNEW}_*_${TRANSDATE}  ${KHZDMXNEW}_*_${TRANSDATE} ${KHZDHZNEW}_*_${TRANSDATE} ${HNZDNEW}_*_${TRANSDATE} > splitfilelist.txt
			#循环处理追加ok
			cat splitfilelist.txt | while  read splitfilename
			do
			echo "ok">> ${splitfilename}
			echo "追加ok到文件${splitfilename}"
			done
			#压缩文件
			k=0
			cat acnolist.txt | while read acnoall
			do
			acno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $2}'`
			let k="$k+1"
			echo "准备打包并压缩第 $k 个账号 ${acno} 文件"
			SUCCESSFLAG=0
				tar cvf ceb_${acno}_${TARNAMENEW} ${B2ELSNEW}_${acno}_${TRANSDATE}  ${KHZDMXNEW}_${acno}_${TRANSDATE} ${KHZDHZNEW}_${acno}_${TRANSDATE} ${HNZDNEW}_${acno}_${TRANSDATE}
				echo "tar 分文件动作完成，开始执行 gzip命令"
				if [[ $? = 0 ]]  then
					/usr/contrib/bin/gzip -f ceb_${acno}_${TARNAMENEW}
					echo "gzip 分文件动作完成"
					if [[ $? = 0 ]]  then
						SUCCESSFLAG=1
					else
						echo "    ***** gzip 分文件压缩tar包失败"
					fi
				else
					echo "    ***** tar 分文件文件失败"
				fi				
			done
		else 
			echo "    ***** 账号列表文件不存在"
		fi
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo '循环结束时间为 '${nowTime}

fi

#为了防止拆分文件失败，保留之前gz包
#STEP4: 打成tar包，再压缩.tar.gz
SUCCESSFLAG=0
if [ ${ALLCOUNT} = 4 ] && [ ${ACCOUNT} -gt 0 ] ; then
	nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
	echo "*****${nowTime} STEP处理开始(打包并压缩) *****"
	tar cvf ${TARNAME} ${KHZDMX} ${KHZDHZ} ${HNZD} ${B2ELS}
	if [[ $? = 0 ]]  then
		/usr/contrib/bin/gzip -f ${TARNAME}
		if [[ $? = 0 ]]  then
			SUCCESSFLAG=1
		else
			echo "    ***** gzip压缩tar包失败"
		fi
	else
		echo "    ***** tar文件失败"
	fi
	
	nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
	echo "*****${nowTime} STEP处理结束(打包并压缩) *****"
	
	#STEP5: TFT到APP服务器上
	if [[ ${SUCCESSFLAG} = 1 ]] then
		APPSERVERPATH=B2EKHHLBILL
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理开始(对账单文件到/app/ceb/sharestore/b2e上) TFT*****"
		#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
		#${TFTCLIENTPATH}/tftclient -dup -h16 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h17 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h18 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h19 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h20 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h21 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h22 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h23 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h24 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h25 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h26 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h27 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h28 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h29 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h30 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		#${TFTCLIENTPATH}/tftclient -dup -h31 -r${APPSERVERPATH}/${DZYSWJ} ${LOCALFILEPATH}/${DZYSWJ}
		
		cp ${LOCALFILEPATH}/${DZYSWJ} ${DOWNFILE}/${APPSERVERPATH}/${DZYSWJ}
		#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 end
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理结束(对账单文件TFT到APPServer上) TFT*****"
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} 开始拷贝账号分类文件到sharestore下"
		cp ${LOCALFILEPATH}/ceb_*_${DZYSWJNEW} ${DOWNFILE}/${APPSERVERPATH}/
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} 拷贝账号分类文件到sharestore下完成"
		
		#STEP6: 删除临时文件
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理开始(删除临时文件) rm*****"
		#rm ${KHZDMX} ${KHZDHZ} ${HNZD} ${B2ELS}
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理结束(删除临时文件) rm*****"
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理开始(开始删除临时账号分类文件) rm*****"
		rm ${B2ELSNEW}_*_${TRANSDATE}  ${KHZDMXNEW}_*_${TRANSDATE} ${KHZDHZNEW}_*_${TRANSDATE} ${HNZDNEW}_*_${TRANSDATE}
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP处理结束(删除临时账号分类文件完成) rm*****"
	else
		echo "    ***** 打包文件失败，不进行压缩包上传操作，执行结果：失败。"
	fi
else
	echo "***** 对账单文件不齐全， 或者无分类账号， 银企通跨行互联对账单文件生成任务，执行结果：失败。"
fi
