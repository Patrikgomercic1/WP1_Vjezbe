use master;
drop database if exists nakladnik;
go
create database nakladnik;
go
use nakladnik;


create table nakladnik(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	mjesto int
	
);

create table djelo(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	vrsta varchar(25),
	duzina int,
	nakladnik int
);

create table mjesto(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	lokacija varchar(70),
);


alter table nakladnik add foreign key (mjesto) references mjesto(sifra);
alter table djelo add foreign key (nakladnik) references nakladnik(sifra);


insert into mjesto(sifra,naziv,lokacija)
values
	(1,'Hrvatska','Ulica grada Vukovara 226G, 10000 Zagreb'),
	(2,'Hrvatska','Republike Austrije 23, 10000 Zagreb'),
	(3,'Hrvatska','Vladimira Variæaka 6, 10010 Zagreb');

insert into nakladnik(sifra,naziv,mjesto)
values
	(1,'Knižara UM ','1'),
	(2,'Corto Literary','2'),
	(3,'FOKUS na hit','3');

update mjesto set lokacija='Vladimira Variæaka 6, 10000 Zagreb' where sifra=3

--drop database if exists nakladnik;
