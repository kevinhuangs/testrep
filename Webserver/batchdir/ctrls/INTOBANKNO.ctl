LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_PTAB_XEBANKNO
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
DLFKHH     CHAR(12),
FBZXDM     CHAR(4),
DRHGLX     CHAR(1),
SHJNCH     INTEGER EXTERNAL,
JILUZT     CHAR(1),
RIZHXH     CHAR(25)
)

