. /oracle/.profile
FEEYESTODAY=`/backup/batchdir/shells/addday.sh -1`
echo "==>获取日期为："${FEEYESTODAY}
FEEPATH=/backup/batchdir/sharedata/
cd $FEEPATH
echo "======$FEEPATH"
sqlplus bankdb/bankdb @/backup/batchdir/sql/expFeeData.sql
mv ${FEEPATH}feeItem.txt ${FEEPATH}feeItem${FEEYESTODAY}.txt
mv ${FEEPATH}feeType.txt ${FEEPATH}feeType${FEEYESTODAY}.txt
mv ${FEEPATH}feeCity.txt ${FEEPATH}feeCity${FEEYESTODAY}.txt
mv ${FEEPATH}feeCode.txt ${FEEPATH}feeCode${FEEYESTODAY}.txt
