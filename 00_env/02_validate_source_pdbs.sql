set linesize 220 pagesize 200
column name format a20
column open_mode format a20
column username format a35

prompt === CURRENT CONTAINER ===
show con_name

prompt === PDBS ===
show pdbs

prompt === BLUE USERS ===
alter session set container=BLUE;
select username
from dba_users
where oracle_maintained='N'
  and cloud_maintained='NO'
order by 1;

prompt === RED USERS ===
alter session set container=RED;
select username
from dba_users
where oracle_maintained='N'
  and cloud_maintained='NO'
order by 1;
