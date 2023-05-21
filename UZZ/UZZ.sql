use master;
drop database if exists UdrugaZaZastituZivotinja;
go
create database UdrugaZaZastituZivotinja collate Croatian_CI_AS;
go
use UdrugaZaZastituZivotinja;

create table djelatnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11)
);

create table životinja(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	vrsta varchar(40) not null,
	starost int
);

create table prostor(
	sifra int not null primary key identity(1,1),
	dimenzije decimal(20,2),
	lokacija varchar(30),
	naziv varchar(30)
);

create table djelatnik_prostor(
	djelatnik int,
	prostor int
);