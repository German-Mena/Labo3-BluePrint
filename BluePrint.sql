CREATE DATABASE BluePrint
GO

USE BluePrint
GO

CREATE TABLE TiposClientes(
	ID Smallint primary key identity (1,1) not null,
	Nombre varchar(40) not null
)

GO

CREATE TABLE Clientes(
	ID smallint primary key identity (1,1)not null,
	RazonSocial varchar(50) not null unique,
	CUIT varchar(13) not null unique,
	EMail varchar(100) null,
	Telefono varchar(15) null,
	Celular varchar(15) null,
	IDTipo smallint not null foreign key references TiposClientes(ID)
)
GO

CREATE TABLE Proyectos(
	ID smallint primary key identity (1,1) not null,
	IDCliente smallint not null foreign key references Clientes(ID),
	Nombre varchar(100) not null,
	Descripcion varchar (512) null,
	CostoEstimado money not null check ( CostoEstimado > 0),
	FechaInicio Date not null,
	FechaFin Date null,
	Estado bit not null default (1)
)

GO

create table modulos(
	ID smallint identity(1,1),
	proyecto smallint not null,
	nombre nvarchar(60) not null,
	descripcion nvarchar(512),
	horasEstimadas float not null,
	costo money not null,
	fechaInicio date not null,
	fechaFinEstimada date not null,
	fechaFin date not null,
	primary key (ID),
	foreign key (proyecto) references Proyectos(ID) 
)

GO

create table colaboradores(
	ID smallint identity(1,1),
	nombre nvarchar(60) not null,
	apellido nvarchar(60) not null,
	genero varchar(20),
	celular int,
	mail nvarchar(60),
	edad tinyint not null,
	domicilio nvarchar(60),
	ciudad nvarchar(30),
	pais nvarchar(30),
	tipo varchar(1) not null,
	primary key(ID)
)