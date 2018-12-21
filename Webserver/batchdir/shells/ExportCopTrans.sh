SQLPATH=/backup/batchdir/shells
finalDate=`date +%Y%m%d`
SOURCEPATH=/backup/batchdir/shells/data
TARGEPATH=/backup/batchdir/anbmx
tftclientpath=/backup/batchdir/tft
DayBeforeSeven=`sh ${SOURCEPATH}"/"addday.sh -7`
echo "开始删除7天以前的文件" NetBankTrans_${DayBeforeSeven}
rm -f ${TARGEPATH}/NetBankTrans_${DayBeforeSeven}.*
echo "结束删除7天以前的文件" NetBankTrans_${DayBeforeSeven}
echo "开始生成后督流水文件"NetBankTrans_${finalDate}.txt
sqlplus bankdb/bankdb @${SQLPATH}/ExportCopTrans.sql
mv ${SOURCEPATH}/NetBankTrans.txt ${TARGEPATH}/NetBankTrans_${finalDate}.txt
echo "结束生成后督流水文件"NetBankTrans_${finalDate}.txt
echo "开始tft NetBankTrans_${finalDate}.txt到8.75"
${tftclientpath}/tftclient -dup -h39 -rNetBank/CopJnl/NetBankTrans_${finalDate}.txt  ${TARGEPATH}/NetBankTrans_${finalDate}.txt
echo "结束tft NetBankTrans_${finalDate}.txt到8.75"
echo "生成.ok文件"
touch ${TARGEPATH}/NetBankTrans_${finalDate}.ok
echo "开始tft NetBankTrans_${finalDate}.ok 到8.75"
${tftclientpath}/tftclient -dup -h39 -rNetBank/CopJnl/NetBankTrans_${finalDate}.ok  ${TARGEPATH}/NetBankTrans_${finalDate}.ok
echo "结束tft NetBankTrans_${finalDate}.ok 到8.75"