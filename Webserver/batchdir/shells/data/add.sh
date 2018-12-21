yesterday=$1

today='20140828'

if [ ${yesterday}  -eq ${today} ]; then
sqlplus bankdb/bankdb @add_20140828.sql
else
sqlplus bankdb/bankdb @add.sql
fi
