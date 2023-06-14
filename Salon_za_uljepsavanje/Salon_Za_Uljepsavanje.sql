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
	naziv varchar(50) not null,
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


insert into usluga(sifra,naziv,trajanje,cijena)
values
	(1,'TRAJNA ŠMINKA','30','106.18'),
	(2,'LED MASKA (OPERA MASKA)','60','50.30'),
	(3,'MEDICINSKA MASAŽA','50','80.10');

insert into korisnik(sifra,spol,alergija)
values
	(1,'0','Lateks'),
	(2,'0','Lješnjak'),
	(3,'1','50',null);

update korisnik set alergija='Prašina' where sifra=3

--drop database if exists salonzauljepsavanje;
