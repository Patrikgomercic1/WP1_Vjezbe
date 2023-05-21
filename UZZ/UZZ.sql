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
	oib char(11),
	životinja int
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

create table životinja_prostor(
	životinja int,
	prostor int
);


alter table životinja_prostor add foreign key (životinja) references životinja(sifra);
alter table životinja_prostor add foreign key (prostor) references prostor(sifra);
alter table djelatnik add foreign key (životinja) references životinja(sifra);