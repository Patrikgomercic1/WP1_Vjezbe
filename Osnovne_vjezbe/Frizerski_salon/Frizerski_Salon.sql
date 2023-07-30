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


insert into djelatnica(sifra,ime,prezime,oib)
values
	(1,'Jasmina','Barović','21359285952'),
	(2,'Ema','Rebić','12583304987'),
	(3,'Mia','Katić','88953325147');

insert into korisnik(sifra,ime,prezime,spol)
values
	(1,'Marko','Barić','1'),
	(2,'Matija','Stojić','1'),
	(3,'Mirta','Bartolović','0');


update djelatnica set oib='88953325145' where sifra=3

--drop database if exists frizerskisalon;
