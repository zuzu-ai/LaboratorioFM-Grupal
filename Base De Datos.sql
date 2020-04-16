create database LabFM;
use  LabFM;

create table Clientes(
Tarjeta_C int primary key auto_increment,
Nombre_C varchar(60) not null,
Dpi_C int not null,
Tel_C int not null,
Direccion_C varchar(60) not null,
Correo_C varchar(60) not null,
Mora_Acum decimal(10,2) not null,
Renta_Acum decimal(10,2) not null,
Bonos_Acum int not null
)engine=innodb;

create table Articulos(
Codigo_A int primary key auto_increment
)engine=innodb;

create table Peliculas(
Codigo_P int primary key auto_increment,
Codigo_A int not null,
Nombre_P varchar(60) not null,
Autor_P varchar(60) not null,
Genero_P varchar(60) not null,
Clasificacion_P varchar(60) not null,
Duracion_P time not null,
Precio_P decimal(10,2) not null,
Existencia int not null,
Tipo_A varchar(1) default'P',

foreign key (Codigo_A) references
Articulos(Codigo_A)
)engine=Innodb;

create table Juegos(
Codigo_V int primary key auto_increment,
Codigo_A int not null,
Nombre_V varchar(60) not null,
Genero_V varchar(60) not null,
Precio_V decimal(10,2) not null,
Existencia int not null,
Tipo_A varchar(1) default'V',

foreign key (Codigo_A) references
Articulos(Codigo_A)
)engine=innodb;

create table Empleados(
Codigo_E int primary key auto_increment,
Nombre_E varchar(60) not null,
Estado_E varchar(1) not null
)Engine=Innodb;

create table Rentas(
Codigo_R int primary key auto_increment,
Tarjeta_C int not null,
Codigo_A int not null,
Cantidad_A int not null,
Total_R decimal(10,2) not null,
Mora decimal(10,2) not null,
Fecha_Inico datetime not null,
Fecha_Vencimiento datetime not null,

foreign key (Tarjeta_C) references
Clientes(Tarjeta_C),
foreign key (Codigo_A) references
Articulos(Codigo_A)
)engine=Innodb;

create table Devoluciones(
Codigo_D int primary key,
Codigo_R int not null,
Fecha_D datetime not null,

foreign key (Codigo_R) references
Rentas(Codigo_R)
)engine=Innodb;

create table Tiendas(
Codigo_T int primary key auto_increment,
Nombre_T varchar(60) not null,
Ubicacion_T varchar(60) not null,
Estado varchar(1) not null,
Codigo_E int not null,

foreign key (Codigo_E) references
Empleados(Codigo_E)
)engine=Innodb;

drop database LabFM;