. /oracle/.profile
currentpath="/backup/batchdir/shells/data"

cd ${currentpath}
yesterday=`sh ${currentpath}"/"addday.sh -1`

rm -r ${currentpath}/dat
mkdir ${currentpath}/dat

exportfile=${currentpath}"/file.xml"
readyfile=${currentpath}"/result.xml"
rm ${exportfile}
rm ${readyfile}

#处理全量数据文件
for loop_all in `ls ${currentpath}"/all_tmp/"*`
do
filesize=`cat ${loop_all}|wc -c`
basename=`basename ${loop_all}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="a_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#生成数据就绪文件数据
echo "<file>">>${exportfile}
echo "<filename>"${filename}"</filename>">>${exportfile}
echo "<filesize>"${filesize}"</filesize>">>${exportfile}
echo "</file>">>${exportfile}
cp ${loop_all} ${currentpath}/dat/${filename}
done

#处理每日增量数据文件
for loop_add in `ls ${currentpath}"/add_tmp/"*`
do
filesize=`cat ${loop_add}|wc -c`
basename=`basename ${loop_add}`
#filenamec=`echo ${basename}|tr -d "."`
filenamec=${basename%.*}
filename="i_nb_"${filenamec}"_"${yesterday}"_000_000.dat"
#生成数据就绪文件数据
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


