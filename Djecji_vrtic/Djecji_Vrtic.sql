use master;
drop database if exists DjecjiVrtic;
go
create database DjecjiVrtic;
go
use DjecjiVrtic;


create table skupina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	odgajateljica int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25),
	skupina int
);

create table odgajateljica(
	sifra int not null primary key identity(1,1),
	ime varchar(25) not null,
	prezime varchar(25) not null,
	strucnasprema int
);

create table strucnasprema(
	sifra int not null primary key identity(1,1),
	naziv varchar(50)
	
);

alter table odgajateljica add foreign key (strucnasprema) references strucnasprema(sifra);