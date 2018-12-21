. /oracle/.profile
currentpath="/backup/batchdir/shells/data"

cd ${currentpath}
yesterday=`sh ${currentpath}"/"addday.sh -1`
echo ${yesterday}

logYesterDay=`sh ${currentpath}"/"addday.sh -1 -`
mv /backup/batchdir/shells/data/day.log /backup/batchdir/shells/data/day.log.${logYesterDay}


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} JOB处理开始(数据入仓处理) day.sh*****" >>/backup/batchdir/shells/data/day.log

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

#生成数据文件之前，清除无效的数据文件  20130605 by nixy
rm ${currentpath}/*.tmp

#echo "`date` ==>全量数据处理" >>/backup/batchdir/shells/data/day.log
#执行全量脚本 modify on 20090828 by lst
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(全量数据处理) all.sh*****" >>/backup/batchdir/shells/data/day.log
sh all.sh ${yesterday} &
sh all2.sh ${yesterday} &
sh all3.sh ${yesterday} &
wait
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(全量数据处理) all.sh*****" >>/backup/batchdir/shells/data/day.log
#echo "`date` ==>全量数据处理结束" >>/backup/batchdir/shells/data/day.log

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(生成全量数据文件) *****" >>/backup/batchdir/shells/data/day.log

#处理全量数据文件
mv ${currentpath}/*.tmp ${currentpath}/all_tmp/
for loop_all in `ls ${currentpath}"/all_tmp/"*`
do
filesize=`cat ${loop_all}|wc -c`
basename=`basename ${loop_all}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="a_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#生成全量数据就绪文件数据
echo "<file>">>${exportfile}
echo "<filename>"${filename}"</filename>">>${exportfile}
echo "<filesize>"${filesize}"</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_all} ${currentpath}/dat/${filename}
done

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(生成全量数据文件) *****" >>/backup/batchdir/shells/data/day.log

#echo "`date` ==>处理每日增量数据处理" >>/backup/batchdir/shells/data/day.log
#执行每日增量脚本  modify on 20090828 by lst
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(每日增量数据处理) add.sh*****" >>/backup/batchdir/shells/data/day.log
sh add.sh ${yesterday} &
sh add2.sh ${yesterday} &
wait
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(每日增量数据处理) add.sh*****" >>/backup/batchdir/shells/data/day.log
#echo "`date` ==>处理每日增量数据处理结束" >>/backup/batchdir/shells/data/day.log

mv ${currentpath}/*.tmp ${currentpath}/add_tmp/


#added on 20080605
#echo "`date` ==>反序列化" >>/backup/batchdir/shells/data/day.log
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(反序列化处理) *****" >>/backup/batchdir/shells/data/day.log
sh /backup/batchdir/shells/data/EntJNLAntiSerial.sh ${yesterday}
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(反序列化处理) *****" >>/backup/batchdir/shells/data/day.log
#echo "`date` --反序列化结束!!!" >>/backup/batchdir/shells/data/day.log

echo "`date` ==>余额对账反序列化" >>/backup/batchdir/shells/data/day.log
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(余额对账反序列化) *****" >>/backup/batchdir/shells/data/day.log
sh /backup/batchdir/checkBalance.sh
nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(余额对账反序列化) *****" >>/backup/batchdir/shells/data/day.log
echo "`date` --余额对账反序列化!!!" >>/backup/batchdir/shells/data/day.log

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(生成增量数据文件) *****" >>/backup/batchdir/shells/data/day.log
#处理每日增量数据文件
for loop_add in `ls ${currentpath}"/add_tmp/"*`
do
filesize=`cat ${loop_add}|wc -c`
basename=`basename ${loop_add}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="i_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#生成每日增量数据就绪文件数据
echo "<file>">>${exportfile}
echo "<filename>"${filename}"</filename>">>${exportfile}
echo "<filesize>"${filesize}"</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_add} ${currentpath}/dat/${filename}
done

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(生成增量数据文件) *****" >>/backup/batchdir/shells/data/day.log


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理开始(生成最终数据文件) *****" >>/backup/batchdir/shells/data/day.log



#生成最终数据就绪文件
cat ${currentpath}/head.xml ${exportfile} ${currentpath}/footer.xml>>${readyfile}

readyfilename="edw_ready_nb_"${yesterday}"_000.xml"
cp ${readyfile} ${currentpath}/${readyfilename}
compress ${currentpath}/dat/*.dat
tarname="edw_data_nb_${yesterday}_000"
cd ${currentpath}/dat/
tar -cvf  ${tarname}.tar *.Z *.dat

#20111020 根据王磊要求判断是否所有的数据文件都生成了，若不是批量报错结束，不给数据仓库提供文件。需要重跑数据入仓程序
#注意以后数据入仓表数量发生变化时需要同步修改这里的程序
cp ${exportfile} ${currentpath}/coordinatefile.xml
fileNum4=`echo "\n" >>${currentpath}/coordinatefile.xml|sed /^[[:space:]]*$/d ${currentpath}/coordinatefile.xml|wc -l`
fileNumCoord=548
echo "fileNum4等于${fileNum4}" >>/backup/batchdir/shells/data/day.log
if [ fileNum4 -eq fileNumCoord ]; then
sh ${currentpath}/put.sh ${tarname}.tar ${tarname}.tar
sh ${currentpath}/put.sh ${currentpath}/${readyfilename} ${readyfilename}
else
####68326--day.sh中根据"NTEBANK-ERROR:fileNumCoord<>fileNum4"判断入仓失败,不允许重复和更改
echo "*****${nowTime} NTEBANK-ERROR:fileNumCoord<>fileNum4 *****" >>/backup/batchdir/shells/data/day.log
echo "*****${nowTime} NTEBANK-ERROR 数据入仓文件数量出错 *****" >>/backup/batchdir/shells/data/day.log
fi

mv ${currentpath}/${readyfilename} ${currentpath}/dat/${readyfilename}
rm ${currentpath}/dat/*.Z ${currentpath}/dat/*.dat
cd ..  

nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} STEP处理结束(生成最终数据文件) *****" >>/backup/batchdir/shells/data/day.log


#每个SQL处理时间日志处理

for loop_allLog in `ls ${currentpath}"/all_log/"*`
do
`cat ${loop_allLog} >>/backup/batchdir/shells/data/day.log`
done

for loop_addLog in `ls ${currentpath}"/add_log/"*`
do
`cat ${loop_addLog} >>/backup/batchdir/shells/data/day.log`
done


nowTime=`sh ${currentpath}"/"addTime.sh 0`
echo "*****${nowTime} JOB处理结束(数据入仓处理) day.sh*****" >>/backup/batchdir/shells/data/day.log