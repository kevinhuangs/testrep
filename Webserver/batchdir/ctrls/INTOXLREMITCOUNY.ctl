LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_XLREMITCOUNYINFO_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  COUNTRYCODE          char(2),
  CURRENCYCODE         char(3),
  COUNTRYNAME          char(40),
  BANKNO               char(10),
  CONTENT              char(60),
  SHJNCH               char(16),
  STATUS               char(1)
)