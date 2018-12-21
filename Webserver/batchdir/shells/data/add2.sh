yesterday=$1

today='20140828'

if [ ${yesterday}  -eq ${today} ]; then
echo "==>add---------11111---------"
sqlplus bankdb/bankdb @add2_20140828.sql
else
sqlplus bankdb/bankdb @add2.sql
fi
