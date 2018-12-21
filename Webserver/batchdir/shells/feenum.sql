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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(drop table���) *****' from dual;
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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(creat table���) *****' from dual;
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000301', '023', '000301', '0', '���', '�����е��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000601', '023', '000601', '3', 'ͨѶ��', '�������ƶ��ֻ���', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023004201', '023', '004201', '3', 'ͨѶ��', '������ͨͨѶ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023004901', '023', '004901', '7', '���ߵ��ӷ�', '�������ߵ��Ӵ��ɷ�', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001602', '025', '001602', '3', 'ͨѶ��', '����ʡ�ƶ�ͨѶ�ѣ��󸶷ѣ�', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001101', '028', '001101', '1', 'ˮ��', '�ɶ�������ˮ��', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001201', '028', '001201', '2', 'ȼ����', '�ɶ���ú����', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001301', '028', '001301', '0', '���', '�ɶ��е��', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001601', '028', '001601', '3', 'ͨѶ��', '�ɶ����ƶ�ͨѶ��', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001701', '028', '001701', '3', 'ͨѶ��', '�Ĵ����Ź̻�', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001702', '028', '001702', '3', 'ͨѶ��', '�ɶ��е���С��ͨ', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001703', '028', '001703', '3', 'ͨѶ��', '�ɶ��е��Ž���ͨ', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001704', '028', '001704', '3', 'ͨѶ��', '�ɶ��е���ADSL', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001705', '028', '001705', '3', 'ͨѶ��', '�ɶ��е����������', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('028001706', '028', '001706', '3', 'ͨѶ��', '�ɶ��е���C������', '028');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006804', '512', '006804', '1', 'ˮ��', '����������ˮ�Ѵ���', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006805', '512', '006805', '1', 'ˮ��', '����������ˮ�Ѵ���', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006806', '512', '006806', '1', 'ˮ��', '�����������ˮ�Ѵ���', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000001', '574', '000001', '3', 'ͨѶ��', '��������ͨ��ֵ', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000002', '574', '000002', '3', 'ͨѶ��', '�㽭ʡ�ƶ���ֵ', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000008', '574', '000008', '1', 'ˮ��', '��������ɽ��ˮ�Ѵ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000024', '574', '000024', '1', 'ˮ��', '��Ҧ��ˮ�Ѵ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001601', '771', '001601', '3', 'ͨѶ��', '�����ƶ��ֻ��Ѵ���', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771004201', '771', '004201', '3', 'ͨѶ��', '������ͨ���Ѵ���', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010000201', '001', '000201', '2', 'ȼ����', '������ȼ����', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010000701', '001', '000701', '3', 'ͨѶ��', '�����е���ͨѶ�Ѵ���', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001101', '001', '001101', '1', 'ˮ��', '��������ˮ�Ѵ���', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001301', '001', '001301', '0', '���', '�������������', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001601', '001', '001601', '3', 'ͨѶ��', '�����ƶ��ֻ��ɷ�', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010001701', '001', '001701', '3', 'ͨѶ��', '��������ͨͨѶ�Ѵ���', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('010010701', '001', '010701', '9', '����', '�����й�ů�Ѵ���', '010');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068202', '731', '068202', '3', 'ͨѶ��', '�����ƶ����Ѵ���', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068203', '731', '068203', '3', 'ͨѶ��', '������ͨ���Ѵ���', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068204', '731', '068204', '3', 'ͨѶ��', '���ϵ��Ż��Ѵ���', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731069010', '731', '069010', '3', 'ͨѶ��', 'ȫ���ƶ��ֻ���ֵ', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000701', '023', '000701', '3', 'ͨѶ��', '������Ż��Ѵ���', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000101', '023', '001101', '1', 'ˮ��', '�����з���ˮˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222001', '411', '222001', '9', '����', '�����������շѴ���', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411041102', '411', '222002', '3', 'ͨѶ��', '�������ƶ����Ѵ���', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222003', '411', '222003', '3', 'ͨѶ��', '��������ͨ�̻��Ѵ���', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222004', '411', '222004', '3', 'ͨѶ��', '��ͨ�ֻ����Ѵ���', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('411222005', '411', '222005', '3', 'ͨѶ��', '�����ֻ����Ѵ���', '411');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001607', '459', '001607', '3', 'ͨѶ��', '���ɴ�����ͨ����', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001608', '459', '001608', '3', 'ͨѶ��', '������ʡ�ƶ��ֻ�', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009001', '021', '009001', '3', 'ͨѶ��', '�Ϻ��е���ͨѶ�Ѵ���', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009002', '021', '009002', '3', 'ͨѶ��', '�Ϻ����ƶ��ֻ�����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009003', '021', '009003', '3', 'ͨѶ��', '�Ϻ�����ͨ�ֻ�����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009004', '021', '009004', '3', 'ͨѶ��', '��ͨ���ŷѴ���', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009006', '021', '009006', '0', '���', '�Ϻ��е�Ѵ���', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009007', '021', '009007', '1', 'ˮ��', '�Ϻ����б�/����������ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009009', '021', '009009', '1', 'ˮ��', '�Ϻ�����������ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009010', '021', '009010', '1', 'ˮ��', '�Ϻ�����������ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009011', '021', '009011', '1', 'ˮ��', '�Ϻ�����������ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009012', '021', '009012', '1', 'ˮ��', '�Ϻ��н�ɽ����ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009013', '021', '009013', '1', 'ˮ��', '�Ϻ��мζ�����ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009014', '021', '009014', '2', 'ȼ����', '�Ϻ�����ȼ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009015', '021', '009015', '2', 'ȼ����', '�Ϻ���ȼ���Ѵ���', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009017', '021', '009017', '7', '���ߵ��ӷ�', '�������ߴ���', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022000601', '022', '000601', '3', 'ͨѶ��', '����е���ͨ�ŷ��ô���', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022000701', '022', '000701', '3', 'ͨѶ��', '�����ͨ���Ѵ���', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000102', '023', '000102', '1', 'ˮ��', '����������ˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000103', '023', '000103', '1', 'ˮ��', '�����ж��ι�ˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000104', '023', '000104', '1', 'ˮ��', '�����кϴ���ˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000105', '023', '000105', '1', 'ˮ��', '�����������涴ˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('023000106', '023', '000106', '1', 'ˮ��', '�����а��ϵ���ˮ��', '023');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024000101', '024', '000101', '1', 'ˮ��', '������ˮ�Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024000601', '024', '000601', '3', 'ͨѶ��', '�����е����ֻ����Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001101', '024', '001101', '1', 'ˮ��', '����ʤ��ˮ����ʿ��������ˮ��', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001201', '024', '001201', '2', 'ȼ����', '������ú���Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001301', '024', '001301', '0', '���', '�����е�Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001601', '024', '001601', '3', 'ͨѶ��', '��������ͨ�ֻ��Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024001701', '024', '001701', '3', 'ͨѶ��', '��������ͨ�̶����Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('024052401', '024', '052401', '3', 'ͨѶ��', '�������ƶ��ֻ��Ѵ���', '024');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000101', '025', '000101', '1', 'ˮ��', '�Ͼ���ˮ�Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000301', '025', '000301', '0', '���', '�Ͼ��е�Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000701', '025', '000701', '3', 'ͨѶ��', '�Ͼ��е��Ź̻��Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025000702', '025', '000702', '3', 'ͨѶ��', '�Ͼ��е����ֻ��Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001201', '025', '001201', '2', 'ȼ����', '�Ͼ���ú���Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025001601', '025', '001601', '3', 'ͨѶ��', '����ʡ�ƶ�ͨѶ�ѣ�Ԥ���ѣ�', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('025004201', '025', '004201', '3', 'ͨѶ��', '�Ͼ�����ͨ���Ѵ���', '025');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027000101', '027', '000101', '1', 'ˮ��', '�人��ˮ�Ѵ���', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027000301', '027', '000301', '0', '���', '�人�е�Ѵ���', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027001601', '027', '001601', '3', 'ͨѶ��', '�人���ƶ��ֻ��Ѵ���', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027001701', '027', '001701', '3', 'ͨѶ��', '�人�е��Ŵ���', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('027004201', '027', '004201', '3', 'ͨѶ��', '�人����ͨ�ֻ��Ѵ���', '027');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029001701', '029', '001701', '3', 'ͨѶ��', '�������ŵ绰�Ѵ���', '029');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029004201', '029', '004201', '3', 'ͨѶ��', '������ͨ�绰�Ѵ���', '029');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('311001201', '311', '001201', '2', 'ȼ����', 'ʯ��ׯ��ȼ���Ѵ���', '311');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371000501', '371', '000501', '9', '����', '֣����ҽ���Ѵ���', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001201', '371', '001201', '2', 'ȼ����', '֣����ȼ����Ȼ���Ѵ���', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001601', '371', '001601', '3', 'ͨѶ��', '�����ƶ��绰�Ѵ���', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('371001701', '371', '001701', '3', 'ͨѶ��', '����ʡ��ͨͨѶ��', '371');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001201', '415', '001201', '3', 'ͨѶ��', '���������ֻ��Ѵ���', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001301', '415', '001301', '0', '���', '�����е�Ѵ���', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415001702', '415', '001702', '3', 'ͨѶ��', '������ͨ�̻��Ѵ���', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415004201', '415', '004201', '3', 'ͨѶ��', '������ͨ�ֻ��Ѵ���', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('415052402', '415', '052402', '3', 'ͨѶ��', '�����ƶ��ֻ��Ѵ���', '415');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431000601', '431', '000601', '3', 'ͨѶ��', '��������CDMA�ֻ����Ѵ���', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431001301', '431', '001301', '0', '���', '����ʡ�������ɷǿ����û����', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('431004201', '431', '004201', '3', 'ͨѶ��', '������ͨ�ֻ����Ѵ���', '431');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001601', '451', '001601', '3', 'ͨѶ��', '��������ͨͨѶ��', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001604', '451', '001604', '2', 'ȼ����', '������ȼ���Ѵ���', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001605', '451', '001605', '3', 'ͨѶ��', '���������Ŵ���', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001608', '451', '001608', '3', 'ͨѶ��', '������ʡ�ƶ��ֻ�', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001609', '451', '001609', '1', 'ˮ��', '������ˮ�Ѵ���', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('471000701', '471', '000701', '3', 'ͨѶ��', '���ɹŵ���ͨѶ��', '471');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('471001601', '471', '001601', '3', 'ͨѶ��', '���ɹ��ƶ�ͨѶ�Ѵ���', '471');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001708', '510', '001708', '3', 'ͨѶ��', '�����е��Ŵ��ɷ�', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001709', '510', '001709', '3', 'ͨѶ��', '�������ƶ�ͨѶ��', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('510001710', '510', '001710', '3', 'ͨѶ��', '��������ͨͨѶ��', '510');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006801', '512', '006801', '3', 'ͨѶ��', '�������ƶ��󸶷Ѵ���', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006802', '512', '006802', '3', 'ͨѶ��', '�����е���ͨѶ��', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006803', '512', '006803', '3', 'ͨѶ��', '��������ͨͨѶ��', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006819', '512', '006819', '7', '���ߵ��ӷ�', '���������ߵ��ӷѳ�ֵ', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531000701', '531', '000701', '3', 'ͨѶ��', '�����е��Ŵ��ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001101', '531', '001101', '1', 'ˮ��', '��������ˮ���ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001301', '531', '001301', '0', '���', '���ϵ������ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001601', '531', '001601', '3', 'ͨѶ��', '�������ƶ����ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531001701', '531', '001701', '3', 'ͨѶ��', '��������ͨ���̻������ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531002601', '531', '002601', '3', 'ͨѶ��', '��������ͨ�ֻ����ɷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('531004901', '531', '004901', '7', '���ߵ��ӷ�', '���������ߵ��ӷ�', '531');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535515201', '535', '515201', '3', 'ͨѶ��', '��̨����ͨ�̻����ɷ�', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535519201', '535', '519201', '0', '���', '��̨�е������շ�', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('535716101', '535', '716101', '7', '���ߵ��ӷ�', '��̨�����ߵ��ӷ�', '535');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000801', '551', '000801', '7', '���ߵ��ӷ�', '�Ϸ����ߵ��Ӵ��շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000803', '551', '000803', '7', '���ߵ��ӷ�', '���������������ֵ��ӷ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001101', '551', '001101', '1', 'ˮ��', '�Ϸ���ˮ�Ѵ��շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001201', '551', '001201', '2', 'ȼ����', '�Ϸ���ȼ���ɷ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001301', '551', '001301', '0', '���', '�Ϸ��е�Ѵ��շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001602', '551', '001602', '3', 'ͨѶ��', '����ʡ�ƶ�ͨѶ��', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001701', '551', '001701', '3', 'ͨѶ��', '�Ϸʵ��Ż��Ѵ���', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551004202', '551', '004202', '3', 'ͨѶ��', '����ʡ��ͨͨѶ��', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068273', '571', '068273', '2', 'ȼ����', '������ȼ���Ѵ���', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068276', '571', '068276', '3', 'ͨѶ��', '�㽭��ͨ��ֵ�ɷ�', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068278', '571', '068278', '3', 'ͨѶ��', '�㽭���Ź̻��ɷ�', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('571068279', '571', '068279', '3', 'ͨѶ��', '�㽭���ſ���ɷ�', '571');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000007', '574', '000007', '1', 'ˮ��', '���ˮ�Ѵ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574000009', '574', '000009', '1', 'ˮ��', '������������ˮ�Ѵ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574020001', '574', '020001', '3', 'ͨѶ��', '��������ͨѶ�󸶷�', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574020002', '574', '020002', '3', 'ͨѶ��', '�����е����ֻ�Ԥ����', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574030001', '574', '030001', '1', 'ˮ��', '������ˮ�Ѵ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040001', '574', '040001', '0', '���', '�����к�����', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040002', '574', '040002', '0', '���', '�����н������', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040003', '574', '040003', '0', '���', '�����н������', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040004', '574', '040004', '0', '���', '������۴�ݵ��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040005', '574', '040005', '0', '���', '�������򺣵��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040006', '574', '040006', '0', '���', '�����б��ص��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040007', '574', '040007', '0', '���', '�����з���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040008', '574', '040008', '0', '���', '��������ɽ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040009', '574', '040009', '0', '���', '�������������', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040010', '574', '040010', '0', '���', '�����д�Ϫ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040011', '574', '040011', '0', '���', '��������Ҧ���', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574040012', '574', '040012', '0', '���', '�����к�����', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574050001', '574', '050001', '2', 'ȼ����', '�������˹�ȼ��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574090001', '574', '090001', '3', 'ͨѶ��', '��������ͨ�̻������', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000106', '591', '000106', '1', 'ˮ��', '��������ˮ��', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001301', '591', '001301', '0', '���', '����ʡ��Ѵ��ɣ��������У�', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '591', '001601', '3', 'ͨѶ��', '����ʡ��ͨ���Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001701', '591', '001701', '3', 'ͨѶ��', '�����е��Ż��Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513001', '592', '513001', '7', '���ߵ��ӷ�', '���������ߵ��ӷ�', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513002', '592', '513002', '3', 'ͨѶ��', '�����е���ͨѶ��', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('592513003', '592', '513003', '3', 'ͨѶ��', '�������ƶ�ͨѶ��', '592');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731068005', '731', '068005', '1', 'ˮ��', '��ɳ������ˮ�Ѵ���', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('731069011', '731', '069011', '1', 'ˮ��', '����ʡ������ˮ��', '731');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064102', '755', '064102', '3', 'ͨѶ��', '�����е����ֻ��̻�ADSL����', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064103', '755', '064103', '3', 'ͨѶ��', '�����е��Ŵ���Žɷ�', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064105', '755', '064105', '1', 'ˮ��', '������ˮ��', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001101', '771', '001101', '1', 'ˮ��', '�����̳�ˮ��ˮ�Ѵ���', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771001701', '771', '001701', '3', 'ͨѶ��', '�������Ż��ѿ���Ѵ���', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('771004901', '771', '004901', '7', '���ߵ��ӷ�', '�������������ӷ�', '771');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001601', '791', '001601', '3', 'ͨѶ��', '����ʡ�ƶ��ֻ���', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001602', '791', '001602', '3', 'ͨѶ��', '����ʡ��ͨͨѶ��', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001603', '791', '001603', '3', 'ͨѶ��', '�ϲ��е��Ż���', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001604', '791', '001604', '1', 'ˮ��', '�ϲ����ˮ�Ѵ���', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001605', '791', '001605', '0', '���', '����ʡ���', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('791001606', '791', '001606', '3', 'ͨѶ��', '�ϲ��е��ſ����', '791');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000101', '871', '000101', '1', 'ˮ��', '����������ˮ��', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000201', '871', '000201', '2', 'ȼ����', '������ȼ����', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000301', '871', '000301', '0', '���', '�����е�Ѵ���', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000701', '871', '000701', '3', 'ͨѶ��', '����ʡ��ͨ���շ�', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000702', '871', '000702', '3', 'ͨѶ��', '����ʡ�����ֻ��̻�������ɷ�', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('871000703', '871', '000703', '3', 'ͨѶ��', '����ʡ�ƶ�ͨѶ��', '871');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004901', '898', '004901', '7', '���ߵ��ӷ�', '����ʡ���ߵ��ӷѴ���', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004903', '898', '004903', '3', 'ͨѶ��', '����ʡ��ͨͨѶ��', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004905', '898', '004905', '3', 'ͨѶ��', '����ʡ�����ֻ��Ѵ���', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004906', '898', '004906', '3', 'ͨѶ��', '����ʡ���Ź̶����Ѵ���', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004909', '898', '004909', '2', 'ȼ����', '�����������ܵ�ȼ���Ѵ���', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004911', '898', '004911', '3', 'ͨѶ��', '����ʡ���ſ������', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('991566101', '991', '566101', '3', 'ͨѶ��', '�½���ͨ���ɷѣ��ֻ����̻���', '991');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '591', '000601', '3', 'ͨѶ��', '����ʡ�ƶ����Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '595', '000601', '3', 'ͨѶ��', '����ʡ�ƶ����Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '595', '001601', '3', 'ͨѶ��', '����ʡ��ͨ���Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591000601', '596', '000601', '3', 'ͨѶ��', '����ʡ�ƶ����Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('591001601', '596', '001601', '3', 'ͨѶ��', '����ʡ��ͨ���Ѵ���', '591');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001301', '451', '001301', '0', '���', '���ɹ��е��', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('451001606', '451', '001606', '7', '���ߵ��ӷ�', '���������ߵ��ӷѴ���', '451');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004501', '898', '004501', '2', 'ȼ����', '���⳵ȼ��IC����ֵ', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('898004902', '898', '004902', '3', 'ͨѶ��', '����ʡ�ƶ��ֻ��Ѵ���', '898');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000802', '555', '000802', '7', '���ߵ��ӷ�', '��ɽ���ߵ��ӷ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001202', '555', '001202', '2', 'ȼ����', '��ɽ�иۻ�ȼ����', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001702', '555', '001702', '3', 'ͨѶ��', '��ɽ����ͨѶ��', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574200014', '574', '200014', '1', 'ˮ��', '��Ҧˮ��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('574200035', '574', '200035', '1', 'ˮ��', 'Ҧ����ˮ��', '574');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000002', '053', '000002', '3', 'ͨѶ��', '�ൺ���ƶ�Ԥ����', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000003', '053', '000003', '3', 'ͨѶ��', '�ൺ���ƶ��󸶷�', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000004', '053', '000004', '3', 'ͨѶ��', '�ൺ����ͨ���ɷ�', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000005', '053', '000005', '3', 'ͨѶ��', '�ൺ����ͨ�󸶷�', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000006', '053', '000006', '7', '���ߵ��ӷ�', '�ൺ�����ߵ��ӷ�', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000007', '053', '000007', '9', '����', '�ൺ�й�����ҵ���񿨳�ֵ', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532000008', '053', '000008', '3', 'ͨѶ��', '�ൺ�е��Ŵ��ɺ󸶷�', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('532001301', '053', '001301', '0', '���', '�ൺ�е�Ѵ���', '532');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006051', '021', '006051', '3', 'ͨѶ��', '�Ϻ��е���(�������)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006052', '021', '006052', '3', 'ͨѶ��', '�Ϻ����ƶ�(�ֻ���)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021006056', '021', '006056', '0', '���', '�Ϻ��е��(����)', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009005', '021', '009005', '3', 'ͨѶ��', '��ͨ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009008', '021', '009008', '1', 'ˮ��', '�ֶ�����������ˮ����', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('021009016', '021', '009016', '2', 'ȼ����', '�ֶ�ȼ������', '021');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064101', '755', '064101', '4', '���Ϳ�', '������ʯ�����Ϳ���ֵ', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('755064110', '755', '064111', '3', 'ͨѶ��', '��������ͨ�ֻ����ô���', '755');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006816', '512', '006816', '3', 'ͨѶ��', '�������ƶ�Ԥ���ѳ�ֵ', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006817', '512', '006817', '3', 'ͨѶ��', '�����е���Ԥ���ѳ�ֵ', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('512006818', '512', '006818', '3', 'ͨѶ��', '��������ͨԤ���ѳ�ֵ', '512');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351000701', '035', '000701', '3', 'ͨѶ��', '̫ԭ��ͨ�̻�����', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351001101', '035', '001101', '1', 'ˮ��', '̫ԭ������ˮ', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351004203', '035', '004203', '3', 'ͨѶ��', '̫ԭ��ͨ�ֻ�����', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('351004204', '035', '004204', '3', 'ͨѶ��', 'ɽ��ʡ����CDMA�ֻ�����', '351');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('022001601', '022', '005281', '3', 'ͨѶ��', '����ƶ����Ѵ���', '022');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551000101', '553', '000101', '1', 'ˮ��', '�ߺ�������ˮ���շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551001301', '553', '001301', '0', '���', '�Ϸ��е�Ѵ��շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551045101', '553', '045101', '2', 'ȼ����', '�ߺ���ȼ�����շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('551091101', '553', '091101', '7', '���ߵ��ӷ�', '�ߺ����й����ߴ��շ�', '551');
insert into ibs_ptab_feeitem_tmp (BILLNUM, CITY_ID, ITEM_NO, BILLBUSITYPE, PARANAME, BILLTYPENAME, FEECITY_ID)values ('029001601', '029', '01601', '3', 'ͨѶ��', '�����ƶ��绰�Ѵ���', '029');
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(insert feeitem_tmp���) *****' from dual;
----------------------------------------------------------------------------------------------------
insert into ibs_ptab_feenum_tmp1 select * from ibs_ptab_feenum t1 where exists (select * from ibs_ptab_feeitem t2 where t1.city_id = t2.city_id and t1.item_no = t2.item_no);
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(��feenum��feenum_tmpȥ���Ѿ�û�ж�Ӧ����Ŀ���������) *****' from dual;
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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(num_id2�������) *****' from dual;
update ibs_ptab_feenum_tmp1 t set t.NUM_ID3='' 
where (t.item_no='001606' and t.type_id='001' and t.city_id='451') ;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(num_id3�������) *****' from dual;
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
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(ɾ�����������) *****' from dual;
----------------------------------------------------------------------------------------------------
--delete from (select t1.user_id user_id,t2.cif_no cif_no from ibs_ptab_feenum_tmp1 t1 left join ibs_ptab_user t2 on t1.user_id=t2.user_id) b where b.cif_no is null;
--commit;
--select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(ɾ��û��userid��Ӧ��cif_no���������) *****' from dual;
----------------------------------------------------------------------------------------------------
update 
(
select t1.user_id user_id,t2.cif_no cif_no from ibs_ptab_feenum_tmp1 t1 ,ibs_ptab_user t2 where t1.user_id=t2.user_id
) 
set user_id=cif_no;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(����useridΪcifno���) *****' from dual;
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
 select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(����Թ����ú������) *****' from dual; 
 ----------------------------------------------------------------------------------------------------
 update ibs_ptab_feenum_tmp t set t.chnlno='111',t.chnlinstno='888000000000001' where  exists (select t1.user_id from ibs_ptab_user t1 where t.cif_no=t1.cif_no);
 commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(���¶�˽���ú���) *****' from dual;
  ----------------------------------------------------------------------------------------------------
delete from ibs_ptab_feenum_tmp   where billnum='551001602' and usernum not in('1','2','3','4','5') ;
delete from ibs_ptab_feenum_tmp   where billnum='371001701' and usernum not in('1','2','3','4','5') ;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(ɾ�����) *****' from dual;
commit;
update ibs_ptab_feenum_tmp  set numflag='2', usernum=usernum2 where billnum='551001602' ;
update ibs_ptab_feenum_tmp  set numflag='2', usernum=usernum2 where billnum='371001701' ;
commit;
select '*****'||to_char(sysdate,'yyyyMMdd hh24:mi:ss')||' STEP����ʼ(�����������ʶ�����������) *****' from dual;
spool off


 
spool /backup/batchdir/anbmx/ibs_ptab_feenum.tmp
set trimspool on
select cif_no||'|+|'||chnlno||'|+|'||chnlinstno||'|+|'||trantime||'|+|'||busitypeflag||'|+|'||billtype||'|+|'||cityid||'|+|'||numflag||'|+|'||usernum||'|+|'||phone||'|+|'||billnum||'|+|'||usernum1||'|+|'||usernum2||'|+|'||usernum3||'|+|'||busitypename||'|+|'||billtypename||'|+|'||remark||'|+|'||reserve1||'|+|'||reserve2||'|+|' from ibs_ptab_feenum_tmp  order by billtype;
spool off
exit