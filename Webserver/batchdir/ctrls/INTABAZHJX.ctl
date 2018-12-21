LOAD DATA
characterset ZHS16GBK
INTO TABLE IBS_BTAB_AZHJX
TRUNCATE
FIELDS TERMINATED BY "|+|"
(  
ZHANGH CHAR(21),  
ZHYYJG CHAR(4),          
HUOBDH CHAR(2),          
YEWUDH CHAR(4),        
ZHAOXH CHAR(7),         
JIANCW CHAR(2),         
ZHKJJG CHAR(4),          
KEMUCC CHAR(1),          
KEHUZH CHAR(21),        
KHZHLX CHAR(1),         
KEHHAO CHAR(10),        
KAIHRQ CHAR(8),         
KAIHGY CHAR(6),         
KAIHJE INTEGER EXTERNAL,        
KHGYLS CHAR(12),        
XIOHJG CHAR(4),         
XIOHRQ CHAR(8),         
LIXILX INTEGER EXTERNAL,        
XIOHGY CHAR(6),         
XHGYLS CHAR(12),        
DGDSBZ CHAR(1),         
SHJNCH INTEGER EXTERNAL,         
JILUZT CHAR(1),          
RIZHXH CHAR(25)   
)