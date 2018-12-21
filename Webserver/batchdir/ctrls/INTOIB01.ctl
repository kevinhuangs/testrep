LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_ETAB_SUPER_AC_TEMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  PROTOCALNO           char(62),
  CIFNO                char(20),
  AC_AUTHORTYPE        char(1),
  AC_NO2               char(30),
  AC_NO                char(30),
  AC_NAME              char(100),
  AC_TYPE              char(4),
  AC_OPENBANKNO        char(64),
  AC_OPENBANKF         char(150),
  AC_CURRENCY          char(3),
  AC_BUSSINESSNO       char(5),
  AC_EFFECTIVEDATE     Date 'YYYYMMDD',
  AC_EXPIRYDATE        Date 'YYYYMMDD',
  AC_SINGLEAMOUNTLIMIT INTEGER EXTERNAL,
  AC_DATENUMLIMIT      INTEGER EXTERNAL,
  AC_DATEAMOUNTLIMIT   INTEGER EXTERNAL,
  AC_MONTHNUMLIMIT     INTEGER EXTERNAL,
  AC_MONTHAMOUNTLIMIT  INTEGER EXTERNAL,
  AC_NAME2             char(38),
  AC_OPENBANKNAME2     char(19),
  AC_OPENBANK2         char(16)  
)