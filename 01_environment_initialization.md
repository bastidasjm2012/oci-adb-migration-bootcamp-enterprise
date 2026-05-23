# 00 - Overview del laboratorio

## Objetivo

Migrar workloads Oracle hacia Autonomous Database usando dos patrones:

| Origen | Destino | Metodo |
|---|---|---|
| PDB `BLUE` | ADB `SAPPHIRE` | Data Pump con dump files sobre NFS |
| PDB `RED` | ADB `RUBY` | Data Pump sobre database link |

## Fases

1. Preparacion del ambiente.
2. Evaluacion con CPAT.
3. Recomendacion con Cloud Migration Advisor.
4. Prueba de latencia con ADBPing.
5. Migracion con Data Pump sobre NFS.
6. Migracion con Data Pump sobre DB Link.
7. Validacion post-migracion.
8. Administracion y monitoreo con Database Actions.

## Evidencias recomendadas

- Procesos de listener y PMON activos.
- PDBs origen abiertas.
- Wallet ADB configurado.
- Reportes CPAT HTML/JSON/TEXT.
- Resultado CMA.
- Reporte ADBPing.
- Logs de `expdp` e `impdp`.
- Conteo de objetos y filas origen/destino.
- Capturas de Database Actions y Performance Hub.
