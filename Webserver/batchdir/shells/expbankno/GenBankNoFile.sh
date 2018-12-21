. /oracle/.profile
CURDIR=`pwd`
ExePath=/backup/batchdir/shells/expbankno
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
DOWNLOADFILE=/app/ceb/sharestore/b2e/BankNo
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
cd ${ExePath}
rm BankNo*.txt
ShellFileName=bankno.sql
echo "set long 1999">${ShellFileName}
echo "set linesize 1999">>${ShellFileName}
echo "set pagesize 0">>${ShellFileName}
echo "set feedback 0">>${ShellFileName}
echo "set termout off">>${ShellFileName}
echo "set heading off">>${ShellFileName}
echo "set longchunksize 1999">>${ShellFileName}
echo "set trimspool on">>${ShellFileName}
echo "spool count.txt">>${ShellFileName}
echo "select to_char(ceil(count(*)/10000)) from ibs_ptab_bankno;">>${ShellFileName}
echo "spool off">>${ShellFileName}
echo "exit">>${ShellFileName}
sqlplus bankdb/bankdb @bankno.sql
COUNTSQL=`more count.txt`
echo "set long 1999">${ShellFileName}
echo "set linesize 1999">>${ShellFileName}
echo "set pagesize 0">>${ShellFileName}
echo "set feedback 0">>${ShellFileName}
echo "set termout off">>${ShellFileName}
echo "set heading off">>${ShellFileName}
echo "set longchunksize 1999">>${ShellFileName}
echo "set trimspool on">>${ShellFileName}
min=1
NUMNO=${min}
while [ $min -le ${COUNTSQL} ]
        do
	NUMNO=${min}
        if  [ $min -le 9 ]
        then
        NUMNO=0${min}
        fi
        echo "spool BankNo"${NUMNO}".txt">>${ShellFileName}
        echo "select 	    FQHHAO">>${ShellFileName}               
        echo "     ||'|'||LIANHH  ">>${ShellFileName}
        echo "     ||'|'||ZHUANT  ">>${ShellFileName}
        echo "     ||'|'||JIGULB  ">>${ShellFileName}
        echo "     ||'|'||HANBDM  ">>${ShellFileName}
        echo "     ||'|'||BHSJCY  ">>${ShellFileName}
        echo "     ||'|'||ZJCYHH  ">>${ShellFileName}
        echo "     ||'|'||SSRHDM  ">>${ShellFileName}
        echo "     ||'|'||JIEDDM  ">>${ShellFileName}
        echo "     ||'|'||CHSHDM  ">>${ShellFileName}
        echo "     ||'|'||JIGOMC  ">>${ShellFileName}
        echo "     ||'|'||JIGOJC  ">>${ShellFileName}
        echo "     ||'|'||DIZHII  ">>${ShellFileName}
        echo "     ||'|'||YOUZBM  ">>${ShellFileName}
        echo "     ||'|'||DIHDIG  ">>${ShellFileName}
        echo "     ||'|'||DZYJDZ  ">>${ShellFileName}
        echo "     ||'|'||SXIORQ  ">>${ShellFileName}
        echo "     ||'|'||SHIXRQ  ">>${ShellFileName}
        echo "     ||'|'||GNGXRQ  ">>${ShellFileName}
        echo "     ||'|'||GNGXSJ  ">>${ShellFileName}
        echo "     ||'|'||CAOZBZ  ">>${ShellFileName}
        echo "     ||'|'||GNGXQH  ">>${ShellFileName}
        echo "     ||'|'||REMARK  ">>${ShellFileName}
        echo "     ||'|'||SHJNCH  ">>${ShellFileName}
        echo "     ||'|'||JILUZT  ">>${ShellFileName}
        echo "     from                                                 ">>${ShellFileName}
        echo "      (select rownum num , t.* from ibs_ptab_bankno t) t2 ">>${ShellFileName}
        echo "     where t2.num<=10000 *"${min}" and t2.num > 10000* "${min}" - 10000;                                 ">>${ShellFileName}
        echo "spool off                                                 ">>${ShellFileName}
        min=`expr $min + 1`

        done
echo "exit">>${ShellFileName}
sqlplus bankdb/bankdb @bankno.sql
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
#/backup/batchdir/tft/tftclient -dup -h14 -rBankNo/count.txt ${ExePath}/count.txt
#/backup/batchdir/tft/tftclient -dup -h12 -rBankNo/count.txt ${ExePath}/count.txt
#/backup/batchdir/tft/tftclient -dup -h13 -rBankNo/count.txt ${ExePath}/count.txt
cp ${ExePath}/count.txt ${DOWNLOADFILE}/count.txt
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 end
#min=1
#while [ $min -le ${COUNTSQL} ]

#do
#NUMNO=${min}
#        if  [ $min -le 9 ]
#        then
#        NUMNO=0${min}
#        fi
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 begin
#/backup/batchdir/tft/tftclient -dup -h14 -rBankNo/BankNo${NUMNO}.txt ${ExePath}/BankNo${NUMNO}.txt
#/backup/batchdir/tft/tftclient -dup -h12 -rBankNo/BankNo${NUMNO}.txt ${ExePath}/BankNo${NUMNO}.txt
#/backup/batchdir/tft/tftclient -dup -h13 -rBankNo/BankNo${NUMNO}.txt ${ExePath}/BankNo${NUMNO}.txt
#min=`expr $min + 1`
#done
cp ${ExePath}/BankNo*.txt ${DOWNLOADFILE}
#64227 银企通跨行互联对账单文件与联行号文件部署优化 by qihuiyang    20130301 end
cd ${CURDIR}
