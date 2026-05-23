# 04 - Prueba de latencia con ADBPing

## Objetivo

Validar que la latencia entre el origen y Autonomous Database es aceptable para la migracion y operacion.

## Flujo recomendado

```bash
. adb
# Ejecutar ADBPing segun el path disponible en el laboratorio
# Guardar el reporte en reports/sample_outputs o en ~/adbping_output
```

## Evidencia

- Reporte ADBPing.
- Comparacion con latencia actual hacia PDBs origen.
- Conclusiones para seleccionar metodo de migracion.
