set lines 300 pages 100 verify off
col MB for 999,999.99
col incre_MB for 999,999.99
col MAX_MB for 999,999.99
col file_name for a64
col TABLESPACE_NAME for a16

col db_block_size format A16
col db_block_size new_value blksize
select value as db_block_size from v$parameter where name = 'db_block_size';

show parameter undo_retention
  
select TABLESPACE_NAME, FILE_ID, FILE_NAME, 
BYTES/1024/1024 MB, (INCREMENT_BY*&&blksize)/1024/1024 incre_MB, MAXBYTES/1024/1024 MAX_MB
from dba_data_files
where tablespace_name in (select TABLESPACE_NAME from dba_tablespaces where CONTENTS='UNDO');