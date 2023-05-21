use master;
drop database if exists nakladnik;
go
create database nakladnik;
go
use nakladnik;


create table nakladnik(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	
);

create table djelo(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	vrsta varchar(25),
	duzina int
);

create table mjesto(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	lokacija varchar(30),
	nakladnik int
);