use master;
drop database if exists vodoinstalater;
go
create database vodoinstalater;
go
use vodoinstalater;


create table kvar(
	sifra int not null primary key identity(1,1),
	vrsta varchar(25),
	kolièina int
);

create table popravak(
	sifra int not null primary key identity(1,1),
	trajanje datetime,
	cijena decimal(6,2),
	segrt int
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime decimal(6,2),
	oib char(11),
	iskustvo varchar(20)
);

create table kvar_popravak(
	kvar int,
	popravak int
);