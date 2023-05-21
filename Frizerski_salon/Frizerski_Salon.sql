use master;
drop database if exists frizerskisalon;
go
create database frizerskisalon;
go
use frizerskisalon;


create table djelatnica(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null, 
	oib char(11)
);

create table korisnik(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	spol bit
);

create table usluga(
	sifra int not null primary key identity(1,1),
	naziv varchar(20) not null,
	trajanje int,
	cijena int
);

create table termin(
	sifra int not null primary key identity(1,1),
	datum datetime,
	djelatnica int,
	korisnik int, 
	usluga int
);


alter table termin add foreign key (djelatnica) references djelatnica(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);