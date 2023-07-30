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
	cijena decimal(6,2),
	segrt int
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11),
	kontakt int
);

create table sat_popravak(
	sat int,
	popravak int
);


alter table sat_popravak add foreign key (sat) references sat(sifra);
alter table sat_popravak add foreign key (popravak) references popravak(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);
alter table sat add foreign key (korisnik) references korisnik(sifra);


insert into korisnik(sifra,ime,prezime,kontakt)
values
	(1,'Anamarija','Mariæ','0912548563'),
	(2,'Mate','Matiæ','0955825145'),
	(3,'Hrvoje','Horvat','092354506');

insert into popravak(sifra,datum,cijena,segrt)
values
	(1,'2022-02-02','19.99',null),
	(2,'2023-12-06','24.99',null),
	(3,'2021-08-26','50.10',null);

update korisnik set kontakt='092384126' where sifra=3

--drop database if exists urar_silvija;
