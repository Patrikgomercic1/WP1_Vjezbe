use master;
drop database if exists klub_citatelja;
go
create database klub_citatelja;
go
use klub_citatelja;


create table citatelj(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25),
	kontakt varchar(25),
	vlasnik int
);

create table knjiga(
	sifra int not null primary key identity(1,1),
	vrsta varchar(25),
	naziv varchar(25),
	duzina int,
	citatelj int
);


alter table citatelj add foreign key (vlasnik) references citatelj(sifra);
alter table knjiga add foreign key (citatelj) references citatelj(sifra);