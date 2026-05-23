set heading off feedback off pagesize 0 linesize 300 trimspool on
spool row_count_generated.sql
select 'select ''' || owner || '.' || table_name || ''' table_name, count(*) rows_count from ' || owner || '.' || table_name || ';'
from dba_tables
where owner in ('BI','HR','IX','PM','SH','F1')
order by owner, table_name;
spool off
set heading on feedback on
prompt Execute: @row_count_generated.sql
