set echo on
alter session set container=BLUE;
create or replace directory DATA_PUMP_DIR_NFS as '/nfs';
grant read, write on directory DATA_PUMP_DIR_NFS to system;
select directory_name, directory_path from dba_directories where directory_name='DATA_PUMP_DIR_NFS';
