LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_BTAB_FUNDWHITE_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
CIF_NO                  char(20), 
CIF_TYPE                char(10),
FUND_CODE               char(6),
END_DATE                DATE 'YYYYMMDD',
AC_NO                   char(32)
)