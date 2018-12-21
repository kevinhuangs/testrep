FTPSERVIP=10.1.8.52
FTPUSER=u0310
FTPPWD=u0310
FTPSERVPATH=/ecasftp/ww/0691/
RESULTPATH=/backup/batchdir/anbmx

TZ=CST+16
YESTODAY=`date +%Y%m%d`
if [ "$1" != "" ]; then YESTODAY=$1
else i=1
fi
echo "==>��ȡ��������Ϊ��"$YESTODAY
TZ=CST-8
echo "TZ is " $TZ
TODAY=`date +%Y%m%d`
#�Զ������
echo TODAY=${TODAY}

FLAGFILENAME=CRM_CCLASS_CUST_${TODAY}.ok
TARFILENAME=CRM_BOND_CCLASS_CUST_INFO_${TODAY}.tar
DATFILENAME=CRM_BOND_CCLASS_CUST_INFO_${TODAY}.DAT.Z

#Ftp to the remote ftp server and get the file
echo "==>ftp���ļ����ڷ�����"
ftp -n $FTPSERVIP <<!
user $FTPUSER $FTPPWD
bin
prompt
lcd $RESULTPATH
cd $FTPSERVPATH
pwd
dir $FLAGFILENAME
get $FLAGFILENAME
dir $TARFILENAME
get $TARFILENAME
close
bye
!
cd $RESULTPATH
if [ -e "${FLAGFILENAME}" ]; then
rm CRM_BOND_CCLASS_CUST_INFO_${TODAY}.DAT
tar xvf $TARFILENAME
uncompress xvf $DATFILENAME
echo "��ѹ�ɹ�������ִ��SynCifOtherFlag.sh"
		#����Ϊͬ�������ļ������ݿ��Ĵ���
		#LANG=zh_CN.hp15CN
		CTLPATH=/backup/batchdir/ctrls
		DATAPATH=/backup/batchdir/anbmx
		SQLPATH=/backup/batchdir/shells
		DBUSER=bankdb
		DBPWD=bankdb
		DBSID=newebank
		TODAY=`date +%Y%m%d`
		#�Զ������
		echo TODAY=${TODAY}
		DATA=${DATAPATH}/CRM_BOND_CCLASS_CUST_INFO_${TODAY}.DAT
		CTL=${CTLPATH}/INTOCIFOTHERFLAG.ctl
		COUNTSQL=${SQLPATH}/CountCifOtherFlagTemp.sql
		TABLEMAME=IBS_ETAB_CIF_CUSTINFO_TMP
		SYNSQL=${SQLPATH}/UpdateCifOtherFlag.sql
		SHNAME=SynCifOtherFlag.sh
				
		export ORACLE_BASE=/oracle
		export ORACLE_HOME=$ORACLE_BASE/product/10.2.0
		#insert tmp data
		echo ${ORACLE_HOME}
		echo ${HOME}
		${ORACLE_HOME}/bin/sqlldr userid=${DBUSER}/${DBPWD} control=${CTL} data=${DATA} silent=feedback
		#insert data when inserted all  tmp data 
		if [ -e "${DATA}" ]; then
		fileline1=`echo "\n" >>${DATA}|sed /^[[:space:]]*$/d ${DATA}|wc -l`
		echo fileline1=${fileline1}
		${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${COUNTSQL}
		fileline2=`cat ${TABLEMAME}.txt`
		echo fileline2=${fileline2}
		if [ fileline1  -eq fileline2 ]; then
		${ORACLE_HOME}/bin/sqlplus bankdb/bankdb @${SYNSQL}
		else
		echo "NTEBANK-ERROR ��${TABLEMAME}��������ʧ�� ${SHNAME}" >>/backup/batchdir/log/tt_run.log
		fi
		else 
		echo "NTEBANK-ERROR ��ȡ${TABLEMAME}��ͬ���ļ�ʧ�ܣ�"
		fi
 else 
 echo "������Ҫͬ����"${FLAGFILENAME}"�ļ�"
 fi