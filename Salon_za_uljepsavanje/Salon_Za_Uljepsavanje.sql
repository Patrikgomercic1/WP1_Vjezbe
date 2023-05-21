use master
drop database if exists salonzauljepsavanje;
go
drop database if exists edunovawp1;
go
create database salonzauljepsavanje;
go
use salonzauljepsavanje;


create table djelatnica(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11)
);

create table korisnik(
	sifra int not null primary key identity(1,1),
	spol bit,
	alergija varchar(25) not null
);

create table usluga(
	sifra int not null primary key identity(1,1),
	naziv varchar(20) not null,
	trajanje int,
	cijena int not null
);

create table termin(
	sifra int not null primary key identity(1,1),
	datum datetime,
	korisnik int not null,
	djelatnica int not null,
	usluga int not null
);


alter table termin add foreign key (djelatnica) references djelatnica(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);