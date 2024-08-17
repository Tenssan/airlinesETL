# Proyecto ETL de Aerolíneas

## Resumen Ejecutivo

Este proyecto implica un proceso completo de Extracción, Transformación y Carga (ETL) aplicado a datos de aerolíneas, seguido de un análisis detallado utilizando Power BI. El objetivo principal es obtener información significativa para respaldar la toma de decisiones informadas en la industria de la aviación.

### Proceso ETL

El proceso ETL incluyó los siguientes pasos clave:
- Extracción por bloques de los datos originales
- Traducción y exportación de archivos a formatos .csv y .xlsx
- Extracción hacia una base de datos utilizando un modelo multidimensional

### Análisis de Datos

Se utilizó Power BI como herramienta principal para el análisis visual de los datos. Los puntos focales del análisis incluyen:
- Satisfacción del cliente
- Evaluaciones de vuelos
- Perfil de los clientes (tipo de cliente, tipo de viaje, clase)
- Factores que influyen en la satisfacción (tiempo de vuelo, wifi, servicio a bordo, limpieza)

### Resultados Clave

- Se identificaron áreas de mejora en los servicios ofrecidos por las aerolíneas
- Se establecieron relaciones entre el perfil del cliente y su nivel de satisfacción
- Se visualizaron datos tanto generales como específicos para facilitar la toma de decisiones

## Documentación del Código ETL

### Funciones Principales

- `traducir_texto`: Traduce texto utilizando Google Translator
- `merge_and_concat`: Fusiona y concatena fragmentos de DataFrames
- `reemplazar_valores`: Reemplaza valores en un DataFrame según mapeos especificados

### Transformaciones Realizadas

- Traducción de columnas
- Conversión de DataFrames a CSV
- Cruzamiento de DataFrames basado en 'Número De Vuelo'
- Eliminación de columnas con valores repetidos
- Eliminación de valores nulos

### Carga a PostgreSQL

Se realizó la carga de los datos transformados a una base de datos PostgreSQL.

## Análisis en Power BI

Se crearon varios dashboards en Power BI para visualizar diferentes aspectos de los datos:

1. General: Visión general de vuelos y clientes por aerolínea
2. Vuelos: Análisis de tiempos de vuelo y evaluaciones
3. Satisfacción: Evaluación de la satisfacción del cliente
4. Clientes: Información detallada sobre los perfiles de clientes
5. Ubicaciones: Detalles sobre aeródromos y frecuencia de vuelos

## Conclusión

Este proyecto demuestra la importancia de un análisis detallado de datos en la industria de la aviación. La combinación de un proceso ETL robusto con herramientas de visualización como Power BI permite obtener insights valiosos para mejorar la satisfacción del cliente y optimizar las operaciones de las aerolíneas.

## Tiempo de Procesamiento

| Operación | Air ports | Airline | Flights | Passenger Evaluation | Crossing |
|-----------|-----------|---------|---------|----------------------|----------|
| Lectura   | 0.00299s  | 0.00199s| 15.3912s| 0.23989s             | 13.4594s |
| Operaciones| 1.68013s | 0.00099s| 84.4986s| 43.7321s             | 1.01254s |
| Carga SQL | 1.66814s  | 0.04986s| 0s      | 0s                   | 108.755s |
| Total     | 3.35126s  | 0.05284s| 99.8899s| 43.9719s             | 123.226s |
