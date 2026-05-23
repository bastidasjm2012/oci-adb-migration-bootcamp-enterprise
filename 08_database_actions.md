# 07 - Validacion post-migracion

## Validaciones tecnicas

- Usuarios creados en destino.
- Objetos por esquema y tipo.
- Objetos invalidos.
- Conteo de filas por tabla.
- Logs Data Pump.
- Diferencias de metadata.
- Directorios y external tables.
- DB links y privilegios.

## Consultas base

```sql
select owner, object_type, count(*) total
from dba_objects
where owner in ('BI','HR','IX','PM','SH','F1')
group by owner, object_type
order by owner, object_type;
```

```sql
select owner, object_name, object_type, status
from dba_objects
where owner in ('BI','HR','IX','PM','SH','F1')
  and status <> 'VALID'
order by owner, object_type, object_name;
```

## Conteo de filas dinamico

Usar `scripts/06_validation/01_generate_row_count_sql.sql` para generar sentencias por esquema.

## Evidencias

- Reporte de objetos por tipo.
- Reporte de invalidos.
- Conteo de filas origen vs destino.
- Comparacion de logs `expdp` vs `impdp`.
- Capturas de correcciones aplicadas.
