#LANG=zh_CN.hp15CN
DATAPATH=/backup/batchdir/anbmx
SQLPATH=/backup/batchdir/shells

#自定义变量
TODAY=`sh /backup/batchdir/shells/data/addday.sh 0`  
if [ "$1" != "" ]; then TODAY=$1
fi
ProductDay='20140425'
SrcFileName1=NB_WEIXIN_${TODAY}.txt
SrcFileName2=NB_WEIXIN_${TODAY}.ok


DATA1=${DATAPATH}/${SrcFileName1}
DATA2=${DATAPATH}/${SrcFileName2}

SYNSQLAll=${SQLPATH}/MicroMessSigning_all.sql
SYNSQLAdd=${SQLPATH}/MicroMessSigning_add.sql

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#生成临时文件
echo ${ORACLE_HOME}

if [ ${TODAY}  -le ${ProductDay} ]; then
	${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQLAll}
else
	${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQLAdd}
fi

if [ -e "NB_WEIXIN_TMP.txt" ]; then
	mv NB_WEIXIN_TMP.txt ${DATA1}
	touch ${DATA2}
	
	#上传文件
	/backup/batchdir/tft/tftclient -dup -h10 -rimfile/${SrcFileName1} ${DATA1} 
	flag=$?
	if [ ${flag} -eq 0 ]; then
		/backup/batchdir/tft/tftclient -dup -h10 -rimfile/${SrcFileName2} ${DATA2} 
		echo "NTEBANK-SUCESS 微信银行签约数据文件上传成功"
	else
		echo "NTEBANK-ERROR 微信银行签约数据文件上传失败"
	fi
	
else 
	echo "NTEBANK-ERROR 微信银行签约数据文件上传失败"
fi
