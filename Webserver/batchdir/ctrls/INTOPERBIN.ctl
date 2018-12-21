LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_UNIONPAY_BIN_TMP
TRUNCATE
(  
ISSUER_CODE       position(1:11),
ISSUER_NAME       position(*+1)CHAR(30),
CARDNO_LEN        position(*+1)CHAR(2),
BIN_NUM           position(*+1)CHAR(12),
CUPLOGO_FLAG      position(*+1)CHAR(1),
DEBITCREDIT_FLAG  position(*+1)CHAR(1),
ADDDELETE_STAT    position(*+1)CHAR(1)
)