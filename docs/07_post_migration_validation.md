# 06 - Migracion RED hacia RUBY con Data Pump via DB Link

## Objetivo

Migrar el esquema `F1` desde `RED` hacia `RUBY` usando Data Pump con `NETWORK_LINK`.

## Pasos

### 1. Preparar perfil en ADB

En ADB, ajustar perfiles o parametros requeridos para permitir la carga.

### 2. Crear database link en RUBY apuntando a RED

```sql
create database link RED_LINK
connect to system identified by "<SRC_SYSTEM_PASSWORD>"
using '(description=(address=(protocol=tcp)(host=<SOURCE_HOST>)(port=1521))(connect_data=(service_name=RED)))';
```

### 3. Probar link

```sql
select count(*) from dba_users@RED_LINK;
```

### 4. Importar con NETWORK_LINK

```bash
. adb
impdp admin/${ADB_ADMIN_PASSWORD}@ruby_tp \
  schemas=F1 \
  network_link=RED_LINK \
  logfile=impdp_ruby_red_f1_network_link.log \
  metrics=y \
  logtime=all
```

## Validaciones

- Revision del log de importacion.
- Conteo de objetos origen/destino.
- Conteo de filas origen/destino.
- Validacion con DBMS_COMPARISON si aplica.
