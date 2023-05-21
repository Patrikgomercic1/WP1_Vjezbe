use master;
drop database if exists doktorska_ordinacija;
go
create database doktorska_ordinacija;
go
use doktorska_ordinacija;


create table pacijent(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int,
	osiguranje varchar(30)
);

create table medicinska_sestra(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table doktor(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table lijeèenje(
	sifra int not null primary key identity(1,1),
	datum datetime,
	pacijent int,
	medicinska_sestra int,
	doktor int

);