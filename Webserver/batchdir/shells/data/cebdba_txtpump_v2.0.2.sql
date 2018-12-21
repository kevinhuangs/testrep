-----------------------------------------------------------------
-- Script Name:
--        cebdba_txtpump.sql
--
-- Description:
--        create cebdba_txtpump package specification and body and sequence cebdba_exp_seq.
--        Usage: 
--          txt mode: select * from table(cebdba_txtpump.exptxt(cursor(select /*+ parallel(a,4) */ c1||'|'||c2||'|'||c3||'|'||to_char(c4,'yyyymmdd hh24:mi:ss')||'|' from test a ),4,'BACKUP','TESTA'));
--          tab mode: select * from table(cebdba_txtpump.exptab('MYTAB','|+|',8,'BACKUP',null,'.txt','yyyy-mm-dd hh24:mi:ss',null,'Y',2000,null,null,'Y'));          
--
-- History:
--        Version 1.0, WangZhigang, 2012.11.15, initial, add exptxt function and supporting types.
--        Version 1.1, WangZhigang, 2012.11.15, remove CONTINUE statement for compatibility of 10g, remove userenv,px_session for non-dba user compiling.
--        Version 1.2, WangZhigang, 2012.11.19, replace PLATFORM by UNIX2DOS, and add unix2dos precessing.
--        Version 1.3, WangZhigang, 2012.11.20, remove userenv for 9i compatibility, set full direcotry path at 'dir' parameter in case of 9i .
--        Version 1.3.1, WangZhigang, 2012.12.27, change query on v$mystat to dynamic SQL.
--        Version 1.4, WangZhigang, 2013.1.12, add simple (pure performance) mode.
--        Version 1.4.1, WangZhigang, 2013.1.24, change PX_INFO to show file size in byte.
--        Version 2.0, WangZhigang, 2013.1.28, enable TABLE mode by exptab function.
--        Version 2.0.1, WangZhigang, 2013.1.30, enable TABLE mode 9i compatibility.
--        Version 2.0.2, WangZhigang, 2013.2.07, add raising application error in case of unsuupported data type by default.
--
-- Author: DBA Team, China EverBright Bank
-----------------------------------------------------------------

PROMPT##############################################################################################################################
PROMPT####                                                                                                                      ####
PROMPT#### Please make sure the package belongs to the user who will run it, otherwise 'Row Cache Lock' contention may be seen. ####
PROMPT#### Refer to Oracle BUG 13502860                                                                                         ####
PROMPT#### MOS Note: High Waits on 'Row Cache Lock' with Pipelined Functions After Upgrade to 11.2.0.3 [ID 1466896.1]           ####
PROMPT####                                                                                                                      ####
PROMPT##############################################################################################################################

drop sequence cebdba_exptxt_seq ;

create sequence cebdba_exptxt_seq start with 1 nocache nocycle order;


create or replace
PACKAGE cebdba_txtpump
IS
type char_tab is table of varchar2(32767);
type result_r
IS
  record
  (
    file_name VARCHAR2(60),
    num_rows  NUMBER,
    begin_time DATE,
    end_time DATE,
    px_info VARCHAR2(512));
type result_t
IS
  TABLE OF result_r;
type char_r
IS
  record
  (
    vchar VARCHAR2(32767));
type refcur
IS
  REF
  CURSOR
    RETURN char_r;
  FUNCTION exptxt(
      qry refcur,
      degree      NUMBER DEFAULT 32,
      dir         VARCHAR2 DEFAULT 'EXP_DIR',
      prefix      VARCHAR2 DEFAULT 'exptxt',
      suffix      VARCHAR2 DEFAULT '.txt',
      show_pxinfo VARCHAR2 DEFAULT 'N',
      charset     VARCHAR2 DEFAULT NULL,
      unix2dos    VARCHAR2 DEFAULT 'N')
    RETURN result_t PIPELINED PARALLEL_ENABLE(
      PARTITION qry BY ANY);
  FUNCTION exptxt(
      pureperf    VARCHAR2 DEFAULT 'N',
      qry refcur,
      degree      NUMBER DEFAULT 32,
      dir         VARCHAR2 DEFAULT 'EXP_DIR',
      prefix      VARCHAR2 DEFAULT 'exptxt',
      suffix      VARCHAR2 DEFAULT '.txt')
    RETURN result_t PIPELINED PARALLEL_ENABLE(
      PARTITION qry BY ANY);
  FUNCTION exptab(
                  tab_name    varchar2,
                  s_char      varchar2 default '|',
                  degree      number default 1,
                  dir         VARCHAR2 DEFAULT 'EXP_DIR',
                  prefix      VARCHAR2 DEFAULT null,
                  suffix      VARCHAR2 DEFAULT '.txt',
                  date_format varchar2 default 'yyyy-mm-dd hh24:mi:ss',
                  owner       varchar2 default null,
                  show_et_ddl varchar2 default 'N',
                  clob_max    number default 1000,
                  order_by    varchar2 default null,
                  subs_type_string varchar2 default null,
                  dbg_info    varchar2 default 'N',
				  ignore_type_err  varchar2 default 'N'
				  )
    RETURN char_tab PIPELINED;
  END;
/

create or replace
PACKAGE body     cebdba_txtpump
IS
FUNCTION exptxt(
    qry refcur,
    degree      NUMBER DEFAULT 32,
    dir         VARCHAR2 DEFAULT 'EXP_DIR',
    prefix      VARCHAR2 DEFAULT 'exptxt',
    suffix      VARCHAR2 DEFAULT '.txt',
    show_pxinfo VARCHAR2 DEFAULT 'N',
    charset     VARCHAR2 DEFAULT NULL,
    unix2dos    VARCHAR2 DEFAULT 'N')
  RETURN result_t PIPELINED PARALLEL_ENABLE(
    PARTITION qry BY ANY)
IS
  tfile utl_file.file_type;
  lcount binary_integer := 0;
  tline VARCHAR2(32767);
type txttab
IS
  TABLE OF VARCHAR2(32767) INDEX BY binary_integer;
  tarray txttab;
  c_newline VARCHAR2(10);
  buffer_maxsiz NUMBER := 32767;
  tid       NUMBER :=0;
  lid       NUMBER :=0;
  bid       NUMBER :=0;
  r_row result_r;
  btime DATE;
  etime DATE;
  dinfo number :=0;
  v_exists boolean;
  v_flength number;
  v_blocksize number;
BEGIN
  SELECT sysdate INTO btime FROM dual;

  IF unix2dos='Y' THEN
    c_newline:=CHR(13)||CHR(10);
    buffer_maxsiz:=32767-lengthb(CHR(13));
  ELSE
    c_newline      :=CHR(10);
  END IF;

  IF degree<=1 THEN
    tid    :=NULL;
  ELSE
    select mod(cebdba_exptxt_seq.nextval,ceil(degree)) into tid from dual;
  END IF;

  tfile := utl_file.fopen(DIR, prefix||tid||suffix, 'w',32767);

  LOOP
    FETCH qry bulk collect INTO tarray limit 100;
    FOR d IN 1 .. tarray.count
    LOOP
     IF (bid  = 0) THEN
        tline := tarray(d);
        bid   :=bid+1;
     ELSE
      IF
        (
          CASE
          WHEN tline IS NULL THEN
            0
          ELSE
            LENGTHB(tline)
          END) + lengthb(c_newline) +
        (
          CASE
          WHEN tarray(d) IS NULL THEN
            0
          ELSE
            LENGTHB(tarray(d))
          END) <= buffer_maxsiz THEN
        tline  := tline || c_newline || tarray(d) ; -- puplate the 32K buffer before writting down
        bid    :=bid+1;
      ELSE
        IF unix2dos='Y' then
          tline:=tline||CHR(13);
        END IF;

        IF charset IS NULL THEN
          UTL_FILE.PUT_LINE(tfile, tline);
        ELSE
          UTL_FILE.PUT_LINE(tfile, CONVERT(tline,charset));
        END IF;

        lid   :=lid+bid;
        tline := tarray(d);
        bid   :=1;

      END IF;
     END IF;
    END LOOP;
    EXIT
  WHEN qry%notfound;
  END LOOP;
  IF tline     IS NOT NULL THEN

    IF unix2dos='Y' then
      tline:=tline||CHR(13);
    END IF;

    IF charset IS NULL THEN
      UTL_FILE.PUT_LINE(tfile, tline);
    ELSE
      UTL_FILE.PUT_LINE(tfile, CONVERT(tline,charset));
    END IF;
    lid:=lid+bid;

  END IF;
  utl_file.fflush(tfile);
  lcount := qry%ROWCOUNT;
  CLOSE qry;
  utl_file.fclose(tfile);
  SELECT sysdate INTO etime FROM dual;
  IF show_pxinfo='Y' THEN
    utl_file.fgetattr(DIR, prefix||tid||suffix,v_exists,v_flength,v_blocksize);
    dinfo:=v_flength;
  END IF;
  r_row.file_name :=prefix||tid||suffix;
  r_row.num_rows  :=lid;
  r_row.begin_time:=btime;
  r_row.end_time  :=etime;
  r_row.px_info   :=dinfo;
  PIPE ROW(r_row);
  RETURN ;
EXCEPTION
WHEN OTHERS THEN
  utl_file.fclose(tfile);
  r_row.file_name :=prefix||tid||suffix;
  r_row.num_rows  :=lid;
  r_row.begin_time:=btime;
  r_row.end_time  :=etime;
  r_row.px_info   :='Terminated with error: '||SQLERRM;
  PIPE ROW(r_row);
END exptxt;

FUNCTION exptxt(
    pureperf    VARCHAR2 DEFAULT 'N',
    qry refcur,
    degree      NUMBER DEFAULT 32,
    dir         VARCHAR2 DEFAULT 'EXP_DIR',
    prefix      VARCHAR2 DEFAULT 'exptxt',
    suffix      VARCHAR2 DEFAULT '.txt'
    )
  RETURN result_t PIPELINED PARALLEL_ENABLE(
    PARTITION qry BY ANY)
IS
  tfile utl_file.file_type;
  lcount binary_integer := 0;
  tline VARCHAR2(32767);
type txttab
IS
  TABLE OF VARCHAR2(32767) INDEX BY binary_integer;
  tarray txttab;
  c_newline VARCHAR2(10);
  buffer_maxsiz NUMBER := 32767;
  tid       NUMBER :=0;
  lid       NUMBER :=0;
  bid       NUMBER :=0;
  r_row result_r;
  btime DATE;
  etime DATE;
  dinfo number :=0;
  v_exists boolean;
  v_flength number;
  v_blocksize number;
BEGIN
 IF UPPER(PUREPERF)='Y' THEN
  SELECT sysdate INTO btime FROM dual;

  c_newline      :=CHR(10);

  IF degree<=1 THEN
    tid    :=NULL;
  ELSE
    select mod(cebdba_exptxt_seq.nextval,ceil(degree)) into tid from dual;
  END IF;

  tfile := utl_file.fopen(DIR, prefix||tid||suffix, 'w',32767);

  LOOP
    FETCH qry bulk collect INTO tarray limit 1000;
    FOR d IN 1 .. tarray.count
    LOOP
     IF (bid  = 0) THEN
        tline := tarray(d);
        bid   :=bid+1;
     ELSE
      IF
        (
          CASE
          WHEN tline IS NULL THEN
            0
          ELSE
            LENGTHB(tline)
          END) + lengthb(c_newline) +
        (
          CASE
          WHEN tarray(d) IS NULL THEN
            0
          ELSE
            LENGTHB(tarray(d))
          END) <= buffer_maxsiz THEN
        tline  := tline || c_newline || tarray(d) ; -- puplate the 32K buffer before writting down
        bid    :=bid+1;
      ELSE
        UTL_FILE.PUT_LINE(tfile, tline);
        lid   :=lid+bid;
        tline := tarray(d);
        bid   :=1;

      END IF;
     END IF;
    END LOOP;
    EXIT
  WHEN qry%notfound;
  END LOOP;
  IF tline     IS NOT NULL THEN
    UTL_FILE.PUT_LINE(tfile, tline);
    lid:=lid+bid;
  END IF;
  utl_file.fflush(tfile);
  lcount := qry%ROWCOUNT;
  CLOSE qry;
  utl_file.fclose(tfile);
  SELECT sysdate INTO etime FROM dual;
  utl_file.fgetattr(DIR, prefix||tid||suffix,v_exists,v_flength,v_blocksize);
  dinfo:=v_flength;
  r_row.file_name :=prefix||tid||suffix;
  r_row.num_rows  :=lid;
  r_row.begin_time:=btime;
  r_row.end_time  :=etime;
  r_row.px_info   :=dinfo;
  PIPE ROW(r_row);
  RETURN ;

 END IF;
EXCEPTION
WHEN OTHERS THEN
  utl_file.fclose(tfile);
  r_row.file_name :=prefix||tid||suffix;
  r_row.num_rows  :=lid;
  r_row.begin_time:=btime;
  r_row.end_time  :=etime;
  r_row.px_info   :='Terminated with error: '||SQLERRM;
  PIPE ROW(r_row);

END exptxt;

FUNCTION exptab(
                  tab_name    varchar2,
                  s_char      varchar2 default '|',
                  degree      number default 1,
                  dir         VARCHAR2 DEFAULT 'EXP_DIR',
                  prefix      VARCHAR2 DEFAULT null,
                  suffix      VARCHAR2 DEFAULT '.txt',
                  date_format varchar2 default 'yyyy-mm-dd hh24:mi:ss',
                  owner       varchar2 default null,
                  show_et_ddl varchar2 default 'N',
                  clob_max    number default 1000,
                  order_by    varchar2 default null,
                  subs_type_string varchar2 default null,
                  dbg_info    varchar2 default 'N',
				  ignore_type_err  varchar2 default 'N')
    RETURN char_tab PIPELINED
is 
type col_def_r is record ( col_name user_tab_columns.COLUMN_NAME%type, 
                           col_type user_tab_columns.DATA_TYPE%type,
                           col_length user_tab_columns.DATA_LENGTH%type,
                           col_precision user_tab_columns.DATA_PRECISION%type,
                           col_scale user_tab_columns.DATA_SCALE%type);
type col_def_t is table of col_def_r;
col_def col_def_t;
p_hint varchar2(500) default '/*+ noparallel */';
sql_txt varchar2(32000);
exp_sql_txt varchar2(32767);
exptxt_t result_t;
et_ddl char_tab;
begin
if owner is not null then
  execute immediate 'select COLUMN_NAME,DATA_TYPE,DATA_LENGTH,DATA_PRECISION,DATA_SCALE from dba_tab_columns where table_name=upper('''||tab_name||''') and owner=upper('''||owner||''') order by column_id' bulk collect into col_def;
else
  execute immediate 'select COLUMN_NAME,DATA_TYPE,DATA_LENGTH,DATA_PRECISION,DATA_SCALE from user_tab_columns where table_name='''||tab_name||''' order by column_id' bulk collect into col_def;
end if;

if col_def.count=0 then 
  pipe row('*** Error : Table "'||tab_name||'" Not Found.');
else

if degree>1 then
  p_hint:='/*+ parallel(tab_a,'||degree||') */';
end if;

sql_txt :='select '||p_hint||' ';

for i in 1 .. col_def.count loop
  if col_def(i).col_type='CLOB' then
    sql_txt:=sql_txt||'dbms_lob.substr('||col_def(i).col_name||','||clob_max||')||'''||s_char||'''';
  elsif col_def(i).col_type='DATE'  then
    sql_txt:=sql_txt||'to_char('||col_def(i).col_name||','''||date_format||''')||'''||s_char||'''';
  elsif substr(col_def(i).col_type,1,9)='TIMESTAMP' then
    sql_txt:=sql_txt||'to_char('||col_def(i).col_name||')||'''||s_char||'''';
  elsif col_def(i).col_type in ('BINARY_FLOAT','BINARY_DOUBLE','FLOAT') then
    pipe row('*** Warning: Column "'||col_def(i).col_name||'" is data type "'||col_def(i).col_type||'", which will be converted to number type and precision might be lost; ');
    sql_txt:=sql_txt||'to_number('||col_def(i).col_name||')||'''||s_char||'''';
  elsif col_def(i).col_type in ('CHAR','VARCHAR2','VARCHAR','NUMBER') then
    sql_txt:=sql_txt||col_def(i).col_name||'||'''||s_char||'''';
  else
    if ignore_type_err='Y' then
      pipe row('*** Warning: Column "'||col_def(i).col_name||'" is unsupported data type "'||col_def(i).col_type||'", which will be left as "'||nvl(subs_type_string,'NULL')||'" in output string.');
      sql_txt:=sql_txt||''''||subs_type_string||''''||'||'''||s_char||'''';
    else
	  raise_application_error(-20004,'Column "'||col_def(i).col_name||'" is unsupported data type "'||col_def(i).col_type||'"');
	end if;
  end if;
  if i<col_def.count then
    sql_txt:=sql_txt||'||';
  else
    sql_txt:=sql_txt||' ';
  end if;
end loop;

if owner is not null then
  sql_txt:=sql_txt||'from '||owner||'.'||tab_name||' tab_a ';
else 
  sql_txt:=sql_txt||'from '||tab_name||' tab_a ';
end if;
if order_by is not null then
  sql_txt:=sql_txt||'order by '||order_by;
end if;

exp_sql_txt:='select file_name,num_rows,begin_time,end_time,px_info'||
           ' from table(cebdba_txtpump.exptxt(''Y'','||
           'cursor('||sql_txt||'),'||
           degree||','''||dir||''','''||nvl(prefix,tab_name)||''','''||suffix||'''))';

if upper(dbg_info)='Y' then
  pipe row('*** Debug  : Generated query sql : '||sql_txt);
  pipe row('*** Debug  : Generated writing sql: '||exp_sql_txt);
end if;

execute immediate exp_sql_txt bulk collect into exptxt_t;

for j in 1.. exptxt_t.count loop
  pipe row(j||' Completed: '||exptxt_t(j).file_name||', Rows: '||exptxt_t(j).num_rows||', Size: '||exptxt_t(j).px_info||' Bytes,  Elapsed Seconds: '||round(86400*(exptxt_t(j).end_time-exptxt_t(j).begin_time))||';');
end loop;

end if;

if upper(show_et_ddl)='Y' then
  pipe row('    ' );
  pipe row('    ' );
  pipe row('--- Here''s a sample DDL to create a External Table to load above text file(s) ' );
  pipe row('--- Customization might be needed.  ' );
  pipe row('-- DROP TABLE EXT_'||tab_name||';' );
  pipe row('CREATE TABLE EXT_'||tab_name );
  pipe row('(' );
  
  for i in 1 .. col_def.count loop
    if col_def(i).col_type in ('CLOB','DATE','BINARY_FLOAT','BINARY_DOUBLE') or substr(col_def(i).col_type,1,9)='TIMESTAMP' then
      pipe row('"'||col_def(i).col_name||'" '||col_def(i).col_type||case i when col_def.count then null else ',' end);
    elsif col_def(i).col_type in ('NUMBER','FLOAT') then
      if col_def(i).col_precision is null then
        pipe row('"'||col_def(i).col_name||'" '||col_def(i).col_type||case i when col_def.count then null else ',' end);
      else
        if col_def(i).col_scale is null then
          pipe row('"'||col_def(i).col_name||'" '||col_def(i).col_type||'('||col_def(i).col_precision||')'||case i when col_def.count then null else ',' end);
        else
          pipe row('"'||col_def(i).col_name||'" '||col_def(i).col_type||'('||col_def(i).col_precision||','||col_def(i).col_scale||')'||case i when col_def.count then null else ',' end);
        end if;
      end if;       
    elsif col_def(i).col_type in ('CHAR','VARCHAR2','VARCHAR') then
      pipe row('"'||col_def(i).col_name||'" '||col_def(i).col_type||'('||col_def(i).col_length||')'||case i when col_def.count then null else ',' end);
    else
      pipe row('"'||col_def(i).col_name||'" VARCHAR2(100)'||case i when col_def.count then null else ',' end||' -- column data type converted from '||col_def(i).col_type );
    end if;
  end loop;
  
  pipe row(')' );
  pipe row('ORGANIZATION EXTERNAL' );
  pipe row('(' );
  pipe row('TYPE ORACLE_LOADER' );
  pipe row('DEFAULT DIRECTORY '||dir );
  pipe row('ACCESS PARAMETERS' );
  pipe row('(' );
  pipe row('records delimited by newline' );
  pipe row('badfile '||dir||': '''||tab_name||'.bad''' );
  pipe row('logfile '||dir||': '''||tab_name||'.log''' );
  pipe row('fields terminated by '''||s_char||'''' );
  pipe row('missing field values are null' );
  pipe row('( ' );
  
  for i in 1 .. col_def.count loop
    if col_def(i).col_type = 'CLOB' then
      pipe row('"'||col_def(i).col_name||'" CHAR(32000)'||case i when col_def.count then null else ',' end);
    elsif col_def(i).col_type ='DATE' then
      pipe row('"'||col_def(i).col_name||'" CHAR DATE_FORMAT DATE MASK "'||date_format||'"'||case i when col_def.count then null else ',' end);
    elsif col_def(i).col_type in ('CHAR','VARCHAR2','VARCHAR') then
      pipe row('"'||col_def(i).col_name||'" CHAR('||col_def(i).col_length||')'||case i when col_def.count then null else ',' end);
    else
      pipe row('"'||col_def(i).col_name||'" CHAR '||case i when col_def.count then null else ',' end);
    end if;
  end loop;

  pipe row(')' );
  pipe row(')' );
  pipe row('LOCATION (' );
  for j in 1..exptxt_t.count loop
    pipe row('          '''||exptxt_t(j).file_name||''''||case j when exptxt_t.count then null else ',' end);    
  end loop;
  pipe row(')' );
  pipe row(')' );
  if degree<2 then
    pipe row('NOPARALLEL' );
  else 
    pipe row('PARALLEL '||degree );
  end if;  
  pipe row('REJECT LIMIT UNLIMITED' );
  pipe row(';' );
end if;

return;

end exptab;

END;
/
