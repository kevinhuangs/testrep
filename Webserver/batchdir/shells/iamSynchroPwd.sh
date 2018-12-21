#相关目录
tftclientpath=/backup/batchdir/tft
logfile=/backup/batchdir/log/tt_run.log
filepath=/backup/batchdir/anbmx/iam

addday=`date +"%Y%m%d"`
desfile=${filepath}/${addday}_IAM153.eak


echo "`date` **********开始从服务端同步密文文件**********" >>${logfile}

#执行主机应急密文文件同步操作
${tftclientpath}/tftclient -ddown -h32 -rwyht/IAM153.eak ${desfile} 

#过滤主机同步结果
items1=`ls | find "${desfile}" |wc -l`

#首先执行主机同步，如果同步失败就执行备机同步，如果失败则本次同步失败。
if [ ${items1} > 0 ];then
echo  ${desfile}"  同步密文文件，执行结果：成功。" >> ${logfile}
${tftclientpath}/tftclient -dup -h16 -riam/${addday}_IAM153.eak ${desfile}
${tftclientpath}/tftclient -dup -h17 -riam/${addday}_IAM153.eak ${desfile}
else
echo "`date`  主机同步密文文件失败，开始进行备机同步。" >> ${logfile}
#执行备用机应急密文文件同步操作
${tftclientpath}/tftclient -ddown -h33 -rwyht/IAM153.eak ${desfile} 
	
#过滤备用机同步结果
items2=`ls | find "${desfile}" |wc -l` 
if [ ${items2} > 0 ];then
echo  ${desfile}"  同步密文文件，执行结果：成功。" >> ${logfile}
${tftclientpath}/tftclient -dup -h16 -riam/${addday}_IAM153.eak ${desfile}
${tftclientpath}/tftclient -dup -h17 -riam/${addday}_IAM153.eak ${desfile}
else
echo  ${desfile}"  同步密文文件，执行结果：失败。" >> ${logfile}
fi
fi
echo "`date` **************同步密文文件完成**************" >>${logfile}
