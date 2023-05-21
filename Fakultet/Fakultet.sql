use master;
drop database if exists fakultet;
go
create database fakultet;
go
use fakultet;


create table student(
	sifra int not null primary key identity(1,1),
	ime varchar(20) not null,
	prezime varchar(20) not null,
	oib char(11)
);

create table kolegij(
	sifra int not null primary key identity(1,1),
	naziv varchar(30),
	trajanje time
);

create table rok(
	sifra int not null primary key identity(1,1),
	datum datetime
);

create table student_rok(
	sifra int not null primary key identity(1,1),
	student int,
	rok int

);