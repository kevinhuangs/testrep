LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_CJ_AUTH_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
Batch_Num      Char(20),
Mer_No         Char(15)
)
