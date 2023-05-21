use master;
drop database if exists djecja_igraonica;
go
create database djecja_igraonica;
go
use djecja_igraonica;


create table skupina(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	teta int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25)
);

create table teta(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25)
);

create table dijete_skupina(
	dijete int,
	skupina int
);