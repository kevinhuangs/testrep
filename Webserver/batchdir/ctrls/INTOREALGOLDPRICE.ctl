LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_GOLDSALEPRICE_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
GSP_PRONO       char(20),
GSP_PRICE       char(21),
GSP_STANDARD    char(100),
GSP_SNAME       char(100),
GSP_TYPE		char(1)
)