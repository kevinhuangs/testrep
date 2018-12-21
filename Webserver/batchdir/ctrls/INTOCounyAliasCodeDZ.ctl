LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_COUNYALIASCODEDZ_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
  GUOBDM  char(3),
  GUOJDM  char(3),
  GUOBJM  char(2),
  SUSHGJ  char(40),
  GUOJQC  char(34),
  DAZHOU  char(12),
  SUSDDM  char(6),
  SUSUDQ  char(40),
  SHJNCH  char(16),
  JILUZT  char(1)  
)
