set echo on
-- Ejecutar conectado como ADMIN en RUBY
-- Reemplazar valores antes de ejecutar.

define SRC_SYSTEM_PASSWORD='REPLACE_ME'
define SOURCE_HOST='REPLACE_ME'
define SOURCE_PORT='1521'
define SOURCE_SERVICE='RED'

create database link RED_LINK
connect to system identified by "&SRC_SYSTEM_PASSWORD"
using '(description=(address=(protocol=tcp)(host=&SOURCE_HOST)(port=&SOURCE_PORT))(connect_data=(service_name=&SOURCE_SERVICE)))';

select count(*) as users_on_red from dba_users@RED_LINK;
