# Proyecto ETL de Aerolíneas

## Resumen Ejecutivo

Este informe ofrece un análisis exhaustivo del proceso de Extracción, Transformación y Carga (ETL) aplicado a los archivos, así como del análisis de datos realizado mediante la herramienta visual Power BI. El objetivo principal ha sido obtener información significativa y respaldar la toma de decisiones informadas.
Durante el proceso de análisis, se priorizó la satisfacción del cliente y se consideraron otros datos relacionados con las evaluaciones de los vuelos. Se identificó que la diferencia entre el tiempo estimado y real del vuelo, así como aspectos como el wifi, el servicio a bordo y la limpieza, influyen en la satisfacción de los clientes, aunque también se reconoció que dichos factores varían según la apreciación individual de cada cliente.
Asimismo, se analizó el perfil de los clientes, incluyendo el tipo de cliente, el tipo de viaje y la clase a la que pertenecen, y se estableció una relación entre estos datos y la satisfacción del cliente. Este análisis permitió identificar áreas de mejora en los servicios ofrecidos por las aerolíneas, con el objetivo de potenciar aquellas que han recibido opiniones negativas.
La aplicación de Power BI ha sido crucial para visualizar la información recopilada y procesada durante el proceso ETL. Las herramientas visuales, como gráficos y tablas, han facilitado la comprensión tanto de los datos generales como de los detalles específicos, lo que ha permitido tomar decisiones informadas en base a la información visualizada.
El proceso de ETL aplicado a los archivos y el análisis de datos mediante Power BI han brindado una visión clara y detallada de la información recopilada. El enfoque en la satisfacción del cliente y la identificación de áreas de mejora han sido fundamentales para impulsar la toma de decisiones estratégicas. El uso de herramientas visuales ha enriquecido el proceso de análisis y ha facilitado la comprensión de la información, fortaleciendo así la capacidad para en un futuro tomar decisiones informadas y mejorar los servicios de las aerolíneas.

## Documentación Código ETL

### Carga de datos

![Carga de datos](/imgs/carga_de_datos.png)

### Funciones

- traducir_texto: Esta función es utilizada para traducir un texto recibido como parámetro a través de Google Translator obteniendo el texto ya traducido al español.
- merge_and_concat: Esta función recibe una lista de "chunks" (fragmentos) de DataFrames como entrada y realiza dos operaciones principales: la fusión de cada fragmento con otro DataFrame utilizando una columna común como clave de unión y la concatenación de todos los fragmentos en un solo DataFrame.
- reemplazar_valores: Esta función toma como entrada un DataFrame y una lista de mapeos que contienen información sobre las columnas y los valores que se deben reemplazar en esas columnas.

foto

### Traducción de columnas manualmente

Se traducen individualmente las columnas no detectadas por la librería para que no ocurran problemas en el análisis.

foto

### Convertir DataFrame de ETL Passenger a CSV

Se reemplazan valores en un DataFrame aplicando la función anteriormente mencionada, actualiza los nombres de columna capitalizando la primera letra de cada palabra, configura la visualización para mostrar todas las columnas y luego se guarda el DataFrame en un archivo CSV.

foto

### Convertir Dataframe de ETL Flights a CSV

Se realiza una serie de transformaciones en un DataFrame aplicando la función traducir_texto anteriormente mencionado. Reemplaza los nombres de columna por sus traducciones, capitaliza la primera letra de cada nombre de columna, renombra columnas específicas, elimina las columnas no deseadas para el análisis de datos, configura la visualización para mostrar todas las columnas y finalmente guarda el DataFrame resultante en un archivo CSV.

foto

### Convertir Dataframe de ETL Airline a CSV

En este caso, se renombran las columnas del DataFrame cambiando 'IATA_CODE' a 'CODIGO DE LA AEROLINEA' y 'AIRLINE' a 'AEROLINEA'. Luego, capitaliza la primera letra de cada nombre de columna y finalmente guarda el DataFrame resultante en un archivo CSV llamado "airlineETL.csv".

foto

### Convertir Dataframe de ETL Airport a CSV

Para finalizar las transformaciones, se realiza una serie de transformaciones en el DataFrame Cambia el nombre de la columna 'IATA_CODE' a 'CODIGO DE AEROPUERTO', realiza la traducción de los nombres de columna, capitaliza la primera letra de cada nombre de columna, elimina las columnas 'Latitud' y 'Longitud', y finalmente guarda el DataFrame resultante en un archivo CSV llamado "airPortsETL.csv".

### Cruzamiento de DataFrames en base a la Columna 'Número De Vuelo

Se realiza una copia del DataFrame1 para luego comenzar con una fusión iterativa de DataFrames utilizando bucles anidados. Se fusionan fragmentos de DataFrames basados en la columna 'Número De Vuelo'. El proceso permite combinar eficientemente los datos de múltiples fragmentos en un único DataFrame consolidado.

### Eliminar columnas con valores repetidos

Se realiza una serie de operaciones en el DataFrame merged_chunk. Se eliminan las columnas 'Retraso de partida', 'Retraso En La Llegada', 'Id' y 'Ruedas Apagadas' del DataFrame.

### Eliminar valores nulos y transformar ETL Crossing a CSV

Se elimina las filas que contienen valores nulos en el DataFrame merged_chunk, configura la opción para mostrar todas las columnas y guarda el DataFrame resultante en un archivo Excel.

### Subir ETL a PostgreSQL

#### ETL Air ports

foto

#### ETL Airline

foto

#### ETL Crossing

foto

### Cambios a tablas en PostgreSQL

foto

## Tuplas modificadas o eliminadas

### Airports

Se eliminan las columnas de “Latitud” y “Longitud”, ya que no las consideramos relevantes para el análisis.

| **Dataset**          | **Cantidad** |
| -------------------- | ------------ |
| Cantidad de datos    | 2.254        |
| Cantidad de columnas | 7            |
| Cantidad de filas    | 322          |
| Columnas eliminadas  | 2            |
| Tuplas eliminadas    | 0            |

### Airlines

Se mantienen todos los datos, al ser datos básicos de la Aerolínea.

| **Dataset**          | **Cantidad** |
| -------------------- | ------------ |
| Cantidad de datos    | 28           |
| Cantidad de columnas | 2            |
| Cantidad de filas    | 14           |
| Columnas eliminadas  | 0            |
| Tuplas eliminadas    | 0            |

### Flights

Se eliminan 5 columnas, "Dia de la semana", "Taxi fuera", "Taxi en", "Ruedas encendidas" y "Salida programada", que tal como sus nombres indican para algunas no son relevantes para el análisis y para las demás, ya se tiene la misma información indicada de otra forma la cual será suficiente, donde de la misma forma se reducirá la carga de la información del archivo.

| **Dataset**          | **Cantidad** |
| -------------------- | ------------ |
| Cantidad de datos    | 145.476.975  |
| Cantidad de columnas | 25           |
| Cantidad de filas    | 5.819.079    |
| Columnas eliminadas  | 5            |
| Tuplas eliminadas    | 0            |

### Passenger Evaluation

Se mantienen todos los datos, ya que en su mayoría son datos del pasajero y notas de satisfacción de acuerdo al servicio proporcionado por parte de las aerolíneas.

| **Dataset**          | **Cantidad** |
| -------------------- | ------------ |
| Cantidad de datos    | 3.247.000    |
| Cantidad de columnas | 25           |
| Cantidad de filas    | 129.880      |
| Columnas eliminadas  | 0            |
| Tuplas eliminadas    | 0            |

### Crossing

Para el cruzamiento se eliminan 4 columnas que están repetidas y/o son irrelevantes para el análisis según nuestro criterio. Por otra parte, para las tuplas se realizó una eliminación de todas las que tengan valores nulos, ya que eso significará que no tienen coincidencias de alguna información, por lo tanto, serán tuplas que no se considerarán para el análisis de la información final.

| **Dataset**          | **Cantidad** |
| -------------------- | ------------ |
| Cantidad de datos    | 8.378.524    |
| Cantidad de columnas | 44           |
| Cantidad de filas    | 190.421      |
| Columnas eliminadas  | 4            |
| Tuplas eliminadas    | 4.140        |

## Tiempo de procesamiento

### ETL Air Ports

| Operación              | Tiempo (s)  |
| ---------------------- | ----------- |
| Lectura de archivo     | 0,00299     |
| Operaciones realizadas | 1,68013     |
| Carga a PostgreSQL     | 1,66814     |
| **Tiempo total**       | **3,35126** |

### ETL Airline

| Operación              | Tiempo (s)  |
| ---------------------- | ----------- |
| Lectura de archivo     | 0,00199     |
| Operaciones realizadas | 0,00099     |
| Carga a PostgreSQL     | 0,04986     |
| **Tiempo total**       | **0,05284** |

### ETL Flights

| Operación              | Tiempo (s)  |
| ---------------------- | ----------- |
| Lectura de archivo     | 15,3912     |
| Operaciones realizadas | 84,4986     |
| Carga a PostgreSQL     | 0           |
| **Tiempo total**       | **99,8899** |

### ETL Passenger Evaluation

| Operación              | Tiempo (s)  |
| ---------------------- | ----------- |
| Lectura de archivo     | 0,23989     |
| Operaciones realizadas | 43,7321     |
| Carga a PostgreSQL     | 0           |
| **Tiempo total**       | **43,9719** |

> **Observación:** Para las anteriores 2 tablas de procesamiento, en la fila de carga a PostgreSQL, se mantienen en 0 por el hecho que no se hace la carga directamente desde esos archivos, sino del cruzamiento que se realiza y a partir del archivo resultante de ellos.

### ETL Crossing

| Operación              | Tiempo (s)  |
| ---------------------- | ----------- |
| Lectura de archivo     | 13,4594     |
| Operaciones realizadas | 1,01254     |
| Carga a PostgreSQL     | 108,755     |
| **Tiempo total**       | **123,226** |

## Gráficos y vistas

### General

Se puede visualizar un análisis general de las partes más importantes del análisis de datos. Como puntos fuertes a evaluar en este dashboard es la cantidad de vuelos que realiza una aerolínea, la cantidad de clientes que tiene cada tipo de cliente y la cantidad de vuelos por aerolíneas.
Además, en el apartado de cantidades de clientes por vuelo se realizó un Top 10 para ayudar un poco el análisis.

foto

### Vuelos

En este dashboard se evalúan los tiempos de vuelos de las aerolíneas y las cantidades de evaluaciones que tuvieron esos vuelos, además se añadió la opción de poder visualizar la razón de viaje, si es viaje personal o de trabajo, para así saber el tipo de viaje con respecto a la cantidad de horas de vuelo que se llega a hacer por trabajo.

foto

### Satisfacción

Consiste en evaluar la satisfacción que tuvieron los clientes en el viaje que realizaron, en la clase que viajaron y la aerolínea que utilizaron.

foto

### Clientes

Se detalla toda la información relevante de los clientes, la clase que utiliza, el tipo de vuelo que hace y el tipo de cliente que es con respecto al viaje que realizó.

foto

### Ubicaciones

Detalla las ubicaciones exactas de cada aeródromo y un Top 10 de los aeródromos que más vuelos realizaron.

foto

## Diagrama de base de datos

3 Tablas como Dimensión y 1 de Hechos, con modelo de forma estrella.

foto
