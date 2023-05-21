use master;
drop database if exists postolar;
go
create database postolar;
go
use postolar;


create table obuca(
	sifra int not null primary key identity(1,1),
	vrsta varchar(20),
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

create table obuca_popravak(
	sifra int not null primary key identity(1,1),
	obuca int,
	popravak int
);