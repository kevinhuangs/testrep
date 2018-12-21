--IBS_ETAB_CIF
create index IDX_ETABCIF_CLOSEDATE on IBS_ETAB_CIF (CIF_CLOSEDATE);
create index IDX_ETABCIF_OPENDATE on IBS_ETAB_CIF (CIF_OPENDATE);
create index IDX_ETABCIF_ORGANID on IBS_ETAB_CIF (ORGAN_ID);

--XIE4IBS_PTAB_JNL_FUND
create index XIE4IBS_PTAB_JNL_FUND on IBS_PTAB_JNL_FUND(JNL_DATE);

--IBS_PTAB_JNL_TRANSFER、IBS_PTAB_JNL_C2F、IBS_PTAB_JNL_F2C
create index PTABJNL_TRANSFER_INDEX on IBS_PTAB_JNL_TRANSFER (JNL_DATE);
create index PTABJNL_C2F_INDEX on IBS_PTAB_JNL_C2F (JNL_DATE);
create index PTABJNL_F2C_INDEX on IBS_PTAB_JNL_F2C (JNL_DATE);

--IBS_PTAB_JNL_EPAY
create index IDX_PTABJNLEPAY_DATE on IBS_PTAB_JNL_EPAY (JNL_DATE);

--insertAllStatDay
create index idx_batch_query_date on IBS_PTAB_JNLQUERYCOUNT(JNLDATE);
create index idx_batch_query_trscode on IBS_PTAB_JNLQUERYCOUNT(TRANSCODE);
create index idx_batch_trans_date on IBS_PTAB_BATCH_TRANSCOUNT(TRANS_DATE);
create index idx_batch_exch_date on IBS_PTAB_BATCH_EXCHCOUNT(TRANS_DATE);
create index idx_batch_fund_date on IBS_PTAB_BATCH_FUNDCOUNT(TRANS_DATE);
create index idx_batch_LOAN_date on IBS_PTAB_BATCH_LOANCOUNT(TRANS_DATE);
create index idx_batch_STOCK_date on IBS_PTAB_BATCH_STOCKCOUNT(TRANS_DATE);
create index idx_batch_supervise_date on IBS_PTAB_BATCH_SUPERVISECOUNT(TRANS_DATE);
create index idx_batch_donate_date on IBS_PTAB_BATCH_DONATECOUNT(TRANS_DATE);
create index idx_batch_fee_date on IBS_PTAB_BATCH_FEECOUNT(TRANS_DATE);
create index idx_batch_fin_date on IBS_PTAB_BATCH_FINCOUNT(TRANS_DATE);
create index idx_batch_points_organid on IBS_PTAB_BATCH_POINTSCOUNT(ORGAN_ID);
create index idx_batch_points_date on IBS_PTAB_BATCH_POINTSCOUNT(TRANS_DATE);
create index idx_batch_epay_date on IBS_PTAB_BATCH_EPAYCOUNT(TRANS_DATE);
create index xie4ibs_ptab_jnl_creditpay on IBS_PTAB_JNL_CREDITPAY(JNL_DATE);


-- Create table
create table IBS_PTAB_USER_JNL
(
  USER_ID            VARCHAR2(10) not null,
  USER_LOGINNAME     VARCHAR2(20) not null,
  CIF_NO             VARCHAR2(10) not null,
  USER_TYPE          CHAR(1) not null,
  USER_PASSWORD      VARCHAR2(64) not null,
  USER_CERTNO        VARCHAR2(2),
  USER_ORGANID       VARCHAR2(4) not null,
  USER_OPENDATE      DATE not null,
  USER_STATUS        CHAR(1) not null,
  USER_LASTLOGIN     DATE,
  USER_LASTMODDATE   DATE,
  USER_TIPNOTE       VARCHAR2(64),
  USER_STYLE         CHAR(1),
  USER_LOGINTIME     NUMBER(10),
  USER_FAILLOGIN     NUMBER(10),
  USER_SETFLAG       CHAR(1),
  USER_TRANSFERFLAG  CHAR(1),
  USER_SOURCE        CHAR(1),
  USER_CERTSTORETYPE CHAR(1),
  USER_PROLOGINTIME  NUMBER(10),
  USER_TELNO4DYNAMIC VARCHAR2(20),
  USER_VERSIONSTATUS VARCHAR2(8),
  RECORD_TIME        DATE
);

create index PUSERJNL_RECORDDATE_INDEX on IBS_PTAB_USER_JNL (RECORD_TIME);
create index PUSERJNL_USERID_INDEX on IBS_PTAB_USER_JNL (USER_ID);





--trigger
CREATE OR REPLACE TRIGGER tri_user_version 　　
	BEFORE UPDATE OF user_versionstatus ON ibs_ptab_user 　　
	REFERENCING OLD AS old_value
                NEW AS new_value 　　
	FOR EACH ROW
BEGIN
    
    --如果客户当天做过版本变更，版本变化就不需要记录，因为当天的数据也会上送到数据仓库
    if trunc(:new_value.USER_LASTMODDATE,'dd') <> trunc(sysdate,'dd') then
    
     --一天之内做过多次开通关闭的只取最后一次操作状态
    delete from IBS_PTAB_USER_JNL where user_id=:new_value.USER_ID and trunc(RECORD_TIME,'dd')=trunc(sysdate,'dd');
    
    --插入更新之后的记录
    INSERT INTO IBS_PTAB_USER_JNL(
        USER_ID,
        USER_LOGINNAME,
        CIF_NO,
        USER_TYPE,
        USER_PASSWORD,
        USER_CERTNO,
        USER_ORGANID,
        USER_OPENDATE,
        USER_STATUS,
        USER_LASTLOGIN,
        USER_LASTMODDATE,
        USER_TIPNOTE,
        USER_STYLE,
        USER_LOGINTIME,
        USER_FAILLOGIN,
        USER_SETFLAG,
        USER_TRANSFERFLAG,
        USER_SOURCE,
        USER_CERTSTORETYPE,
        USER_PROLOGINTIME,
        USER_TELNO4DYNAMIC,
        USER_VERSIONSTATUS,
        RECORD_TIME)
    VALUES(
        :new_value.USER_ID,
        :new_value.USER_LOGINNAME,
        :new_value.CIF_NO,
        :new_value.USER_TYPE,
        :new_value.USER_PASSWORD,
        :new_value.USER_CERTNO,
        :new_value.USER_ORGANID,
        :new_value.USER_OPENDATE,
        :new_value.USER_STATUS,
        :new_value.USER_LASTLOGIN,
        :new_value.USER_LASTMODDATE,
        :new_value.USER_TIPNOTE,
        :new_value.USER_STYLE,
        :new_value.USER_LOGINTIME,
        :new_value.USER_FAILLOGIN,
        :new_value.USER_SETFLAG,
        :new_value.USER_TRANSFERFLAG,
        :new_value.USER_SOURCE,
        :new_value.USER_CERTSTORETYPE,
        :new_value.USER_PROLOGINTIME,
        :new_value.USER_TELNO4DYNAMIC,
        :new_value.USER_VERSIONSTATUS,
        trunc(sysdate,'mi'));
    end if;
    
END tri_user_version;
/

--

