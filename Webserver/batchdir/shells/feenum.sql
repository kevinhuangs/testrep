set long 19999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999

spool /backup/batchdir/log/MoveFeeNum.log
set trimspool on
drop table IBS_PTAB_FEENUM_TMP1;
drop table IBS_PTAB_FEENUM_TMP;
drop table IBS_PTAB_FEEITEM_TMP;
drop  sequence SEQ_FEENUM_TMP;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(drop table完成) *****' from dual;
-- Create table
create table IBS_PTAB_FEENUM_TMP1
(
  USER_ID     VARCHAR2(10) not null,
  NUM_ID1     VARCHAR2(35) not null,
  NUM_ID2     VARCHAR2(20),
  NUM_ID3     VARCHAR2(20),
  CONTRACT_NO VARCHAR2(30),
  CITY_ID     VARCHAR2(3) not null,
  TYPE_ID     VARCHAR2(3) not null,
  ITEM_NO     VARCHAR2(6) not null,
  NUM_NAME    VARCHAR2(100) not null,
  NUM_IDTYPE  CHAR(1) not null,
  NUM_IDCODE  VARCHAR2(30) not null,
  NUM_ADDR    VARCHAR2(160),
  NUM_ZIPCODE VARCHAR2(10),
  NUM_NO1     VARCHAR2(10)
)
tablespace USER01;



-- Create table
create table IBS_PTAB_FEENUM_TMP
(
  CIF_NO       VARCHAR2(100),
  CHNLNO       VARCHAR2(100),
  CHNLINSTNO   VARCHAR2(100),
  TRANTIME     VARCHAR2(100),
  BUSITYPEFLAG VARCHAR2(100),
  BILLTYPE     VARCHAR2(100),
  CITYID       VARCHAR2(100),
  NUMFLAG      VARCHAR2(100),
  USERNUM      VARCHAR2(100),
  PHONE        VARCHAR2(100),
  BILLNUM      VARCHAR2(100),
  USERNUM1     VARCHAR2(100),
  USERNUM2     VARCHAR2(100),
  USERNUM3     VARCHAR2(100),
  BUSITYPENAME VARCHAR2(100),
  BILLTYPENAME VARCHAR2(100),
  REMARK       VARCHAR2(100),
  RESERVE1     VARCHAR2(100),
  RESERVE2     VARCHAR2(100)
)
tablespace USER01;

-- Create table
create  table IBS_PTAB_FEEITEM_TMP
(
  BILLNUM      VARCHAR2(100),
  CITY_ID      VARCHAR2(100),
  ITEM_NO      VARCHAR2(100),
  BILLBUSITYPE VARCHAR2(100),
  PARANAME     VARCHAR2(100),
  BILLTYPENAME VARCHAR2(100),
  FEECITY_ID   VARCHAR2(100)
)
tablespace USER01;

-- Create sequence 
create  sequence SEQ_FEENUM_TMP
minvalue 1
maxvalue 999999999999999999999999999
start with 10000000000001
increment by 1
cache 20;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(creat table完成) *****' from dual;
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000301', '023', '000301', '0', '电费', '重庆市电费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000601', '023', '000601', '3', '通讯费', '重庆市移动手机费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023004201', '023', '004201', '3', '通讯费', '重庆联通通讯费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023004901', '023', '004901', '7', '有线电视费', '重庆有线电视代缴费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001602', '025', '001602', '3', '通讯费', '江苏省移动通讯费（后付费）', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001101', '028', '001101', '1', '水费', '成都市自来水费', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001201', '028', '001201', '2', '燃气费', '成都市煤气费', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001301', '028', '001301', '0', '电费', '成都市电费', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001601', '028', '001601', '3', '通讯费', '成都市移动通讯费', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001701', '028', '001701', '3', '通讯费', '四川电信固话', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001702', '028', '001702', '3', '通讯费', '成都市电信小灵通', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001703', '028', '001703', '3', '通讯费', '成都市电信金蓉通', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001704', '028', '001704', '3', '通讯费', '成都市电信ADSL', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001705', '028', '001705', '3', '通讯费', '成都市电信社区宽带', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001706', '028', '001706', '3', '通讯费', '成都市电信C网话费', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006804', '512', '006804', '1', '水费', '苏州市市区水费代缴', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006805', '512', '006805', '1', '水费', '苏州市新区水费代缴', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006806', '512', '006806', '1', '水费', '苏州市相城区水费代缴', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000001', '574', '000001', '3', '通讯费', '宁波市联通充值', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000002', '574', '000002', '3', '通讯费', '浙江省移动充值', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000008', '574', '000008', '1', '水费', '宁波市象山县水费代缴', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000024', '574', '000024', '1', '水费', '余姚市水费代缴', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001601', '771', '001601', '3', '通讯费', '广西移动手机费代缴', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771004201', '771', '004201', '3', '通讯费', '广西联通话费代缴', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010000201', '001', '000201', '2', '燃气费', '北京市燃气费', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010000701', '001', '000701', '3', '通讯费', '北京市电信通讯费代缴', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001101', '001', '001101', '1', '水费', '北京自来水费代缴', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001301', '001', '001301', '0', '电费', '北京网络电表代缴', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001601', '001', '001601', '3', '通讯费', '北京移动手机缴费', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001701', '001', '001701', '3', '通讯费', '北京市联通通讯费代缴', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010010701', '001', '010701', '9', '其他', '北京市供暖费代缴', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068202', '731', '068202', '3', '通讯费', '湖南移动话费代缴', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068203', '731', '068203', '3', '通讯费', '湖南联通话费代缴', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068204', '731', '068204', '3', '通讯费', '湖南电信话费代缴', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731069010', '731', '069010', '3', '通讯费', '全国移动手机充值', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000701', '023', '000701', '3', '通讯费', '重庆电信话费代缴', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000101', '023', '001101', '1', '水费', '重庆中法供水水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222001', '411', '222001', '9', '其他', '大连市联合收费代缴', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411041102', '411', '222002', '3', '通讯费', '大连市移动话费代缴', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222003', '411', '222003', '3', '通讯费', '大连市联通固话费代缴', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222004', '411', '222004', '3', '通讯费', '联通手机话费代缴', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222005', '411', '222005', '3', '通讯费', '电信手机话费代缴', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001607', '459', '001607', '3', '通讯费', '缴纳大庆网通话费', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001608', '459', '001608', '3', '通讯费', '黑龙江省移动手机', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009001', '021', '009001', '3', '通讯费', '上海市电信通讯费代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009002', '021', '009002', '3', '通讯费', '上海市移动手机代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009003', '021', '009003', '3', '通讯费', '上海市联通手机代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009004', '021', '009004', '3', '通讯费', '铁通电信费代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009006', '021', '009006', '0', '电费', '上海市电费代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009007', '021', '009007', '1', '水费', '上海市市北/威立雅自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009009', '021', '009009', '1', '水费', '上海市市南自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009010', '021', '009010', '1', '水费', '上海市闵行自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009011', '021', '009011', '1', '水费', '上海市新区自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009012', '021', '009012', '1', '水费', '上海市金山自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009013', '021', '009013', '1', '水费', '上海市嘉定自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009014', '021', '009014', '2', '燃气费', '上海大众燃气费', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009015', '021', '009015', '2', '燃气费', '上海市燃气费代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009017', '021', '009017', '7', '有线电视费', '东方有线代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022000601', '022', '000601', '3', '通讯费', '天津市电信通信费用代缴', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022000701', '022', '000701', '3', '通讯费', '天津联通话费代缴', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000102', '023', '000102', '1', '水费', '重庆市自来水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000103', '023', '000103', '1', '水费', '重庆市二次供水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000104', '023', '000104', '1', '水费', '重庆市合川区水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000105', '023', '000105', '1', '水费', '重庆市渝南渔洞水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000106', '023', '000106', '1', '水费', '重庆市巴南道角水费', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024000101', '024', '000101', '1', '水费', '沈阳市水费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024000601', '024', '000601', '3', '通讯费', '沈阳市电信手机话费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001101', '024', '001101', '1', '水费', '沈阳胜科水务（张士开发区）水费', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001201', '024', '001201', '2', '燃气费', '沈阳市煤气费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001301', '024', '001301', '0', '电费', '沈阳市电费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001601', '024', '001601', '3', '通讯费', '沈阳市联通手机费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001701', '024', '001701', '3', '通讯费', '沈阳市联通固定话费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024052401', '024', '052401', '3', '通讯费', '沈阳市移动手机费代收', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000101', '025', '000101', '1', '水费', '南京市水费代收', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000301', '025', '000301', '0', '电费', '南京市电费代收', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000701', '025', '000701', '3', '通讯费', '南京市电信固话费代缴', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000702', '025', '000702', '3', '通讯费', '南京市电信手机费代缴', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001201', '025', '001201', '2', '燃气费', '南京市煤气费代收', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001601', '025', '001601', '3', '通讯费', '江苏省移动通讯费（预付费）', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025004201', '025', '004201', '3', '通讯费', '南京市联通话费代缴', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027000101', '027', '000101', '1', '水费', '武汉市水费代收', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027000301', '027', '000301', '0', '电费', '武汉市电费代收', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027001601', '027', '001601', '3', '通讯费', '武汉市移动手机费代收', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027001701', '027', '001701', '3', '通讯费', '武汉市电信代收', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027004201', '027', '004201', '3', '通讯费', '武汉市联通手机费代收', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029001701', '029', '001701', '3', '通讯费', '西安电信电话费代收', '029');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029004201', '029', '004201', '3', '通讯费', '西安联通电话费代收', '029');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('311001201', '311', '001201', '2', '燃气费', '石家庄市燃气费代缴', '311');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371000501', '371', '000501', '9', '其他', '郑州市医保费代缴', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001201', '371', '001201', '2', '燃气费', '郑州市燃气天然气费代缴', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001601', '371', '001601', '3', '通讯费', '河南移动电话费代缴', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001701', '371', '001701', '3', '通讯费', '河南省联通通讯费', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001201', '415', '001201', '3', '通讯费', '丹东电信手机费代缴', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001301', '415', '001301', '0', '电费', '丹东市电费代缴', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001702', '415', '001702', '3', '通讯费', '丹东联通固话费代缴', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415004201', '415', '004201', '3', '通讯费', '丹东联通手机费代缴', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415052402', '415', '052402', '3', '通讯费', '丹东移动手机费代缴', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431000601', '431', '000601', '3', '通讯费', '长春电信CDMA手机话费代缴', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431001301', '431', '001301', '0', '电费', '吉林省电力代缴非卡表用户电费', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431004201', '431', '004201', '3', '通讯费', '长春联通手机话费代缴', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001601', '451', '001601', '3', '通讯费', '黑龙江联通通讯费', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001604', '451', '001604', '2', '燃气费', '哈尔滨燃气费代缴', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001605', '451', '001605', '3', '通讯费', '哈尔滨电信代缴', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001608', '451', '001608', '3', '通讯费', '黑龙江省移动手机', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001609', '451', '001609', '1', '水费', '哈尔滨水费代缴', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('471000701', '471', '000701', '3', '通讯费', '内蒙古电信通讯费', '471');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('471001601', '471', '001601', '3', '通讯费', '内蒙古移动通讯费代缴', '471');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001708', '510', '001708', '3', '通讯费', '无锡市电信代缴费', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001709', '510', '001709', '3', '通讯费', '无锡市移动通讯费', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001710', '510', '001710', '3', '通讯费', '无锡市联通通讯费', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006801', '512', '006801', '3', '通讯费', '苏州市移动后付费代缴', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006802', '512', '006802', '3', '通讯费', '苏州市电信通讯费', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006803', '512', '006803', '3', '通讯费', '苏州市联通通讯费', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006819', '512', '006819', '7', '有线电视费', '苏州市有线电视费充值', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531000701', '531', '000701', '3', '通讯费', '济南市电信代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001101', '531', '001101', '1', '水费', '济南自来水代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001301', '531', '001301', '0', '电费', '济南电力代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001601', '531', '001601', '3', '通讯费', '济南市移动代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001701', '531', '001701', '3', '通讯费', '济南市联通（固话）代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531002601', '531', '002601', '3', '通讯费', '济南市联通手机代缴费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531004901', '531', '004901', '7', '有线电视费', '济南市有线电视费', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535515201', '535', '515201', '3', '通讯费', '烟台市联通固话代缴费', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535519201', '535', '519201', '0', '电费', '烟台市电力代收费', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535716101', '535', '716101', '7', '有线电视费', '烟台市有线电视费', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000801', '551', '000801', '7', '有线电视费', '合肥有线电视代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000803', '551', '000803', '7', '有线电视费', '安广网络有线数字电视费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001101', '551', '001101', '1', '水费', '合肥市水费代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001201', '551', '001201', '2', '燃气费', '合肥市燃气缴费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001301', '551', '001301', '0', '电费', '合肥市电费代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001602', '551', '001602', '3', '通讯费', '安徽省移动通讯费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001701', '551', '001701', '3', '通讯费', '合肥电信话费代收', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551004202', '551', '004202', '3', '通讯费', '安徽省联通通讯费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068273', '571', '068273', '2', '燃气费', '杭州市燃气费代缴', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068276', '571', '068276', '3', '通讯费', '浙江联通充值缴费', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068278', '571', '068278', '3', '通讯费', '浙江电信固话缴费', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068279', '571', '068279', '3', '通讯费', '浙江电信宽带缴费', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000007', '574', '000007', '1', '水费', '奉化市水费代缴', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000009', '574', '000009', '1', '水费', '宁波市宁海县水费代缴', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574020001', '574', '020001', '3', '通讯费', '宁波电信通讯后付费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574020002', '574', '020002', '3', '通讯费', '宁波市电信手机预付费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574030001', '574', '030001', '1', '水费', '宁波市水费代缴', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040001', '574', '040001', '0', '电费', '宁波市海曙电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040002', '574', '040002', '0', '电费', '宁波市江东电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040003', '574', '040003', '0', '电费', '宁波市江北电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040004', '574', '040004', '0', '电费', '宁波市鄞州电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040005', '574', '040005', '0', '电费', '宁波市镇海电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040006', '574', '040006', '0', '电费', '宁波市北仑电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040007', '574', '040007', '0', '电费', '宁波市奉化电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040008', '574', '040008', '0', '电费', '宁波市象山电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040009', '574', '040009', '0', '电费', '宁波市宁海电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040010', '574', '040010', '0', '电费', '宁波市慈溪电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040011', '574', '040011', '0', '电费', '宁波市余姚电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040012', '574', '040012', '0', '电费', '宁波市杭湾电费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574050001', '574', '050001', '2', '燃气费', '宁波市兴光燃气', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574090001', '574', '090001', '3', '通讯费', '宁波市联通固话宽带费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000106', '591', '000106', '1', '水费', '福州自来水费', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001301', '591', '001301', '0', '电费', '福建省电费代缴（除福州市）', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '591', '001601', '3', '通讯费', '福建省联通话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001701', '591', '001701', '3', '通讯费', '福州市电信话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513001', '592', '513001', '7', '有线电视费', '厦门市有线电视费', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513002', '592', '513002', '3', '通讯费', '厦门市电信通讯费', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513003', '592', '513003', '3', '通讯费', '厦门市移动通讯费', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068005', '731', '068005', '1', '水费', '长沙市自来水费代缴', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731069011', '731', '069011', '1', '水费', '湖南省株洲市水费', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064102', '755', '064102', '3', '通讯费', '深圳市电信手机固话ADSL代缴', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064103', '755', '064103', '3', '通讯费', '深圳市电信代表号缴费', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064105', '755', '064105', '1', '水费', '深圳市水费', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001101', '771', '001101', '1', '水费', '广西绿城水务水费代缴', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001701', '771', '001701', '3', '通讯费', '广西电信话费宽带费代缴', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771004901', '771', '004901', '7', '有线电视费', '广西广电网络电视费', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001601', '791', '001601', '3', '通讯费', '江西省移动手机费', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001602', '791', '001602', '3', '通讯费', '江西省联通通讯费', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001603', '791', '001603', '3', '通讯费', '南昌市电信话费', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001604', '791', '001604', '1', '水费', '南昌洪城水费代缴', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001605', '791', '001605', '0', '电费', '江西省电费', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001606', '791', '001606', '3', '通讯费', '南昌市电信宽带费', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000101', '871', '000101', '1', '水费', '昆明市自来水费', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000201', '871', '000201', '2', '燃气费', '昆明市燃气费', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000301', '871', '000301', '0', '电费', '昆明市电费代缴', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000701', '871', '000701', '3', '通讯费', '云南省联通代收费', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000702', '871', '000702', '3', '通讯费', '云南省电信手机固话宽带代缴费', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000703', '871', '000703', '3', '通讯费', '云南省移动通讯费', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004901', '898', '004901', '7', '有线电视费', '海南省有线电视费代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004903', '898', '004903', '3', '通讯费', '海南省联通通讯费', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004905', '898', '004905', '3', '通讯费', '海南省电信手机费代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004906', '898', '004906', '3', '通讯费', '海南省电信固定话费代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004909', '898', '004909', '2', '燃气费', '海口市民生管道燃气费代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004911', '898', '004911', '3', '通讯费', '海南省电信宽带代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('991566101', '991', '566101', '3', '通讯费', '新疆联通代缴费（手机、固话）', '991');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '591', '000601', '3', '通讯费', '福建省移动话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '595', '000601', '3', '通讯费', '福建省移动话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '595', '001601', '3', '通讯费', '福建省联通话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '596', '000601', '3', '通讯费', '福建省移动话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '596', '001601', '3', '通讯费', '福建省联通话费代缴', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001301', '451', '001301', '0', '电费', '缴纳哈市电费', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001606', '451', '001606', '7', '有线电视费', '哈尔滨有线电视费代缴', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004501', '898', '004501', '2', '燃气费', '出租车燃气IC卡充值', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004902', '898', '004902', '3', '通讯费', '海南省移动手机费代缴', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000802', '555', '000802', '7', '有线电视费', '马鞍山有线电视费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001202', '555', '001202', '2', '燃气费', '马鞍山市港华燃气费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001702', '555', '001702', '3', '通讯费', '马鞍山电信通讯费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574200014', '574', '200014', '1', '水费', '余姚水费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574200035', '574', '200035', '1', '水费', '姚西北水费', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000002', '053', '000002', '3', '通讯费', '青岛市移动预付费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000003', '053', '000003', '3', '通讯费', '青岛市移动后付费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000004', '053', '000004', '3', '通讯费', '青岛市联通代缴费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000005', '053', '000005', '3', '通讯费', '青岛市网通后付费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000006', '053', '000006', '7', '有线电视费', '青岛市有线电视费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000007', '053', '000007', '9', '其他', '青岛市公用事业便民卡充值', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000008', '053', '000008', '3', '通讯费', '青岛市电信代缴后付费', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532001301', '053', '001301', '0', '电费', '青岛市电费代缴', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006051', '021', '006051', '3', '通讯费', '上海市电信(分账序号)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006052', '021', '006052', '3', '通讯费', '上海市移动(手机号)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006056', '021', '006056', '0', '电费', '上海市电费(户号)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009005', '021', '009005', '3', '通讯费', '网通代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009008', '021', '009008', '1', '水费', '浦东威立雅自来水代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009016', '021', '009016', '2', '燃气费', '浦东燃气代缴', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064101', '755', '064101', '4', '加油卡', '深圳中石化加油卡充值', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064110', '755', '064111', '3', '通讯费', '深圳市联通手机费用代缴', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006816', '512', '006816', '3', '通讯费', '苏州市移动预付费充值', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006817', '512', '006817', '3', '通讯费', '苏州市电信预付费充值', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006818', '512', '006818', '3', '通讯费', '苏州市联通预付费充值', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351000701', '035', '000701', '3', '通讯费', '太原联通固话代缴', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351001101', '035', '001101', '1', '水费', '太原市自来水', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351004203', '035', '004203', '3', '通讯费', '太原联通手机代缴', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351004204', '035', '004204', '3', '通讯费', '山西省电信CDMA手机代缴', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022001601', '022', '005281', '3', '通讯费', '天津移动话费代缴', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000101', '553', '000101', '1', '水费', '芜湖市自来水代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001301', '553', '001301', '0', '电费', '合肥市电费代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551045101', '553', '045101', '2', '燃气费', '芜湖市燃气代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551091101', '553', '091101', '7', '有线电视费', '芜湖市中广有线代收费', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029001601', '029', '01601', '3', '通讯费', '西安移动电话费代收', '029');
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(insert feeitem_tmp完成) *****' from dual;
----------------------------------------------------------------------------------------------------
insert into ibs_ptab_feenum_tmp1 select * from ibs_ptab_feenum t1 where exists (select * from ibs_ptab_feeitem t2 where t1.city_id = t2.city_id and t1.item_no = t2.item_no);
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(从feenum到feenum_tmp去掉已经没有对应的项目的数据完成) *****' from dual;
update ibs_ptab_feenum_tmp1 t set t.NUM_ID2='' 
where (t.item_no='006051' and t.type_id='002' and t.city_id='021') 
or (t.item_no='006052' and t.type_id='002' and t.city_id='021') 
or (t.item_no='000005' and t.type_id='002' and t.city_id='053') 
or (t.item_no='000004' and t.type_id='002' and t.city_id='053') 
or (t.item_no='000003' and t.type_id='002' and t.city_id='053') 
or (t.item_no='000002' and t.type_id='002' and t.city_id='053') 
or (t.item_no='001301' and t.type_id='001' and t.city_id='053')
or (t.item_no='001101' and t.type_id='001' and t.city_id='001')
or (t.item_no='000101' and t.type_id='001' and t.city_id='871')
or (t.item_no='001606' and t.type_id='001' and t.city_id='451')
or (t.item_no='006803' and t.type_id='002' and t.city_id='512');
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(num_id2处理完成) *****' from dual;
update ibs_ptab_feenum_tmp1 t set t.NUM_ID3='' 
where (t.item_no='001606' and t.type_id='001' and t.city_id='451') ;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(num_id3处理完成) *****' from dual;
delete from ibs_ptab_feenum_tmp1 t
where (t.item_no='009002' and t.type_id='002' and t.city_id='021') 
or (t.item_no='009003' and t.type_id='002' and t.city_id='021') 
or (t.item_no='009001' and t.type_id='002' and t.city_id='021') 
or (t.item_no='009005' and t.type_id='002' and t.city_id='021') 
or (t.item_no='009004' and t.type_id='002' and t.city_id='021') 
or (t.item_no='009006' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009007' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009008' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009009' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009010' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009011' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009012' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009013' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009014' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009015' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009016' and t.type_id='001' and t.city_id='021') 
or (t.item_no='009017' and t.type_id='001' and t.city_id='021');
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(删除条形码完成) *****' from dual;
----------------------------------------------------------------------------------------------------
--delete from (select t1.user_id user_id,t2.cif_no cif_no from ibs_ptab_feenum_tmp1 t1 left join ibs_ptab_user t2 on t1.user_id=t2.user_id) b where b.cif_no is null;
--commit;
--select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(删除没有userid对应的cif_no的数据完成) *****' from dual;
----------------------------------------------------------------------------------------------------
update 
(
select t1.user_id user_id,t2.cif_no cif_no from ibs_ptab_feenum_tmp1 t1 ,ibs_ptab_user t2 where t1.user_id=t2.user_id
) 
set user_id=cif_no;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(更改userid为cifno完成) *****' from dual;
-------------------------------------------------------------------------------------------------------
insert into ibs_ptab_feenum_tmp
          (cif_no, chnlno, chnlinstno, trantime, busitypeflag, 
          billtype, cityid, numflag, usernum, phone, 
          billnum, usernum1, usernum2, usernum3, busitypename, 
          billtypename, remark, reserve1, reserve2
          )
  (
  select t1.user_id cif_no,
  '110' chnlno,
  '888000000000002' chnlinstno,
  SEQ_FEENUM_TMP.NEXTVAL trantime,
  '0' busitypeflag, 
  t2.billbusitype billtype, 
   t2.feecity_id cityid,
   '1' numflag,      
  t1.NUM_ID1 usernum,
  t1.CONTRACT_NO phone,
  t2.billnum billnum,
  t1.NUM_ID1 usernum1,
  t1.NUM_ID2 usernum2,
  t1.NUM_ID3 usernum3,
  t2.paraname busitypename,
  t2.billtypename billtypename,
  '' remark,
  '' reserve1,
  '' reserve2 
  from ibs_ptab_feenum_tmp1 t1 left join ibs_ptab_feeitem_tmp t2 on t1.city_id=t2.city_id and t1.item_no=t2.item_no 
  );
commit;
 select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(插入对公常用号码完成) *****' from dual; 
 ----------------------------------------------------------------------------------------------------
 update ibs_ptab_feenum_tmp t set t.chnlno='111',t.chnlinstno='888000000000001' where  exists (select t1.user_id from ibs_ptab_user t1 where t.cif_no=t1.cif_no);
 commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(更新对私常用号码) *****' from dual;
  ----------------------------------------------------------------------------------------------------
delete from ibs_ptab_feenum_tmp   where billnum='551001602' and usernum not in('1','2','3','4','5') ;
delete from ibs_ptab_feenum_tmp   where billnum='371001701' and usernum not in('1','2','3','4','5') ;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(删除完成) *****' from dual;
commit;
update ibs_ptab_feenum_tmp  set numflag='2', usernum=usernum2 where billnum='551001602' ;
update ibs_ptab_feenum_tmp  set numflag='2', usernum=usernum2 where billnum='371001701' ;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP处理开始(更改主号码标识和主号码完成) *****' from dual;
spool off


 
spool /backup/batchdir/anbmx/ibs_ptab_feenum.tmp
set trimspool on
select cif_no||'|+|'||chnlno||'|+|'||chnlinstno||'|+|'||trantime||'|+|'||busitypeflag||'|+|'||billtype||'|+|'||cityid||'|+|'||numflag||'|+|'||usernum||'|+|'||phone||'|+|'||billnum||'|+|'||usernum1||'|+|'||usernum2||'|+|'||usernum3||'|+|'||busitypename||'|+|'||billtypename||'|+|'||remark||'|+|'||reserve1||'|+|'||reserve2||'|+|' from ibs_ptab_feenum_tmp  order by billtype;
spool off
exit