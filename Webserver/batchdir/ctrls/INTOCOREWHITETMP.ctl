LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_BTAB_COREWHITE_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
FUND_CODE               char(13),
DIRECT_FLAG             char(1),
END_DATE                DATE 'YYYYMMDD',
CIF_NO                  char(10),
CIF_TYPE                char(1), 
AC_NO                   char(21)
)