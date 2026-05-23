# 01 - Inicializacion del ambiente

## Validar listeners

```bash
ps -ef | grep LISTENER | grep -v grep
```

## Validar instancias

```bash
ps -ef | grep ora_ | grep pmon | grep -v grep
```

Se esperan al menos:

- `ora_pmon_CDB23`
- `ora_pmon_POD1`

## Arrancar componentes si es necesario

```bash
sudo podman start adb-free
. cdb23
sql / as sysdba <<< "startup"
```

## Validar PDBs origen

```sql
show pdbs
```

PDBs esperadas:

- `RED`
- `BLUE`
- `GREEN` puede estar montada y no se usa en el flujo principal.

## Validar usuarios no internos en BLUE

```sql
alter session set container=BLUE;
select username
from dba_users
where oracle_maintained='N'
  and cloud_maintained='NO'
order by 1;
```

## Validar usuarios no internos en RED

```sql
alter session set container=RED;
select username
from dba_users
where oracle_maintained='N'
  and cloud_maintained='NO'
order by 1;
```

## Validar wallet y servicios ADB

```bash
. adb
echo $TNS_ADMIN
ls -l $TNS_ADMIN
cat $TNS_ADMIN/tnsnames.ora
```

## Probar conexion a SAPPHIRE

```bash
. adb
sql admin/${ADB_ADMIN_PASSWORD}@sapphire_tp
```

## Probar conexion a RUBY

```bash
. adb
sql admin/${ADB_ADMIN_PASSWORD}@ruby_tp
```
