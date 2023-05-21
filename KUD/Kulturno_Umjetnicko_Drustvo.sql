use master;
drop database if exists kulturno_umjetnicko_drustvo;
go
create database kulturno_umjetnicko_drustvo;
go
use kulturno_umjetnicko_drustvo;


create table clan(
	sifra int not null primary key identity(1,1),
	ime varchar(25),
	prezime varchar(25)
);

create table nastup(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	datum datetime,
	mjesto int
);

create table mjesto(
	sifra int not null primary key identity(1,1),
	adresa varchar(30)
);

create table clan_nastup(
	clan int,
	nastup int
);