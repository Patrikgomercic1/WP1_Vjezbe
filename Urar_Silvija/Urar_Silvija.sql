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