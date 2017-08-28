--Diseño de base de datos
create table articulos
  (
    articuloid serial primary key,
    nombre text
  );

create table lugar
  (
    lugarid serial primary key,
    nombre text
  );

create table compra
  (
    compraid serial primary key,
    lugarid integer references lugar(lugarid),
    fecha date
  );

create table unidad
  (
    unidadid serial primary key,
    nombre text
  );

create table detalle
  (
    detalleid serial primary key,
    compraid integer references compra(compraid),
    articuloid integer references articulos(articuloid),
    unidadid integer references unidad(unidadid),
    cantidad numeric,
    precio numeric
  );
