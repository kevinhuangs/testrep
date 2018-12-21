#LANG=zh_CN.hp15CN
DATAPATH=/backup/batchdir/anbmx/redbagLottery
CTLPATH=/backup/batchdir/ctrls
DBUSER=bankdb
DBPWD=bankdb
#自定义变量
TODAY=`date +%Y%m%d`
echo $TODAY
if [ "$1" != "" ]; then TODAY=$1
fi
echo $TODAY 
SYNSQL=/backup/batchdir/shells/RedBagWinLottery.sql
#定义同步文件的包名与文件名
DATANAME=HBCJ_${TODAY}.tar.gz
TARNAME=HBCJ_${TODAY}.tar

DATA1=${DATAPATH}/T_EB_NPP_REDENVPARA_${TODAY}.txt
DATA2=${DATAPATH}/T_EB_CJ_AUTH_${TODAY}.txt

nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0`
echo "**********${nowTime} 红包摇奖_拿文件开始************************">>/backup/batchdir/log/tt_run.log
/backup/batchdir/tft/tftclient -ddown -h15 -r738/snd/${DATANAME} ${DATAPATH}/${DATANAME} -t1111
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "**********${nowTime} 红包摇奖_拿文件结束************************">>/backup/batchdir/log/tt_run.log

echo "**********${nowTime} 红包摇奖_解压文件开始******************">>/backup/batchdir/log/tt_run.log
if [ -e "${DATAPATH}/${DATANAME}" ]; then
cd ${DATAPATH}
pwd
/usr/contrib/bin/gunzip -f ${DATANAME}
tar -xvf ${TARNAME}
fi
nowTime=`sh /backup/batchdir/shells/data/addTime.sh 0` 
echo "***********${nowTime} 红包摇奖_解压文件结束******************">>/backup/batchdir/log/tt_run.log

export ORACLE_BASE=/oracle
export ORACLE_HOME=$ORACLE_BASE/product/10.2.0

#如果存在红包参数文件
if [ -e "${DATA1}" -a -e "${DATA2}" ]; then
    #insert tmp data 
	${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCJREDENVPARATMP.ctl data=${DATA1} silent=feedback
    ${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTLPATH}/INTOCJAUTHTMP.ctl data=${DATA2} silent=feedback
	
	fileline1=`echo "\n" >>${DATA1}|sed /^[[:space:]]*$/d ${DATA1}|wc -l`
	fileline2=`echo "\n" >>${DATA2}|sed /^[[:space:]]*$/d ${DATA2}|wc -l`
	
	#count sqlnum
    sqlline1=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from IBS_PTAB_CJ_REDENVPARA_TMP;
　　exit;
　　END`	
    sqlline2=`sqlplus -silent /nolog <<END
　　conn ${DBUSER}/${DBPWD}
　　set pagesize 0 feedback off verify off heading off echo off 
　　select count( * ) coun from IBS_PTAB_CJ_AUTH_TMP;
　　exit;
　　END`	
	
	#如果红包参数文件行数等于临时表插入行数，则插入红包参数表
	echo " fileline1   sqlline1"
	echo " --------   --------"
	printf " %5s %9s\n" $fileline1 $sqlline1

	if [ fileline1  -ne sqlline1 ]; then
	    echo "表IBS_PTAB_CJ_REDENVPARA导入数据失败,保留导入前的数据 "
	    exit 1
	fi
	
	echo " fileline2   sqlline2"
	echo " --------   --------"
	printf " %5s %9s\n" $fileline2 $sqlline2
	
	if [ fileline2  -ne sqlline2 ]; then
	    echo "表IBS_PTAB_CJ_AUTH导入数据失败,保留导入前的数据"
	    exit 1
	fi

	echo "红包参数文件行数等于临时表插入行数"
	${ORACLE_HOME}/bin/sqlplus ${DBUSER}/${DBPWD} @${SYNSQL}
    echo "NTEBANK-SUCESS IBS_PTAB_CJ_REDENVPARA与IBS_PTAB_CJ_AUTH表导入成功"
else 
	echo "NTEBANK-ERROR 获取红包摇奖文件失败！" >>/backup/batchdir/log/tt_run.log	
fi


