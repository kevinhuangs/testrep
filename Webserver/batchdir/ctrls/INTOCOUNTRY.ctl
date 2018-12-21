LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_COUNTRYINFO_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  COUNTRYCODE          char(2),
  COUNTRYNAMEEN        char(40),
  COUNTRYNAMECN        char(40),
  CURRENCYISO          char(3),
  CURRENCYEN           char(40),
  CURRENCYXL           char(3),
  STATUS               char(1)
)