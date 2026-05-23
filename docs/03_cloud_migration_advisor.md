# 02 - Evaluacion con CPAT

CPAT permite evaluar compatibilidad de la base origen con Autonomous Database y otros destinos. En el laboratorio se generan reportes genericos y luego reportes especificos por metodo de migracion para reducir ruido.

## Descargar o ubicar CPAT

En LiveLabs ya esta disponible en `/home/oracle/scripts`.

```bash
mkdir -p /home/oracle/cpat
unzip /home/oracle/scripts/p32613591_112048_Generic.zip -d /home/oracle/cpat
ls -l /home/oracle/cpat
```

## Reporte generico

```bash
. cdb23
~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --targetcloud ALL \
  --migrationmethod ALL \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/1_generic/
```

## Revisar salidas

```bash
ls -l ~/cpat_output/1_generic/
cat ~/cpat_output/1_generic/premigration_advisor_summary_report.txt
```

## Reporte especifico para BLUE usando Data Pump

```bash
. cdb23
~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --pdbs BLUE \
  --targetcloud ADBS \
  --migrationmethod DATAPUMP \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/2_blue_datapump/
```

## Reporte especifico para RED usando Data Pump DB Link

```bash
. cdb23
~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --pdbs RED \
  --targetcloud ADBS \
  --migrationmethod DATAPUMP_DBLINK \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/3_red_datapump_dblink/
```
