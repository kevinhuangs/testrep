. /oracle/.profile
currentpath="/backup/batchdir/shells/data"

cd ${currentpath}
yesterday=`sh ${currentpath}"/"addday.sh -1`
echo ${yesterday}

logYesterDay=`sh ${currentpath}"/"addday.sh -1 -`
mv /backup/batchdir/shells/data/day.log /backup/batchdir/shells/data/day.log.${logYesterDay}


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} JOB����ʼ(������ִ���) day.sh*****" >>/backup/batchdir/shells/data/day.log

rm -r ${currentpath}/all_tmp
rm -r ${currentpath}/add_tmp
rm -r ${currentpath}/all_log
rm -r ${currentpath}/add_log

mkdir ${currentpath}/all_tmp
mkdir ${currentpath}/add_tmp
mkdir ${currentpath}/all_log
mkdir ${currentpath}/add_log

rm -r ${currentpath}/dat
mkdir ${currentpath}/dat

exportfile=${currentpath}"/file.xml"
readyfile=${currentpath}"/result.xml"
rm ${exportfile}
rm ${readyfile}

#���������ļ�֮ǰ�������Ч�������ļ�  20130605 by nixy
rm ${currentpath}/*.tmp

#echo "`date` ==>ȫ�����ݴ���" >>/backup/batchdir/shells/data/day.log
#ִ��ȫ���ű� modify on 20090828 by lst
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(ȫ�����ݴ���) all.sh*****" >>/backup/batchdir/shells/data/day.log
sh all.sh ${yesterday} &
sh all2.sh ${yesterday} &
sh all3.sh ${yesterday} &
wait
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(ȫ�����ݴ���) all.sh*****" >>/backup/batchdir/shells/data/day.log
#echo "`date` ==>ȫ�����ݴ������" >>/backup/batchdir/shells/data/day.log

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(����ȫ�������ļ�) *****" >>/backup/batchdir/shells/data/day.log

#����ȫ�������ļ�
mv ${currentpath}/*.tmp ${currentpath}/all_tmp/
for loop_all in `ls ${currentpath}"/all_tmp/"*`
do
filesize=`cat ${loop_all}|wc -c`
basename=`basename ${loop_all}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="a_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#����ȫ�����ݾ����ļ�����
echo "<file>">>${exportfile}
echo "<filename>"${filename}"</filename>">>${exportfile}
echo "<filesize>"${filesize}"</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_all} ${currentpath}/dat/${filename}
done

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(����ȫ�������ļ�) *****" >>/backup/batchdir/shells/data/day.log

#echo "`date` ==>����ÿ���������ݴ���" >>/backup/batchdir/shells/data/day.log
#ִ��ÿ�������ű�  modify on 20090828 by lst
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(ÿ���������ݴ���) add.sh*****" >>/backup/batchdir/shells/data/day.log
sh add.sh ${yesterday} &
sh add2.sh ${yesterday} &
wait
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(ÿ���������ݴ���) add.sh*****" >>/backup/batchdir/shells/data/day.log
#echo "`date` ==>����ÿ���������ݴ������" >>/backup/batchdir/shells/data/day.log

mv ${currentpath}/*.tmp ${currentpath}/add_tmp/


#added on 20080605
#echo "`date` ==>�����л�" >>/backup/batchdir/shells/data/day.log
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(�����л�����) *****" >>/backup/batchdir/shells/data/day.log
sh /backup/batchdir/shells/data/EntJNLAntiSerial.sh ${yesterday}
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(�����л�����) *****" >>/backup/batchdir/shells/data/day.log
#echo "`date` --�����л�����!!!" >>/backup/batchdir/shells/data/day.log

echo "`date` ==>�����˷����л�" >>/backup/batchdir/shells/data/day.log
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(�����˷����л�) *****" >>/backup/batchdir/shells/data/day.log
sh /backup/batchdir/checkBalance.sh
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(�����˷����л�) *****" >>/backup/batchdir/shells/data/day.log
echo "`date` --�����˷����л�!!!" >>/backup/batchdir/shells/data/day.log

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(�������������ļ�) *****" >>/backup/batchdir/shells/data/day.log
#����ÿ�����������ļ�
for loop_add in `ls ${currentpath}"/add_tmp/"*`
do
filesize=`cat ${loop_add}|wc -c`
basename=`basename ${loop_add}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="i_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#����ÿ���������ݾ����ļ�����
echo "<file>">>${exportfile}
echo "<filename>"${filename}"</filename>">>${exportfile}
echo "<filesize>"${filesize}"</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_add} ${currentpath}/dat/${filename}
done

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(�������������ļ�) *****" >>/backup/batchdir/shells/data/day.log


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP����ʼ(�������������ļ�) *****" >>/backup/batchdir/shells/data/day.log



#�����������ݾ����ļ�
cat ${currentpath}/head.xml ${exportfile} ${currentpath}/footer.xml>>${readyfile}

readyfilename="edw_ready_nb_"${yesterday}"_000.xml"
cp ${readyfile} ${currentpath}/${readyfilename}
compress ${currentpath}/dat/*.dat
tarname="edw_data_nb_${yesterday}_000"
cd ${currentpath}/dat/
tar -cvf  ${tarname}.tar *.Z *.dat

#20111020 ��������Ҫ���ж��Ƿ����е������ļ��������ˣ���������������������������ݲֿ��ṩ�ļ�����Ҫ����������ֳ���
#ע���Ժ�������ֱ����������仯ʱ��Ҫͬ���޸�����ĳ���
cp ${exportfile} ${currentpath}/coordinatefile.xml
fileNum4=`echo "\n" >>${currentpath}/coordinatefile.xml|sed /^[[:space:]]*$/d ${currentpath}/coordinatefile.xml|wc -l`
fileNumCoord=548
echo "fileNum4����${fileNum4}" >>/backup/batchdir/shells/data/day.log
if [ fileNum4 -eq fileNumCoord ]; then
sh ${currentpath}/put.sh ${tarname}.tar ${tarname}.tar
sh ${currentpath}/put.sh ${currentpath}/${readyfilename} ${readyfilename}
else
####68326--day.sh�и���"NTEBANK-ERROR:fileNumCoord<>fileNum4"�ж����ʧ��,�������ظ��͸���
echo "*****${nowTime} NTEBANK-ERROR:fileNumCoord<>fileNum4 *****" >>/backup/batchdir/shells/data/day.log
echo "*****${nowTime} NTEBANK-ERROR ��������ļ��������� *****" >>/backup/batchdir/shells/data/day.log
fi

mv ${currentpath}/${readyfilename} ${currentpath}/dat/${readyfilename}
rm ${currentpath}/dat/*.Z ${currentpath}/dat/*.dat
cd ..  

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP�������(�������������ļ�) *****" >>/backup/batchdir/shells/data/day.log


#ÿ��SQL����ʱ����־����

for loop_allLog in `ls ${currentpath}"/all_log/"*`
do
`cat ${loop_allLog} >>/backup/batchdir/shells/data/day.log`
done

for loop_addLog in `ls ${currentpath}"/add_log/"*`
do
`cat ${loop_addLog} >>/backup/batchdir/shells/data/day.log`
done


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} JOB�������(������ִ���) day.sh*****" >>/backup/batchdir/shells/data/day.log