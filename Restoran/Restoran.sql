use master;
drop database if exists restoran;
go
create database restoran;
go
use restoran;


create table kategorija(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	jelo int
);

create table jelo(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	cijena decimal(6,2), 
	sastojci varchar(50),
	velièina varchar(15)
);

create table pice(
	sifra int not null primary key identity(1,1),
	naziv varchar(25),
	cijena decimal(6,2),
	volumen decimal(3,2) 
);

create table jelo_pice(
	sifra int not null primary key identity(1,1),
	jelo int,
	pice int
);