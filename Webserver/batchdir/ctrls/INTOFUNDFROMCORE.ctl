LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_FINANCECODE_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
FUND_CODE                   char(24),
FINANCE_UNIONCODE           char(13),
FINANCE_UNIONNAME           char(80),
FINANCE_ROLLCODE            char(11),
FINANCE_ROLLTIME            char(2), 
FUND_NAME                   char(80),
FINANCE_TYPE                char(1), 
FINANCE_KIND                char(4), 
FINANCE_RATE                char(40),
FINANCE_LIMITDATE           char(3), 
FINANCE_CURRENCY            char(2), 
CASH_FLAG                   char(1), 
FINANCE_PROFIT_CURRENCY     char(2), 
FIRST_MINAMOUNT             char(17),
ADD_MINAMOUNT               char(17),
FIRST_BOOKMINAMOUNT         char(17),
BOOKED_MODEAMOUNT           char(17),
BOOKED_MINAMOUNT            char(17),
SALES_BEGINDATE             char(8), 
SALES_ENDDATE               char(8), 
PROFIT_ENDDATE              char(8), 
PROFIT_BEGINDATE            char(8), 
FINANCE_MODE                char(1), 
FINANCE_PAUSEFLAG           char(1), 
FINANCE_RISKLEVEL           char(2), 
FINANCE_INVESTDIRECTION     char(40),
FINANCE_FITCIFTYPE          char(2), 
SALES_CHANNEL               char(20),
FINANCE_SELLTARGET          char(1), 
FINANCE_LONGEST_ENDDATE     char(8), 
FINANCE_PERIOD              char(30),
AMT_MGMTLEVEL               char(1)
)