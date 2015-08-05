rem This script will add 512m to the tablespace
set linesize 1000
set trimspool on
select 'alter database datafile ' || ' resize ' || to_char(bytes/1024/1024+512) || ' m;' , file_name,bytes/1024/1024,maxbytes/1024/1024 
from dba_data_Files where tablespace_name='&tblsp_nm' ;
