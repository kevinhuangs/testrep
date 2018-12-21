#���Ŀ¼
tftclientpath=/backup/batchdir/tft
logfile=/backup/batchdir/log/tt_run.log
filepath=/backup/batchdir/anbmx/iam

addday=`date +"%Y%m%d"`
desfile=${filepath}/${addday}_IAM153.eak


echo "`date` **********��ʼ�ӷ����ͬ�������ļ�**********" >>${logfile}

#ִ������Ӧ�������ļ�ͬ������
${tftclientpath}/tftclient -ddown -h32 -rwyht/IAM153.eak ${desfile} 

#��������ͬ�����
items1=`ls | find "${desfile}" |wc -l`

#����ִ������ͬ�������ͬ��ʧ�ܾ�ִ�б���ͬ�������ʧ���򱾴�ͬ��ʧ�ܡ�
if [ ${items1} > 0 ];then
echo  ${desfile}"  ͬ�������ļ���ִ�н�����ɹ���" >> ${logfile}
${tftclientpath}/tftclient -dup -h16 -riam/${addday}_IAM153.eak ${desfile}
${tftclientpath}/tftclient -dup -h17 -riam/${addday}_IAM153.eak ${desfile}
else
echo "`date`  ����ͬ�������ļ�ʧ�ܣ���ʼ���б���ͬ����" >> ${logfile}
#ִ�б��û�Ӧ�������ļ�ͬ������
${tftclientpath}/tftclient -ddown -h33 -rwyht/IAM153.eak ${desfile} 
	
#���˱��û�ͬ�����
items2=`ls | find "${desfile}" |wc -l` 
if [ ${items2} > 0 ];then
echo  ${desfile}"  ͬ�������ļ���ִ�н�����ɹ���" >> ${logfile}
${tftclientpath}/tftclient -dup -h16 -riam/${addday}_IAM153.eak ${desfile}
${tftclientpath}/tftclient -dup -h17 -riam/${addday}_IAM153.eak ${desfile}
else
echo  ${desfile}"  ͬ�������ļ���ִ�н����ʧ�ܡ�" >> ${logfile}
fi
fi
echo "`date` **************ͬ�������ļ����**************" >>${logfile}
