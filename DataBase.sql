drop table if exists d_aeropuerto cascade;
drop table if exists d_aerolinea cascade;
drop table if exists "crossingETL" cascade;
drop table if exists h_vuelos cascade;
drop table if exists d_pasajeros cascade;

select * from d_aeropuerto;
select * from d_aerolinea;
select * from h_vuelos;
select * from d_pasajeros;

-- Eliminación de indices por defecto, renombrar id de la entidad y modificar a tipo primary key las id
alter table d_aeropuerto drop column index;
alter table d_aeropuerto rename column "Codigo_De_Aeropuerto" to id_aeropuerto;
alter table d_aeropuerto add primary key(id_aeropuerto);

alter table d_aerolinea drop column index;
alter table d_aerolinea rename column "Codigo De La Aerolinea" to id_aerolinea;
alter table d_aerolinea add primary key(id_aerolinea);

select * from "crossingETL";

-- Creación de estructura de tabla para la tabla de hechos de vuelos
create table h_vuelos(
	id_vuelo int primary key,
	id_aerolinea text references d_aerolinea(id_aerolinea),
	aeropuerto_origen text references d_aeropuerto(id_aeropuerto),
	aeropuerto_destino text references d_aeropuerto(id_aeropuerto),
	numero_vuelo int,
	año int, mes int, dia int,
	matricula text,
	hora_salida text,
	tiempo_programado text,
	tiempo_transcurrido text,
	tiempo_en_el_aire text,
	distancia text,
	llegada_programada text,
	hora_llegada text,
	desviado text,
	cancelado text
);

-- Creación de estructura de tabla para la tabla de dimension de pasajeros
create table d_pasajeros(
	id_pasajero int primary key,
	id_vuelo int references h_vuelos(id_vuelo),
	numero_vuelo int,
	genero text,
	tipo_cliente text,
	edad int,
	tipo_viaje text,
	clase text,
	distancia_vuelo text,
	retraso_salida text,
	retraso_llegada text,
	satisfaccion text
);

-- Se insertan los datos a las tablas estructuradas separadas a partir del archivo de Crossing para la tabla de hechos y de dimension
insert into h_vuelos(select index,"Aerolínea","Código Del Aeropuerto Origen:","Aerodromo De Destino","Número De Vuelo","Año","Mes","Día","Matricula",
					 "Hora De Salida","Tiempo Programado","Tiempo Transcurrido","Tiempo En El Aire","Distancia",
					 "Llegada programada","Hora Llegada","Desviado","Cancelado"  from "crossingETL");

insert into d_pasajeros(select index,index,"Número De Vuelo","Género","Tipo De Cliente","Edad","Tipo De Viaje","Clase","Distancia De Vuelo","Retraso De Salida En Minutos",
					   "Retraso De Llegada En Minutos","Satisfacción" from "crossingETL");