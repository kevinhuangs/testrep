LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_TAB_ORGANAREAREF_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  ORGAN_ID          char(4),
  AREA_ID        	char(4),
  AREA_SUPERNO      char(4),
  AREA_SUPERNAME    char(20),
  STATUS            char(1)
)