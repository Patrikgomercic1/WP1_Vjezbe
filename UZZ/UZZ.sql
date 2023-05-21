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
	�ivotinja int
);

create table �ivotinja(
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

create table �ivotinja_prostor(
	�ivotinja int,
	prostor int
);


alter table �ivotinja_prostor add foreign key (�ivotinja) references �ivotinja(sifra);
alter table �ivotinja_prostor add foreign key (prostor) references prostor(sifra);
alter table djelatnik add foreign key (�ivotinja) references �ivotinja(sifra);