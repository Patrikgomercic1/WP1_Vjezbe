use master;
drop database if exists odvjetnik;
go
create database odvjetnik;
go
use odvjetnik;


create table klijent(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	optužba varchar(30)
);

create table obrana(
	sifra int not null primary key identity(1,1),
	kazneno_djelo varchar(30), 
	datum datetime,
	klijent int,
	suradnik int
);

create table suradnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20),
	prezime varchar(20),
	firma varchar(40)
);