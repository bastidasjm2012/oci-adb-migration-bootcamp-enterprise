# 05 - Migracion BLUE hacia SAPPHIRE con Data Pump sobre NFS

## Objetivo

Migrar los esquemas de `BLUE` hacia `SAPPHIRE` usando dump files Data Pump en un NFS compartido.

## Ventajas

- Mayor control del paralelismo.
- No requiere interoperabilidad directa origen-destino por DB link.
- Permite conservar dump files como evidencia.

## Pasos

### 1. Reiniciar NFS

```bash
cd
sudo podman restart nfs-server
```

### 2. Crear/validar directorio Data Pump en origen

```sql
alter session set container=BLUE;
create or replace directory DATA_PUMP_DIR_NFS as '/nfs';
grant read, write on directory DATA_PUMP_DIR_NFS to system;
```

### 3. Exportar esquemas de BLUE

```bash
. cdb23
expdp system/${SRC_SYSTEM_PASSWORD}@blue \
  schemas=BI,HR,IX,PM,SH \
  directory=DATA_PUMP_DIR_NFS \
  dumpfile=blue_schemas_%U.dmp \
  logfile=expdp_blue_schemas.log \
  parallel=4 \
  metrics=y \
  logtime=all
```

### 4. Compartir NFS con ADB

En ADB, crear credenciales/directorio segun el mecanismo del laboratorio y montar el recurso NFS.

### 5. Importar en SAPPHIRE

```bash
. adb
impdp admin/${ADB_ADMIN_PASSWORD}@sapphire_tp \
  schemas=BI,HR,IX,PM,SH \
  directory=DATA_PUMP_DIR_NFS \
  dumpfile=blue_schemas_%U.dmp \
  logfile=impdp_sapphire_blue_schemas.log \
  parallel=4 \
  metrics=y \
  logtime=all
```

## Validaciones

- Revisar `expdp` sin errores criticos.
- Revisar `impdp` sin errores criticos.
- Comparar objetos por esquema.
- Comparar conteos de filas.
- Revisar objetos invalidos.
