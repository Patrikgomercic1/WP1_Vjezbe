use master;
drop database if exists taksi_sluzba;
go
create database taksi_sluzba;
go
use taksi_sluzba;


create table vozilo(
	sifra int not null primary key identity(1,1),
	oznaka varchar(20),
	marka varchar(30)
);

create table vozac(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int
);

create table putnik(
	sifra int not null primary key identity(1,1),
	lokacija varchar(50),
	kontakt varchar(20),
);

create table voznja(
	sifra int not null primary key identity(1,1),
	trajanje datetime,
	cijena decimal(8,2)
);

create table voznja_putnik(
	sifra int not null primary key identity(1,1),
	voznja int,
	putnik int
);