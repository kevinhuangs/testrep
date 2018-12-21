yesterday=` perl -e "print sprintf '%04d%02d%02d',(localtime(time()+${1}*86400))[5]+1900,(localtime(time()+${1}*86400))[4]+1,(localtime(time()+${1}*86400))[3]"`
echo ${yesterday}

