yesterday=$1

today='20110927'

if [ ${yesterday}  -eq ${today} ]; then
sqlplus bankdb/bankdb @all20110927.sql
else
sqlplus bankdb/bankdb @all.sql
fi
