LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_ETAB_MAGRLT_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
ENT_CIFNO	CHAR(10),
ENT_CIFNAME	CHAR(80),
TG_CIFNO	CHAR(10),
TG_CIFNAME	CHAR(80)
)