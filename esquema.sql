create table articulo
(
  id serial primary key,
  nombre text
);

create table lugar
(
  id serial primary key,
  nombre text
);

create table compra
(
  id serial primary key,
  lugar integer references lugar(id),
  fecha date
);

create table unidad
(
  id serial primary key,
  nombre text
);

create table detalle
(
  id serial primary key,
  compra integer references compra(id),
  articulo integer references articulo(id),
  unidad integer references unidad(id),
  cantidad numeric,
  precio numeric,
  caducidad date,
  fecharegistro date default current_date
);
