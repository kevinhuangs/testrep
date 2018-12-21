set long 1999
set linesize 1999
set pagesize 0
set feedback 0
set termout off
set heading off
set longchunksize 1999 
set trimspool on
select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    FUND_CODE            ||'|+|'||
									FUND_NAME            ||'|+|'||
									ISSUE_DATE           ||'|+|'||
									FUND_FLAG            ||'|+|'||
									FUNDSTATUS_DESC      ||'|+|'||
									to_char(FUND_VALUE,'FM9999999999999990.9990')|| '|+|'||
									REDEEM_FLAG          ||'|+|'||
									TA_CODE              ||'|+|'||
									CURRENCY_CODE        ||'|+|'||
									REMAIN               ||'|+|'||
									TA_NAME              ||'|+|'||
									CASH_FLAG            ||'|+|'||
									FUND_MANAGERCODE     ||'|+|'||
									FUND_MANAGERNAME     ||'|+|'||
									CURRENCY_NAME        ||'|+|'||
									PROFIT_SHAREMODE     ||'|+|'||
									PROFIT_SHAREMODEDESC ||'|+|'||
									FUND_TRANSFLAG       ||'|+|'||
									FUND_TRANSDESC       ||'|+|'||
									FUND_PROPERTY        ||'|+|'||
									FUND_PROPERTYDESC    ||'|+|'||
									FUND_RCVTIME         ||'|+|'||
									FUND_AUTOAPPFLAG     ||'|+|'||
									to_char(FIRST_MINAMOUNT,'FM99999999999999990.90')|| '|+|' ||
									to_char(ADD_MINAMOUNT,  'FM99999999999999990.90')|| '|+|' ||
									FUND_RISKLEVEL       ||'|+|'||
									FUND_RISKLEVELEXPLAIN||'|+|'||
									CYCLE_FLAG           ||'|+|'||
									CYCLE_TYPE           ||'|+|'||
									PRODUCT_CYCLE        ||'|+|'||
									CYCLE_UNIT           ||'|+|'||
									SHAREDETAIL_FLAG     ||'|+|'||
									RED_FLAG             ||'|+|'||
									to_char(MAX_AUTOREDVOL,'FM9999999999990.90')|| '|+|' ||   
									MAX_SUBLIMIT         ||'|+|'||
									MAX_REDLIMIT         ||'|+|'||
									CONVSUB_FLAG         ||'|+|'||
									IMPAWN_FLAG          ||'|+|'||
									ALLOWCLIENT_TYPE     ||'|+|'||
									SALES_BEGINDATE      ||'|+|'||
									SALES_ENDDATE        ||'|+|'||
									PROFIT_BEGINDATE     ||'|+|'||
									PRODUCT_DUEDATE      ||'|+|'||
									IS_CAST_FLAG         ||'|+|'||
									IS_CAST              ||'|+|'||
									to_char(BASE_CAST_AMOUNT,'FM999999999990.90')|| '|+|' || 
									PRODUCT_CATEGORY_ID  ||'|+|'||
									PRODUCT_CATEGORY_NAME||'|+|'||
									to_char(ENT_FIRST_MINAMOUNT,'FM99999999999999990.90')|| '|+|' || 
									to_char(ENT_ADD_MINAMOUNT,  'FM99999999999999990.90')|| '|+|' ||
									TA_FUNDTYPE           ||'|+|'||
									TA_FUNDTYPENAME       ||'|+|'||
									MIN_HOLDDAYS          ||'|+|'||
									MAX_HOLDDAYS          ||'|+|'||
									ALLOWD_CHANNELS       ||'|+|'
									from ibs_ptab_fundcode_CH2 a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   '2_NewI',
                                   '.txt'));

select *
  from table(cebdba_txtpump.exptxt(cursor
                                   (select /*+ parallel(a,0) */
                                    FUND_CODE            ||'|+|'||
									FUND_NAME            ||'|+|'||
									ISSUE_DATE           ||'|+|'||
									FUND_FLAG            ||'|+|'||
									FUNDSTATUS_DESC      ||'|+|'||
									to_char(FUND_VALUE,'FM9999999999999990.9990')|| '|+|'||
									REDEEM_FLAG          ||'|+|'||
									TA_CODE              ||'|+|'||
									CURRENCY_CODE        ||'|+|'||
									REMAIN               ||'|+|'||
									TA_NAME              ||'|+|'||
									CASH_FLAG            ||'|+|'||
									FUND_MANAGERCODE     ||'|+|'||
									FUND_MANAGERNAME     ||'|+|'||
									CURRENCY_NAME        ||'|+|'||
									PROFIT_SHAREMODE     ||'|+|'||
									PROFIT_SHAREMODEDESC ||'|+|'||
									FUND_TRANSFLAG       ||'|+|'||
									FUND_TRANSDESC       ||'|+|'||
									FUND_PROPERTY        ||'|+|'||
									FUND_PROPERTYDESC    ||'|+|'||
									FUND_RCVTIME         ||'|+|'||
									FUND_AUTOAPPFLAG     ||'|+|'||
									to_char(FIRST_MINAMOUNT,'FM99999999999999990.90')|| '|+|' ||
									to_char(ADD_MINAMOUNT,  'FM99999999999999990.90')|| '|+|' ||
									FUND_RISKLEVEL       ||'|+|'||
									FUND_RISKLEVELEXPLAIN||'|+|'||
									CYCLE_FLAG           ||'|+|'||
									CYCLE_TYPE           ||'|+|'||
									PRODUCT_CYCLE        ||'|+|'||
									CYCLE_UNIT           ||'|+|'||
									SHAREDETAIL_FLAG     ||'|+|'||
									RED_FLAG             ||'|+|'||
									to_char(MAX_AUTOREDVOL,'FM9999999999990.90')|| '|+|' ||   
									MAX_SUBLIMIT         ||'|+|'||
									MAX_REDLIMIT         ||'|+|'||
									CONVSUB_FLAG         ||'|+|'||
									IMPAWN_FLAG          ||'|+|'||
									ALLOWCLIENT_TYPE     ||'|+|'||
									SALES_BEGINDATE      ||'|+|'||
									SALES_ENDDATE        ||'|+|'||
									PROFIT_BEGINDATE     ||'|+|'||
									PRODUCT_DUEDATE      ||'|+|'||
									IS_CAST_FLAG         ||'|+|'||
									IS_CAST              ||'|+|'||
									to_char(BASE_CAST_AMOUNT,'FM999999999990.90')|| '|+|' || 
									PRODUCT_CATEGORY_ID  ||'|+|'||
									PRODUCT_CATEGORY_NAME||'|+|'||
									to_char(ENT_FIRST_MINAMOUNT,'FM99999999999999990.90')|| '|+|' || 
									to_char(ENT_ADD_MINAMOUNT,  'FM99999999999999990.90')|| '|+|' ||
									TA_FUNDTYPE           ||'|+|'||
									TA_FUNDTYPENAME       ||'|+|'||
									MIN_HOLDDAYS          ||'|+|'||
									MAX_HOLDDAYS          ||'|+|'||
									ALLOWD_CHANNELS       ||'|+|'
                                    from ibs_ptab_fundcode_CH4 a),
                                   0,
                                   'NBTXTPUMP_DATAPATH_EDW',
                                   '4_NewI',
                                   '.txt'));
exit
