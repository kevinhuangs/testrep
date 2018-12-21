LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_ETAB_VTAC_DETAIL_TMP
TRUNCATE
FIELDS TERMINATED BY "|+|"
(
ZHANGH     CHAR(21),
JIOYRQ     DATE 'YYYYMMDD',
ZHUJRQ     DATE 'YYYYMMDD',
JIOYSJ     INTEGER EXTERNAL,
JIAOYM     CHAR(4),
PNGZHH     CHAR(14),
JIEDBZ     CHAR(1),
JIO1JE     INTEGER EXTERNAL,
ZHHUYE     INTEGER EXTERNAL,
YUEEXZ     CHAR(1),
YUEEFX     CHAR(1),
YNGYJG     CHAR(4),
ZHNGJG     CHAR(4),
ZHYYJG     CHAR(4),
ZHKJJG     CHAR(4),
JIO1GY     CHAR(6),
SHOQGY     CHAR(6),
GUIYLS     CHAR(12),
YNGYLS     CHAR(12),
JBZHBZ     CHAR(1),
XNZHBZ     CHAR(1),
ZHYODM     CHAR(128),
CPZNXH     INTEGER EXTERNAL,
KEHUZH     CHAR(21),
KHZHLX     CHAR(1),
SHUNXH     CHAR(4),
CHBUBZ     CHAR(1),
CZZPBZ     CHAR(1),
DAYNBZ     CHAR(1),
DUIFZH     CHAR(32),
DUIFMC     CHAR(80),
XUHAO1     INTEGER EXTERNAL,
SHJNCH     INTEGER EXTERNAL,
JILUZT     CHAR(1)
)