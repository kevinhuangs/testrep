currentpath=`pwd`

rm -r ${currentpath}/all_tmp
rm -r ${currentpath}/add_tmp
mkdir all_tmp
mkdir add_tmp

rm -r ${currentpath}/dat
mkdir dat

exportfile=${currentpath}"/file.xml"
readyfile=${currentpath}"/result.xml"
rm ${exportfile}
rm ${readyfile}

sqlplus bankdb/bankdb@bankdb @all6.sql
mv ${currentpath}/*.tmp ${currentpath}/all_tmp/
#处理全量数据文件
for loop_all in `ls ${currentpath}"/all_tmp/"*`
do
filesize=`cat ${loop_all}|wc -c`
basename=`basename ${loop_all}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="a_nb_"${filenamec}"_20"`date +%y%m%d`"_000_000.dat"
#生成数据就绪文件数据
echo "<file>">>${exportfile}
echo "<filename>">>${exportfile}
echo ${filename}>>${exportfile}
echo "</filename>">>${exportfile}
echo "<filesize>">>${exportfile}
echo ${filesize}>>${exportfile}
echo "</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_all} ${currentpath}/dat/${filename}

done
echo "==>处理每日增量数据文件"
sqlplus bankdb/bankdb@bankdb @all.sql
mv ${currentpath}/*.tmp ${currentpath}/add_tmp/
#处理每日增量数据文件
for loop_add in `ls ${currentpath}"/add_tmp/"*`
do
filesize=`cat ${loop_add}|wc -c`
basename=`basename ${loop_add}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="i_nb_"${filenamec}"_20"`date +%y%m%d`"_000_000.dat"
#生成数据就绪文件数据
echo "<file>">>${exportfile}
echo "<filename>">>${exportfile}
echo ${filename}>>${exportfile}
echo "</filename>">>${exportfile}
echo "<filesize>">>${exportfile}
echo ${filesize}>>${exportfile}
echo "</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_add} ${currentpath}/dat/${filename}
done

#生成最终数据就绪文件
cat ${currentpath}/head.xml ${exportfile} ${currentpath}/footer.xml>>${readyfile}

readyfilename="edw_ready_nb_20"`date +%y%m%d`"_000.xml"
cp ${readyfile} ${currentpath}/${readyfilename}
compress ${currentpath}/dat/*.dat
tarname="edw_data_nb_`date +%y%m%d`_000"
cd ${currentpath}/dat/
tar -cvf  ${tarname}.tar *.Z
sh ${currentpath}/put.sh ${tarname}.tar ${tarname}.tar
mv ${currentpath}/${readyfilename} ${currentpath}/dat/${readyfilename}
cd ..  


