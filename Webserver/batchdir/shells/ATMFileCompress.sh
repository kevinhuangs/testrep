finalDate=`date +%Y%m%d`
echo "==>��ȡ�ļ�����Ϊ��"$finalDate
SOURCEPATH=/backup/batchdir/shells/data
SOURCEPATH1=/backup/batchdir/syndata
TARGEPATH=/backup/batchdir/syndata/ATM
tftclientpath=/backup/batchdir/tft
DayBeforeSeven=`sh ${SOURCEPATH}"/"addday.sh -7`
#ɾ��7����ǰ���ļ�
echo "��ʼɾ��7����ǰ���ļ�"
rm -f ${TARGEPATH}/?_netbank_product_info_${DayBeforeSeven}.*
#BTA�ֱ��Ʒ�ļ�
echo "��ʼ��${SOURCEPATH} mv�����ļ�"
mv ${SOURCEPATH}/2_NewI.txt  ${TARGEPATH}/2_${finalDate}NewI.txt
mv ${SOURCEPATH}/4_NewI.txt  ${TARGEPATH}/4_${finalDate}NewI.txt
#�������ļ�
echo "��ʼ��${SOURCEPATH} mv�������ļ�"
mv ${SOURCEPATH}/FundRate.txt  ${TARGEPATH}/FUND_${finalDate}.txt
#�������ļ�
echo "��ʼ��${SOURCEPATH} mv�������ļ�"
mv ${SOURCEPATH}/2_PrdWorkDate.txt  ${TARGEPATH}/2_PrdWorkDate${finalDate}.txt
mv ${SOURCEPATH}/4_PrdWorkDate.txt  ${TARGEPATH}/4_PrdWorkDate${finalDate}.txt
#�ܱ��Ʒ�ļ�
echo "��ʼ��${SOURCEPATH} mv�ܱ��Ʒ�ļ�"
mv ${SOURCEPATH}/2_ProductCode.txt  ${TARGEPATH}/2_netbank_product_${finalDate}.txt
mv ${SOURCEPATH}/4_ProductCode.txt  ${TARGEPATH}/4_netbank_product_${finalDate}.txt
#Ȩ����֪�ļ�
echo "��ʼ��${SOURCEPATH1} mvȨ����֪�ļ���cp"
mv ${SOURCEPATH1}/netbank_ackownledge_${finalDate}.txt  ${TARGEPATH}/2_netbank_ackownledge_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_ackownledge_${finalDate}.txt  ${TARGEPATH}/4_netbank_ackownledge_${finalDate}.txt
###############################################################################################################
#���ս�ʾ��
echo "��ʼ��${SOURCEPATH1} mv���ս�ʾ���ļ���cp"
mv ${SOURCEPATH1}/netbank_riskstatement_0_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_0_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_0_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_0_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_1_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_1_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_1_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_1_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_2_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_2_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_2_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_2_${finalDate}.txt
mv ${SOURCEPATH1}/netbank_riskstatement_3_${finalDate}.txt  ${TARGEPATH}/2_netbank_riskstatement_3_${finalDate}.txt
cp ${TARGEPATH}/2_netbank_riskstatement_3_${finalDate}.txt  ${TARGEPATH}/4_netbank_riskstatement_3_${finalDate}.txt
#���ս�ʾ�����Ͷ����ļ�
echo "��ʼ��${SOURCEPATH} mv���ս�ʾ�����Ͷ����ļ�"
mv ${SOURCEPATH}/netbank_riskstatement_type.txt  ${TARGEPATH}/netbank_riskstatement_type_${finalDate}.txt
#��Ʋ�Ʒ˵����
echo "��ʼ��${SOURCEPATH1} mv��Ʋ�Ʒ˵�����ļ���cp"
mv ${SOURCEPATH1}/2_netbank_*_description_${finalDate}.txt  ${TARGEPATH}/
mv ${SOURCEPATH1}/4_netbank_*_description_${finalDate}.txt  ${TARGEPATH}/

#��ҹ�е������ļ�
echo "��ʼ��${SOURCEPATH} mv��ҹ�е������ļ���cp"
mv ${SOURCEPATH}/asset_morning_type.txt  ${TARGEPATH}/2_asset_morning_type_${finalDate}.txt
cp ${TARGEPATH}/2_asset_morning_type_${finalDate}.txt  ${TARGEPATH}/4_asset_morning_type_${finalDate}.txt

#��ҹ������ʱ���ļ�
echo "��ʼ��${SOURCEPATH} mv��ҹ������ʱ���ļ�"
mv ${SOURCEPATH}/salestime.txt  ${TARGEPATH}/salestime_${finalDate}.txt

#��ʼУ���ļ��Ƿ���������
cd ${TARGEPATH}
pwd
#��ʼ�鵵ѹ���ļ�
echo "��ʼtar�ļ�"
cd ${TARGEPATH}
pwd
tar -cvf 2_netbank_product_info_${finalDate}.tar 2_${finalDate}NewI.txt FUND_${finalDate}.txt 2_PrdWorkDate${finalDate}.txt netbank_riskstatement_type_${finalDate}.txt 2_netbank_*_${finalDate}.txt salestime_${finalDate}.txt 2_asset_morning_type_${finalDate}.txt
tar -cvf 4_netbank_product_info_${finalDate}.tar 4_${finalDate}NewI.txt FUND_${finalDate}.txt 4_PrdWorkDate${finalDate}.txt netbank_riskstatement_type_${finalDate}.txt 4_netbank_*_${finalDate}.txt salestime_${finalDate}.txt 4_asset_morning_type_${finalDate}.txt
echo "��ʼѹ���ļ�"
compress -f 2_netbank_product_info_${finalDate}.tar
compress -f 4_netbank_product_info_${finalDate}.tar
echo "ѹ���ļ����"
#�ϴ���8.75
#������ѯ�ն�����
if [ -e ${TARGEPATH}/2_netbank_product_info_${finalDate}.tar.Z ];
then 
echo "��ʼtft 2_netbank_product_info_${finalDate}.tar.Z��8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/2_netbank_product_info_${finalDate}.tar.Z  ${TARGEPATH}/2_netbank_product_info_${finalDate}.tar.Z
touch ${TARGEPATH}/2_netbank_product_info_${finalDate}.ok
echo "��ʼtft 2_netbank_product_info_${finalDate}.ok��8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/2_netbank_product_info_${finalDate}.ok  ${TARGEPATH}/2_netbank_product_info_${finalDate}.ok
else 
echo "2_netbank_product_info_${finalDate}.tar.Z�ļ�������"
fi
#ATM����
if [ -e ${TARGEPATH}/4_netbank_product_info_${finalDate}.tar.Z ];
then 
echo "��ʼtft 4_netbank_product_info_${finalDate}.tar.Z��8.75"
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/4_netbank_product_info_${finalDate}.tar.Z  ${TARGEPATH}/4_netbank_product_info_${finalDate}.tar.Z
touch ${TARGEPATH}/4_netbank_product_info_${finalDate}.ok
${tftclientpath}/tftclient -dup -h39 -rproduct4vtm/4_netbank_product_info_${finalDate}.ok  ${TARGEPATH}/4_netbank_product_info_${finalDate}.ok
echo "��ʼtft 4_netbank_product_info_${finalDate}.ok��8.75"
else 
echo "2_netbank_product_info_${finalDate}.tar.Z�ļ�������"
fi
#��ʼɾ����ʱ�ļ�
echo "��ʼɾ����ʱ�ļ�"
rm *.txt