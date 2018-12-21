#֧��������ͨ���л����ж��˵�Ϊѹ�����������ĸ��ļ�
#  1������ת�˶��˵���ϸ�ļ� KHZDMX ceb_ceb004_${YESTODAY} 17��
#  2������ת�˶��˵������ļ� KHZDHZ ceb_total_amount_${YESTODAY} 10��
#  3������ת�˶��˵��ļ� HNZD  ceb_ceb003_${TRANSDATE}
#  4������ͨ������ˮ�ļ� B2ELS ceb_relation_20130328
#  5�����˵�ѹ���ļ� DZYSWJ

#STEP1: tt���Ѿ������ݲɼ�����ȡ����������ת�˶��˵��ļ���������ת�Ƶ�/backup/batchdir/shells/b2ekhhl/��

LOCALFILEPATH=/backup/batchdir/shells/b2ekhhl
cd ${LOCALFILEPATH}

#ɾ����һ�ε��˵��ļ�(����ǰ������)ѹ����
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

#64227 ����ͨ���л������˵��ļ������к��ļ������Ż� by qihuiyang    20130301 begin
#tftclient����·��
TFTCLIENTPATH=/backup/batchdir/tft
#�ļ�����·��
DOWNFILE=/app/ceb/sharestore/b2e
#64227 ����ͨ���л������˵��ļ������к��ļ������Ż� by qihuiyang    20130301 end
#�ļ�����ͳһ����
KHZDMX=ceb_ceb004_${TRANSDATE}
KHZDHZ=ceb_total_amount_${TRANSDATE}
HNZD=ceb_ceb003_${TRANSDATE}
B2ELS=ceb_relation_${TRANSDATE}
TARNAME=ceb_${TRANSDATE}.tar
DZYSWJ=ceb_${TRANSDATE}.tar.gz 

#STEP2: ȥ����ȡ����ת�˶��˵��ļ���������ŵ�/backup/batchdir/shells/b2ekhhl/��
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(ȥ����ȡ����ת�˶��˵��ļ�) TFT*****"
${TFTCLIENTPATH}/tftclient -ddown -h0 -r/ext/dz/${TRANSDATE}/${HNZD} ${LOCALFILEPATH}/${HNZD}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP�������(ȥ����ȡ����ת�˶��˵��ļ�) TFT*****"


#STEP3: ��������ͨ������ˮ�ļ�
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(��������ͨ���л���������ˮ�ļ�)*****"
sh ${LOCALFILEPATH}/GenerateB2ELS.sh
echo "ok">>b2ekhhlls.txt
mv b2ekhhlls.txt ${B2ELS}
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "*****${nowTime} STEP�������(��������ͨ���л���������ˮ�ļ�)*****"

#����ļ��Ƿ���� 
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
				echo "    ***** ����ͨ������ˮ�ļ�������"
			fi
		else
			echo "    ***** ����ת�˶��˵��ļ�������"
		fi
	else
		echo "    ***** ����ת�˶��˵������ļ�������"
	fi
else
	echo "    ***** ����ת�˶��˵���ϸ�ļ�������"
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
echo 'ѭ����ʼʱ��Ϊ '${nowTime}
		if [ -e acnolist.txt ];then
			ACCOUNT=`cat acnolist.txt|wc -l`
			echo "�˺��б����˺ŵĸ���Ϊ"  ${ACCOUNT}
			cat acnolist.txt | while  read acnoall
			do
			let k="$k+1"
			echo '��' $k '��Ϊ' ${acnoall}
			gdjsacno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $1}'`
			acno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $2}'`
			jg="|+|"
			echo '��' $k '�������˺�Ϊ' ${gdjsacno} ', �˺�Ϊ' ${acno}
			gdjsacnomatch="/^"${gdjsacno}"$/"
			acnomatch="/^"${acno}"$/"
			echo '��' $k '�������˺�ƥ��Ϊ' ${gdjsacnomatch} ', �˺�ƥ��Ϊ' ${acnomatch}
			
			echo '��ʼ�����ļ�'
			#����ͨ������ˮ�ļ� ��7���ֶ�Ϊ�����˺� ��10���ֶ�  ceb_relation_20130328
			awk -F "[|][+][|]" '{if($7 ~ '$acnomatch') print $0}' acnomatch=${acnomatch} ${B2ELS} > ${B2ELSNEW}_${acno}_${TRANSDATE}
			echo ${B2ELS} '�ļ��������'
			
			#����ת�˶��˵���ϸ�ļ� ��1���ֶ�Ϊ�����˺� ��17���ֶ�  ceb_ceb004_${YESTODAY}
			awk -F "[|][+][|]" '{if($1 ~ '$gdjsacnomatch') print acno jg$2jg$3jg$4jg$5jg$6jg$7jg$8jg$9jg$10jg$11jg$12jg$13jg$14jg$15jg$16jg$17jg}' gdjsacnomatch=${gdjsacnomatch} acno=${acno} jg=${jg} ${KHZDMX} >> ${KHZDMXNEW}_${acno}_${TRANSDATE}
			echo ${KHZDMX} '�ļ��������'
			
			#����ת�˶��˵������ļ� ��1���ֶ�Ϊ�����˺� ��10���ֶ� ceb_total_amount_${YESTODAY}
			awk -F "[|][+][|]" '{if($1 ~ '$gdjsacnomatch') print acno jg$2jg$3jg$4jg$5jg$6jg$7jg$8jg$9jg$10jg}' gdjsacnomatch=${gdjsacnomatch} acno=${acno} jg=${jg} ${KHZDHZ} >> ${KHZDHZNEW}_${acno}_${TRANSDATE}
			echo ${KHZDHZ} '�ļ��������'
			
			#����ת�˶��˵��ļ� ��17���ֶ�Ϊ�����˺� ��24���ֶ�  ceb_ceb003_${TRANSDATE}
			awk -F "[|][+][|]" '{if($17 ~ '$acnomatch') print $0}' acnomatch=${acnomatch} ${HNZD} > ${HNZDNEW}_${acno}_${TRANSDATE}
			echo ${HNZD} '�ļ��������'
			done
			#���ɲ���ļ��б��ļ�splitfilelist.txt
			ls ${B2ELSNEW}_*_${TRANSDATE}  ${KHZDMXNEW}_*_${TRANSDATE} ${KHZDHZNEW}_*_${TRANSDATE} ${HNZDNEW}_*_${TRANSDATE} > splitfilelist.txt
			#ѭ������׷��ok
			cat splitfilelist.txt | while  read splitfilename
			do
			echo "ok">> ${splitfilename}
			echo "׷��ok���ļ�${splitfilename}"
			done
			#ѹ���ļ�
			k=0
			cat acnolist.txt | while read acnoall
			do
			acno=`echo ${acnoall}|awk -F "[|][+][|]" '{print $2}'`
			let k="$k+1"
			echo "׼�������ѹ���� $k ���˺� ${acno} �ļ�"
			SUCCESSFLAG=0
				tar cvf ceb_${acno}_${TARNAMENEW} ${B2ELSNEW}_${acno}_${TRANSDATE}  ${KHZDMXNEW}_${acno}_${TRANSDATE} ${KHZDHZNEW}_${acno}_${TRANSDATE} ${HNZDNEW}_${acno}_${TRANSDATE}
				echo "tar ���ļ�������ɣ���ʼִ�� gzip����"
				if [[ $? = 0 ]]  then
					/usr/contrib/bin/gzip -f ceb_${acno}_${TARNAMENEW}
					echo "gzip ���ļ��������"
					if [[ $? = 0 ]]  then
						SUCCESSFLAG=1
					else
						echo "    ***** gzip ���ļ�ѹ��tar��ʧ��"
					fi
				else
					echo "    ***** tar ���ļ��ļ�ʧ��"
				fi				
			done
		else 
			echo "    ***** �˺��б��ļ�������"
		fi
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo 'ѭ������ʱ��Ϊ '${nowTime}

fi

#Ϊ�˷�ֹ����ļ�ʧ�ܣ�����֮ǰgz��
#STEP4: ���tar������ѹ��.tar.gz
SUCCESSFLAG=0
if [ ${ALLCOUNT} = 4 ] && [ ${ACCOUNT} -gt 0 ] ; then
	nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
	echo "*****${nowTime} STEP����ʼ(�����ѹ��) *****"
	tar cvf ${TARNAME} ${KHZDMX} ${KHZDHZ} ${HNZD} ${B2ELS}
	if [[ $? = 0 ]]  then
		/usr/contrib/bin/gzip -f ${TARNAME}
		if [[ $? = 0 ]]  then
			SUCCESSFLAG=1
		else
			echo "    ***** gzipѹ��tar��ʧ��"
		fi
	else
		echo "    ***** tar�ļ�ʧ��"
	fi
	
	nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
	echo "*****${nowTime} STEP�������(�����ѹ��) *****"
	
	#STEP5: TFT��APP��������
	if [[ ${SUCCESSFLAG} = 1 ]] then
		APPSERVERPATH=B2EKHHLBILL
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP����ʼ(���˵��ļ���/app/ceb/sharestore/b2e��) TFT*****"
		#64227 ����ͨ���л������˵��ļ������к��ļ������Ż� by qihuiyang    20130301 begin
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
		#64227 ����ͨ���л������˵��ļ������к��ļ������Ż� by qihuiyang    20130301 end
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP�������(���˵��ļ�TFT��APPServer��) TFT*****"
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} ��ʼ�����˺ŷ����ļ���sharestore��"
		cp ${LOCALFILEPATH}/ceb_*_${DZYSWJNEW} ${DOWNFILE}/${APPSERVERPATH}/
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} �����˺ŷ����ļ���sharestore�����"
		
		#STEP6: ɾ����ʱ�ļ�
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP����ʼ(ɾ����ʱ�ļ�) rm*****"
		#rm ${KHZDMX} ${KHZDHZ} ${HNZD} ${B2ELS}
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP�������(ɾ����ʱ�ļ�) rm*****"
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP����ʼ(��ʼɾ����ʱ�˺ŷ����ļ�) rm*****"
		rm ${B2ELSNEW}_*_${TRANSDATE}  ${KHZDMXNEW}_*_${TRANSDATE} ${KHZDHZNEW}_*_${TRANSDATE} ${HNZDNEW}_*_${TRANSDATE}
		nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
		echo "*****${nowTime} STEP�������(ɾ����ʱ�˺ŷ����ļ����) rm*****"
	else
		echo "    ***** ����ļ�ʧ�ܣ�������ѹ�����ϴ�������ִ�н����ʧ�ܡ�"
	fi
else
	echo "***** ���˵��ļ�����ȫ�� �����޷����˺ţ� ����ͨ���л������˵��ļ���������ִ�н����ʧ�ܡ�"
fi
