set lines 180 verify off
col TABLESPACE_NAME for a30 trunc
col MB for 999,999,999.99

/*
select TABLESPACE_NAME, SEGMENT_NAME, STATUS, SUM(bytes)/1024/1024 MB
  from dba_undo_extents
  group by TABLESPACE_NAME, SEGMENT_NAME, STATUS
  ORDER by TABLESPACE_NAME,STATUS;

*/

 
select TABLESPACE_NAME,STATUS, SUM(bytes)/1024/1024 MB
  from dba_undo_extents
  group by TABLESPACE_NAME, STATUS
  ORDER by TABLESPACE_NAME, STATUS;

--clear breaks;