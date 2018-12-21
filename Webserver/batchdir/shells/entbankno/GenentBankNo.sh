currentpath="/backup/batchdir/shells/entbankno"
cd ${currentpath}
rm ${currentpath}/EntBankNo.txt
rm ${currentpath}/EntBankNo2.txt
rm ${currentpath}/EntBankNoZip.txt
sqlplus bankdb/bankdb @entbankno.sql
sqlplus bankdb/bankdb @entbankno2.sql
zip -r EntBankNoZip.txt  EntBankNo2.txt
cp ${currentpath}/EntBankNo.txt /app/ceb/sharestore/cebent/EntBankNo.txt
cp ${currentpath}/EntBankNoZip.txt /app/ceb/sharestore/cebent/EntBankNoZip.txt
