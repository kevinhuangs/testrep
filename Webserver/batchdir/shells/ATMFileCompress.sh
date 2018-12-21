finalDate=`date +%Y%m%d`
echo "==>获取文件日期为："$finalDate
SOURCEPATH=/backup/batchdir/shells/data
SOURCEPATH1=/backup/batchdir/syndata
TARGEPATH=/backup/batchdir/syndata/ATM
tftclientpath=/backup/batchdir/tft
DayBeforeSeven=`sh ${SOURCEPATH}"/"addday.sh -7`
#删除7天以前的文件
echo "开始删除7天以前的文件"
rm -f ${TARGEPATH}/?_netbank_product_info_${DayBeforeSeven}.*
#BTA分表产品文件
echo "开始从${SOURCEPATH} mv行情文件"
mv ${SOURCEPATH}/2_NewI.txt  ${TARGEPATH}/2_${finalDate}NewI.txt
mv ${SOURCEPATH}/4_NewI.txt  ${TARGEPATH}/4_${finalDate}NewI.txt
#收益率文件
echo "开始从${SOURCEPATH} mv收益率文件"
mv ${SOURCEPATH}/FundRate.txt  ${TARGEPATH}/FUND_${finalDate}.txt
#开放日文件
echo "开始从${SOURCEPATH} mv开放日文件"
mv ${SOURCEPATH}/2_PrdWorkDate.txt  ${TARGEPATH}/2_PrdWorkDate${finalDate}.txt
mv ${SOURCEPATH}/4_PrdWorkDate.txt  ${TARGEPATH}/4_PrdWorkDate${finalDate}.txt
#总表产品文件
echo "开始从${SOURCEPATH} mv总表产品文件"
mv ${SOURCEPATH}/2_ProductCode.txt  ${TARGEPATH}/2_netbank_product_${finalDate}.txt
mv ${SOURCEPATH}/4_ProductCode.txt  ${TARGEPATH}/4_netbank_product_${finalDate}.txt
#权益须知文件
echo "开始从${SOURCEPATH1} mv权益须知文件并cp"
mv ${SOURCEPATH1}/netbank_ackownledge_${finalDate}.txt  ${TARGEPATH}/2_netbank_ackownledge_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_ackownledge_${finalDate}.txt  ${TARGEPATH}/4_netbank_ackownledge_${finalDate}.txt
###############################################################################################################
#风险揭示书
echo "开始从${SOURCEPATH1} mv风险揭示书文件并cp"
mv ${SOURCEPATH1}/netbank_riskstatement_0_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_0_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_0_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_0_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_1_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_1_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_1_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_1_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_2_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_2_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_2_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_2_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_3_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_3_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_3_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_3_${finalDate}.txt
#风险揭示书类型对照文件
echo "开始从${SOURCEPATH} mv风险揭示书类型对照文件"
mv ${SOURCEPATH}/netbank_riskstatement_type.txt  ${TARGEPATH}/netbank_riskstatement_type_${finalDate}.txt
#理财产品说明书
echo "开始从${SOURCEPATH1} mv理财产品说明书文件并cp"
mv ${SOURCEPATH1}/2_netbank_*_description_${finalDate}.txt  ${TARGEPATH}/
mv ${SOURCEPATH1}/4_netbank_*_description_${finalDate}.txt  ${TARGEPATH}/

#早夜市等属性文件
echo "开始从${SOURCEPATH} mv早夜市等属性文件并cp"
mv ${SOURCEPATH}/asset_morning_type.txt  ${TARGEPATH}/2_asset_morning_type_${finalDate}.txt
cp ${TARGEPATH}/2_asset_morning_type_${finalDate}.txt  ${TARGEPATH}/4_asset_morning_type_${finalDate}.txt

#早夜市销售时间文件
echo "开始从${SOURCEPATH} mv早夜市销售时间文件"
mv ${SOURCEPATH}/salestime.txt  ${TARGEPATH}/salestime_${finalDate}.txt

#开始校验文件是否生成完整
cd ${TARGEPATH}
pwd
#开始归档压缩文件
echo "开始tar文件"
cd ${TARGEPATH}
pwd
tar -cvf 2_netbank_product_info_${finalDate}.tar 2_${finalDate}NewI.txt FUND_${finalDate}.txt 2_PrdWorkDate${finalDate}.txt netbank_riskstatement_type_${finalDate}.txt 2_netbank_*_${finalDate}.txt salestime_${finalDate}.txt 2_asset_morning_type_${finalDate}.txt
tar -cvf 4_netbank_product_info_${finalDate}.tar 4_${finalDate}NewI.txt FUND_${finalDate}.txt 4_PrdWorkDate${finalDate}.txt netbank_riskstatement_type_${finalDate}.txt 4_netbank_*_${finalDate}.txt salestime_${finalDate}.txt 4_asset_morning_type_${finalDate}.txt
echo "开始压缩文件"
compress -f 2_netbank_product_info_${finalDate}.tar
compress -f 4_netbank_product_info_${finalDate}.tar
echo "压缩文件完成"
#上传至8.75
#自助查询终端渠道
if [ -e ${TARGEPATH}/2_netbank_product_info_${finalDate}.tar.Z ];
then 
echo "开始tft 2_netbank_product_info_${finalDate}.tar.Z到8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/2_netbank_product_info_${finalDate}.tar.Z  ${TARGEPATH}/2_netbank_product_info_${finalDate}.tar.Z
touch ${TARGEPATH}/2_netbank_product_info_${finalDate}.ok
echo "开始tft 2_netbank_product_info_${finalDate}.ok到8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/2_netbank_product_info_${finalDate}.ok  ${TARGEPATH}/2_netbank_product_info_${finalDate}.ok
else 
echo "2_netbank_product_info_${finalDate}.tar.Z文件不存在"
fi
#ATM渠道
if [ -e ${TARGEPATH}/4_netbank_product_info_${finalDate}.tar.Z ];
then 
echo "开始tft 4_netbank_product_info_${finalDate}.tar.Z到8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/4_netbank_product_info_${finalDate}.tar.Z  ${TARGEPATH}/4_netbank_product_info_${finalDate}.tar.Z
touch ${TARGEPATH}/4_netbank_product_info_${finalDate}.ok
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/4_netbank_product_info_${finalDate}.ok  ${TARGEPATH}/4_netbank_product_info_${finalDate}.ok
echo "开始tft 4_netbank_product_info_${finalDate}.ok到8.75"
else 
echo "2_netbank_product_info_${finalDate}.tar.Z文件不存在"
fi
#开始删除临时文件
echo "开始删除临时文件"
rm *.txt