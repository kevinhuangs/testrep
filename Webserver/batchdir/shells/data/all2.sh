yesterday=$1

today='20130620'

if [ ${yesterday}  -eq ${today} ]; then
sqlplus bankdb/bankdb @all20130627.sql
else
sqlplus bankdb/bankdb @all2.sql
fi