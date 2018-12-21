LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_SWIFT_ORGANAUTH_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  ORAGN_ID              char(4),
  ORGAN_SUPERIOR        char(4),
  CURRENCY              char(2),
  RECEIVE_FLAG          char(1),
  SEND_FLAG             char(1),
  BANKSEND_ENDTIME      char(10),
  BANKAPPLY_ENDTIME     char(10),
  ORGNAPPLY_ENDTIME     char(10),
  THROUGH_BEGINTIME     char(10),
  HEADBANK_ENDTIME      char(10),
  CURRENCY_FLAG         char(10),
  VALUE_FALG            char(10),
  SETTLEACCOUNT_ENDTIME char(20),
  DIRECT_SIGNS          char(1),
  BAK_ACCOUNT           char(16),
  BAK_DATE              char(8),
  MESSAGE_STARTCONTROL  char(1),
  TIME_STAMP            char(16),
  RECORD_STATUS         char(1)
)