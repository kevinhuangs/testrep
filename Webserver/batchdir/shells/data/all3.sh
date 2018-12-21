yesterday=$1

today='20140828'

if [ ${yesterday}  -eq ${today} ]; then
sqlplus bankdb/bankdb @all20140828.sql
else
sqlplus bankdb/bankdb @all3.sql
fi
