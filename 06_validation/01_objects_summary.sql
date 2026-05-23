set linesize 220 pagesize 200
column owner format a20
column object_type format a30

select owner, object_type, count(*) total
from dba_objects
where owner in ('BI','HR','IX','PM','SH','F1')
group by owner, object_type
order by owner, object_type;

select owner, object_name, object_type, status
from dba_objects
where owner in ('BI','HR','IX','PM','SH','F1')
  and status <> 'VALID'
order by owner, object_type, object_name;
