use master;
drop database if exists osnovna_skola;
go
create database osnovna_skola;
go
use osnovna_skola;


create table radionica(
	sifra int not null primary key identity(1,1),
	naziv varchar(15),
	uciteljica int
);

create table dijete(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table uciteljica(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	oib char(11)
);

create table radionica_dijete(
	sifra int not null primary key identity(1,1),
	radionica int,
	dijete int

);