LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_TAB_FEE_PARAMETER_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
	PARACODE				CHAR(10),
	PARATYPE				CHAR(20),
	TYPEDESC				CHAR(200),
	PARAVALUE				CHAR(20),
	PARANAME				CHAR(100),
	ROLEID					CHAR(4),
	LASTUPDACCOUNT	CHAR(16),
	LASTUPDTIME			CHAR(16),
	FLAG						CHAR(1),
	REMARK1					CHAR(20),
	REMARK2					CHAR(20),
	REMARK3					CHAR(20),
	PARAID					CHAR(3),
	RESERVE1				CHAR(50),
	RESERVE2				CHAR(50),
	RESERVE3				CHAR(50),
	RESERVE4				CHAR(50),
	RESERVE5				CHAR(50)
)