LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_CJ_REDENVPARA_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
Batch_Num        Char(20),
RedEnv_Name      Char(100),   
RedEnv_EndDate   DATE 'YYYYMMDD',
City_Code        Char(4),
Start_Date       DATE 'YYYYMMDD',
End_Date         DATE 'YYYYMMDD',
TopPrize_Amt     INTEGER EXTERNAL
)