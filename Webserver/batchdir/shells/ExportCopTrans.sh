SQLPATH=/backup/batchdir/shells
finalDate=`date +%Y%m%d`
SOURCEPATH=/backup/batchdir/shells/data
TARGEPATH=/backup/batchdir/anbmx
tftclientpath=/backup/batchdir/tft
DayBeforeSeven=`sh ${SOURCEPATH}"/"addday.sh -7`
echo "��ʼɾ��7����ǰ���ļ�" NetBankTrans_${DayBeforeSeven}
rm -f ${TARGEPATH}/NetBankTrans_${DayBeforeSeven}.*
echo "����ɾ��7����ǰ���ļ�" NetBankTrans_${DayBeforeSeven}
echo "��ʼ���ɺ���ˮ�ļ�"NetBankTrans_${finalDate}.txt
sqlplus bankdb/bankdb @${SQLPATH}/ExportCopTrans.sql
mv ${SOURCEPATH}/NetBankTrans.txt ${TARGEPATH}/NetBankTrans_${finalDate}.txt
echo "�������ɺ���ˮ�ļ�"NetBankTrans_${finalDate}.txt
echo "��ʼtft NetBankTrans_${finalDate}.txt��8.75"
${tftclientpath}/tftclient -dup -h39 -rNetBank/CopJnl/NetBankTrans_${finalDate}.txt  ${TARGEPATH}/NetBankTrans_${finalDate}.txt
echo "����tft NetBankTrans_${finalDate}.txt��8.75"
echo "����.ok�ļ�"
touch ${TARGEPATH}/NetBankTrans_${finalDate}.ok
echo "��ʼtft NetBankTrans_${finalDate}.ok ��8.75"
${tftclientpath}/tftclient -dup -h39 -rNetBank/CopJnl/NetBankTrans_${finalDate}.ok  ${TARGEPATH}/NetBankTrans_${finalDate}.ok
echo "����tft NetBankTrans_${finalDate}.ok ��8.75"