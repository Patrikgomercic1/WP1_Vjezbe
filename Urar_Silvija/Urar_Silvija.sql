use master;
drop database if exists urar_silvija;
go
create database urar_silvija;
go
use urar_silvija;


create table sat(
	sifra int not null primary key identity(1,1),
	vrsta varchar(20),
	marka varchar(30),
	korisnik int,
	brojpopravaka int
);

create table korisnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	kontakt int
);

create table popravak(
	sifra int not null primary key identity(1,1),
	datum datetime,
	cijena decimal(6,2)
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int
);

create table sat_popravak(
	sifra int not null primary key identity(1,1),
	sat int,
	popravak int
);