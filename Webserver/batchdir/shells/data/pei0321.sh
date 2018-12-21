. /oracle/.profile
currentpath="/backup/batchdir/shells/data"

today="20081023"
today11="20090220"

cd ${currentpath}
yesterday=`sh ${currentpath}"/"addday.sh -1`
echo ${yesterday}

rm -r ${currentpath}/all_tmp
rm -r ${currentpath}/add_tmp
mkdir ${currentpath}/all_tmp
mkdir ${currentpath}/add_tmp

rm -r ${currentpath}/dat
mkdir ${currentpath}/dat

exportfile=${currentpath}"/file.xml"
readyfile=${currentpath}"/result.xml"
rm ${exportfile}
rm ${readyfile}

echo "==>全量数据处理"
#执行全量脚本 add on 20081023
if [ ${yesterday}  -eq ${today} ]; then
echo "==>all---------11111--------"
sqlplus bankdb/bankdb@newebank @all20081023.sql
else
sqlplus bankdb/bankdb@newebank @all.sql
fi
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

echo "==>处理每日增量数据处理"
#执行每日增量脚本 add on 20081023
if [ ${yesterday}  -eq ${today} ]; then
echo "==>add---------11111---------"
sqlplus bankdb/bankdb@newebank @add20081023.sql
else
sqlplus bankdb/bankdb@newebank @add.sql
fi

mv ${currentpath}/*.tmp ${currentpath}/add_tmp/

#added on 20090220
if [ ${yesterday}  -eq ${today11} ]; then
mv ${currentpath}/20090220/ibs_etab_jnl_transfer.tmp ${currentpath}/add_tmp/
fi

#added on 20080605
echo "==>反序列化ibs_etab_jnl2"
sh ../startBatchExecute.sh ${yesterday} , 28
echo "--反序列化结束!!!"

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

#生成最终数据就绪文件
cat ${currentpath}/head.xml ${exportfile} ${currentpath}/footer.xml>>${readyfile}

readyfilename="edw_ready_nb_"${yesterday}"_000.xml"
cp ${readyfile} ${currentpath}/${readyfilename}
compress ${currentpath}/dat/*.dat
tarname="edw_data_nb_${yesterday}_000"
cd ${currentpath}/dat/
tar -cvf  ${tarname}.tar *.Z *.dat
sh ${currentpath}/put.sh ${tarname}.tar ${tarname}.tar
sh ${currentpath}/put.sh ${currentpath}/${readyfilename} ${readyfilename}
mv ${currentpath}/${readyfilename} ${currentpath}/dat/${readyfilename}
rm ${currentpath}/dat/*.Z ${currentpath}/dat/*.dat
cd ..  


