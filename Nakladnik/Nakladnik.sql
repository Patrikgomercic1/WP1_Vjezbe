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
	lokacija varchar(30),
);


alter table nakladnik add foreign key (mjesto) references mjesto(sifra);
alter table djelo add foreign key (nakladnik) references nakladnik(sifra);